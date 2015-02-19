# inherits from Active Record. Active Record supplies a great deal of functionality to your Rails models for free, including basic database CRUD (Create, Read, Update, Destroy) operations, data validation, as well as sophisticated search support and the ability to relate multiple models to one another.
class Article < ActiveRecord::Base
	# validates that all articles have titles at least five characters long
	validates :title, presence:true, length: {minimum: 5}
	#one to many association 
	has_many :comments
  	#These two declarations (belongs_to and has_many, in comment.rb and article.rb) enable a good bit of automatic behavior. For example, if you have an instance variable @article containing an article, you can retrieve all the comments belonging to that article as an array using @article.comments.
end
