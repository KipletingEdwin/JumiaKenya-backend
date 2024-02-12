class ArticlesController < ApplicationController

  def index
    articles = Article.all
    render json: articles, status: :ok
  end

  def create
  article = Article.create(article_params)
  render json: article, status: :created
  end


  private

  def article_params
    params.permit(:title, :body)
  end

  def find_article
    Article.find(params[:id])
  end

end
