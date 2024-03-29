class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update ]

  # GET /articles
  def index
    @articles = SampleArticle.all
  end

  # GET /articles/1
  def show
  end

  # GET /articles/new
  def new
    @article = SampleArticle.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article, notice: "#{t('activerecord.models.article')}を作成しました。"
                                     #"Article was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /articles/1
  def update
    if @article.update(article_params)
      redirect_to @article, notice: "#{t('activerecord.models.article')}を編集しました。"
                                     #"Article was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /articles/1
  def destroy
    @article.destroy
    edirect_to articles_url, notice: "#{t('activerecord.models.article')}を削除しました。"
                                     #"Article was successfully destroyed."
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :content)
    end
end
