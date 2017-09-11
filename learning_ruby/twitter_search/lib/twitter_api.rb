class TwitterApi
  def self.find_tweets(word)
    client.search("#{word}" , exclude_replies: true , include_rts: false).take(50).collect
  end
  def self.client
       @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = 'DDSPe6iZneBD0KtruhGc6LZdk'
      config.consumer_secret     = 'kFKtMBvFNFZv5zHXg2EwomOR8NtkNI9zH2lBFq6LbZa13Ocweu'
    end
  end
end
