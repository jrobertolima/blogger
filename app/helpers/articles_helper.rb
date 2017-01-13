module ArticlesHelper
# defining which fields the model is dealing with. To avoid mass assignment
	def article_params
		params.require(:article).permit(:title, :body, :tag_list, :image)
	end	
end
