# This file is used by Rack-based servers to start the application.
require_relative 'config/environment'
require_relative 'slack_bot/slack_bot'

Thread.abort_on_exception = true
Thread.new do
  SlackBot.run
end

run Rails.application
