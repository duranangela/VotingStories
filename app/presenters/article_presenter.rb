class ArticlePresenter

  def initialize

  end

  def all_articles
    ArticleService.new.articles
  end

end
