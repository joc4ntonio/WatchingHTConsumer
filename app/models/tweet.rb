class Tweet
  include MongoMapper::Document
  
  key :id_str, String
	key	:texto, String
	key :created_at, String
	key :received_at, Integer
	
	validates_presence_of :id_str
	validates_presence_of :texto
	validates_presence_of :created_at
	validates_presence_of :received_at
	#key :show_id, ObjectId
	
	#many :shows
	
	#def find_by_show_id(self.)
		
	#end

end
