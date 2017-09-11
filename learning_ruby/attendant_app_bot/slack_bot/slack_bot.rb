ENV['SLACK_API_TOKEN'] = "xoxb-228826977254-DyP00VE1dY8WefyjQHmaxOCP"
class PongBot < SlackRubyBot::Bot
  ENV['SLACK_API_TOKEN'] = "xoxb-228826977254-DyP00VE1dY8WefyjQHmaxOCP"
  match 'present' do |client, data, match|

    user_id = "#{data[:user]}"
    Attendee.create(username: "#{client.users[user_id]['name']}",entry_time: Time.now )
    client.say(text: "Marked #{client.users[user_id]['name']} as present at #{Time.now}", channel: data.channel)
  end
  match 'exit' do |client, data, match|

    user_id = "#{data[:user]}"
    a = Attendee.where(username: "#{client.users[user_id]['name']}" ).last
    a.update_attributes(exit_time: Time.now)
    client.say(text: "Marked #{client.users[user_id]['name']} exited at #{Time.now}", channel: data.channel)
  end
  command 'ping' do |client, data, match|


    client.say(text: 'pong', channel: data.channel)
  end
end

PongBot.run
