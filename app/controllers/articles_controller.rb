require 'json'

class ArticlesController < ApplicationController

  helper ArticlesHelper

  def index
    @articles = Article.paginate(page: params[:page])
  end

  def  show
    @article = Article.find(params[:id])
    #debugger
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.image.attach(param[:image])

    if @article.save
      flash[:success] = "Created article"
      redirect_to @article
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    puts article_params.to_json
    if @article.update(article_params)
      puts "new data: " + @article.to_json
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :body, :status, :image)
    end
end
