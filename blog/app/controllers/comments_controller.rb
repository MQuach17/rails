class CommentsController < ApplicationController
	def create
	#Each request for a comment has to keep track of the article to which the comment is attached, thus the initial call to the find method of the Article model to get the article in question.
		@article = Article.find(params[:article_id])
		@comment = @article.comments.create(comment_params)
		#We use the create method on @article.comments to create and save the comment. This will automatically link the comment so that it belongs to that particular article.
		redirect_to article_path(@article)
		#redirects to articles/show.html.erb, go wire that up

	end

	# delete
	def destroy
		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:id])
		@comment.destroy
		redirect_to article_path(@article)
		#The destroy action will find the article we are looking at, locate the comment within the @article.comments collection, and then remove it from the database and send us back to the show action for the article.
	end

	#We also want to allow only authenticated users to delete comments, Two popular authentication add-ons for Rails are the Devise rails engine and the Authlogic gem, along with a number of others.
	http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

	private
		def comment_params
			params.require(:comment).permit(:commenter, :body)
			
		end

end
