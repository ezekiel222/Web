class CommentsController < ApplicationController

  before_action :authenticate_user!

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(params[:comment].permit(:body))
    @comment.user_id = current_user.id if current_user

    if @comment.save
      redirect_to article_path(@article), notice: "Se ha guardado tu comentario"
    else
      redirect_to "new"
    end
  end

  def update
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(paramas[:id])

    if @comment.update(params[:comment].permit(:body))
      redirect_to article_path(@article), notice: "Se ha actualizado tu comentario"
    else
      render 'edit'
    end
  end

  def edit
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:article_id])
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:article_id])
    @comment.destroy
    redirect_to article_path(@article), notice: 'Tu comentario ha sido eliminado'
  end

end
