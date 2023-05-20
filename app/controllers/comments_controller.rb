class CommentsController < ApplicationController
  http_basic_authenticate_with name: "rafael", password: "secret",
    only: :destroy

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comments_params)
    redirect_to article_path(@article)
  end

  private
  def comments_params
    params.require(:comment).permit(:commenter, :body, :status)
  end
end
