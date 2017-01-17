class CommentsController < ApplicationController
before_filter :require_login, except: [:create]

	def create
		@comment = Comment.new(comment_params)
		@comment.article_id = params[:article_id]
		
		@comment.save
		
		redirect_to article_path(@comment.article)
		
	end
	
	private
		def comment_params
			params.require(:comment).permit(:author_name, :body)
		end
		
		def require_login
			if !logged_in
				flash.notice =  "Must be logged!"
			end	
		end
end
