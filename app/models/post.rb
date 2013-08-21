class Post < ActiveRecord::Base
	#attr_reader :title
	has_many :microposts
    validates :title, presence: true,
    				uniqueness: true,
    				    length: { minimum: 5, maximum: 10 },	
    				    format: {
    				      with: /\A[a-zA-Z0-9\-\_]+\Z/
    				  	}


   	validates :text, presence: true,
    				   length: { minimum: 10, maximum: 1000}
end
