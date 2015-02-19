class Comment < ActiveRecord::Base
  belongs_to :article
  # the line belongs_to :article, which sets up an Active Record association. many to one relationship
  #These two declarations (belongs_to and has_many, in comment.rb and article.rb) enable a good bit of automatic behavior. For example, if you have an instance variable @article containing an article, you can retrieve all the comments belonging to that article as an array using @article.comments.

  
end
