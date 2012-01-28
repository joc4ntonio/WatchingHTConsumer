#TweetStream Configuration

require 'tweetstream'
require_relative 'tweet_keeper'

creds = {}
File.open(Rails.root.join('config','twitter_creds.yml')) do |fd|
  creds = YAML::load(fd)
end
auth = creds['twitter']
TweetStream.configure do |config|
   config.consumer_key = auth['consumer_key']
   config.consumer_secret = auth['consumer_secret']
   config.oauth_token = auth['oauth_token']
   config.oauth_token_secret = auth['oauth_token_secre']
   config.auth_method = :oauth
   config.parser = :yajl
end
    
KEEPER = TweetSave.new
client = TweetStream::Client.new

client.track('#watching') do |status|
    KEEPER.grabar(
      :id_str => status[:id_str],
      :text => status.text,
      :created_at => status.created_at,
      :received_at => Time.new.to_i
    )
end
