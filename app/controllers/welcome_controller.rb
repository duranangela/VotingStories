class WelcomeController < ApplicationController

  def index
    @presenter = ArticlePresenter.new.all_articles
  end

end
