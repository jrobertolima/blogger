class TagsController < ApplicationController
before_filter :require_login, only: [:destroy] 
	def index
		@tags = Tag.all
	end

	def show
		@tag = Tag.find(params[:id])
	end
	
	def destroy
		@tag = Tag.find(params[:id])	
		@tag.destroy

		flash.notice = "Tag '#{@tag.name}' destroyed!"

		redirect_to tags_path 	
	
	end
	
	def require_login
		unless logged_in?
			flash.notice = "Must be logged!"
			redirect_to tags_path
			return false
		end
	end
end
