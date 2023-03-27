class ArticlesController < ApplicationController
  #GET /articles/1
  def show
    @article = Article.find(params[:id])
  end

  # GET /articles
  def index
    @articles = Article.all
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  # POST /articles
  def create
    @article = Article.new(params.require(:article).permit(:title, :description))

    if @article.save
      flash[:notice] ="Article was created successfully."
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] ="Article was updated successfully."
      redirect_to @article
    else
      render 'edit'
    end
  end
end