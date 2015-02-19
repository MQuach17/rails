class CommentsController < ApplicationController
	def create
	#Each request for a comment has to keep track of the article to which the comment is attached, thus the initial call to the find method of the Article model to get the article in question.
		@article = Article.find(params[:article_id])
		@comment = @article.comments.create(comment_params)
		#We use the create method on @article.comments to create and save the comment. This will automatically link the comment so that it belongs to that particular article.
		redirect_to article_path(@article)
		#redirects to articles/show.html.erb, go wire that up

	end
	private
		def comment_params
			params.require(:comment).permit(:commenter, :body)
			
		end

end
