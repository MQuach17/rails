class ArticlesController < ApplicationController
	#define ‘new’ method for articles controller
	#will throw a missing template error, go make it!
		def new
			@article = Article.new #create a new instance variable called @article
		end #end new
	
	#define ‘create’ method for articles controller
	#error: a template is missing. That's ok, we can ignore that for now. What the 		
	#create action should be doing is saving our new article to the database.
		def create

	#The render method here is taking a very simple hash with a key of plain and value of params[:article].inspect. The params 
	#method is the object which represents the parameters (or fields) coming in from the form. The params method returns an 
	#ActiveSupport::HashWithIndifferentAccess object, which allows you to access the keys of the hash using either strings or 
	#symbols. In this situation, the only parameters that matter are the ones from the form.

	#uncomment to display article params
	#render plain: params[:article].inspect

	#create action to use the new Article model to save the data in the database
		#initialization of new article model(aka record) with it's respective attributes, see above for param display. Class names in Ruby must begin with a capital letter

			#@article = Article.new(params[:article])#this line will break, due to 'strong parameters'

		#We have to whitelist our controller parameters to prevent wrongful mass assignment. In this case, we want to both allow and require the title and text parameters for valid use of create. The syntax for this introduces require and permit. The change will involve one line in the create action	
			@article = Article.new(article_params)

		#save model in database if it passes validation in models/articles.rb, else render 'new'
			if @article.save
				redirect_to @article #if passes show the article back to the user
			else
		#Notice that inside the create action we use render instead of redirect_to when save returns false. The render method is used so that the @article object is passed back to the new template when it is rendered. This rendering is done within the same request as the form submission, whereas the redirect_to will tell the browser to issue another request.		
				render 'new'
			end #end if	


		end#end create
		#A frequent practice is to place the standard CRUD actions in each controller in the following order: index, show, new, edit, create, update and destroy. bit for this exercise I will create them in the order of the tut

		def show #used by GET
			@article = Article.find(params[:id])
		#params[:id] is the id of the article from the request
		#instance veriable prefixed with @ to hold a reference to the article object. We do this because ****Rails will pass all instance variables to the view***
		#after the line above, we need to create a view template in views/articles/show.html.erb

		end#end show

		def index
			@articles = Article.all #then add an index view in app/views/articles/index.html.erb
		end #end index

		def edit #to update articles
			@article = Article.find(params[:id])#then add an edit view in app/views/articles/edit.html.erb
		end


		#The new method, update, is used when you want to update a record that already exists, and it accepts a hash containing the attributes that you want to update. As before, if there was an error updating the article we want to show the form back to the user.
		def update
			@article = Article.find(params[:id])

			#You don't need to pass all attributes to update. For example, if you'd call @article.update(title: 'A new title') Rails would only update the title attribute, leaving all other attributes untouched.
			if @article.update(article_params)
				redirect_to @article
			else
				render 'edit'
			end #end if
			
		end#end update

		#Destroy method
		def destroy
			@article=Article.find(params[:id])
			@article.destroy
			redirect_to articles_path
		end

		private#private method to ensure params cannot be accessed outside its intended context
			def article_params
				params.require(:article).permit(:title,:text)
			end

end #end controller class