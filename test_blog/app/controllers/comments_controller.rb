class CommentsController < ApplicationController
	def create
		@article = Article.find(params[:article_id])
		@comment = @article.comments.create(common_params)
		redirect_to article_path(@article)
	end
	
	def destroy
		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:article_id])
		@comment.destroy
		redirect_to article_path(@article)
	end
	
private

	def common_params
		params.require(:comment).permit(:commenter, :body)
	end
end
