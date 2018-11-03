class ArticleService

  def initialize
  end

  def articles
    JSON.parse(response.body, symbolize_names: true)[:articles]
  end

  def response
    Faraday.get("https://newsapi.org/v2/everything?q=voting&sortBy=publishedAt&apiKey=eafc95e0454f42c78cbb5b3c4c31cc3d&from=2018-10-23")
  end

end
