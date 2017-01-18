class ArticlesController < ApplicationController
#  include ArticlesHelper #it could be in a private method
before_filter :require_login, only: [:new, :create, :edit, :update, :destroy]

	def index
		@articles = Article.all
	end
	
	def show
		@article = Article.find(params[:id])	
		@comment = Comment.new
		@comment.article_id = @article_id
	end

	def new
		@article = Article.new #(article_params)
	end	
	
	def create
		@article = Article.new(article_params)
		@article.save

		flash.notice = "Article '#{@article.title}' created!"
		
		redirect_to article_path(@article)
	end
	
	def destroy
		@article = Article.find(params[:id])	
		@article.destroy

		flash.notice = "Article '#{@article.title}' destroyed!"

		redirect_to articles_path 	
	end	
	
	def edit
		@article = Article.find(params[:id])
	end
	
	def update
		@article = Article.find(params[:id])
		@article.update(article_params)
		
		flash.notice = "Article '#{@article.title}' updated!"
		
		redirect_to article_path(@article)
	end
	
	private 
	def article_params
			params.require(:article).permit(:title, :body, :tag_list, :image)
	end	

	def require_login
		if !logged_in?
			flash.notice =  "Must be logged!"
			redirect_to articles_path
			return false
		end	
	end
	

end






