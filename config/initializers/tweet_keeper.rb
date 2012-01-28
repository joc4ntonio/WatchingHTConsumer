require 'mongo_mapper'
require Rails.root.join('app', 'models', 'tweet.rb')

class TweetSave

	def grabar(tweetinfo)
		Tweet.create(tweetinfo)
	end
	
	#def borrar(tweetinfo)
		
	#end
	
end
