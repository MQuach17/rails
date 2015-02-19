# inherits from Active Record. Active Record supplies a great deal of functionality to your Rails models for free, including basic database CRUD (Create, Read, Update, Destroy) operations, data validation, as well as sophisticated search support and the ability to relate multiple models to one another.
class Article < ActiveRecord::Base
	# validates that all articles have titles at least five characters long
	validates :title, presence:true, length: {minimum: 5}
end
