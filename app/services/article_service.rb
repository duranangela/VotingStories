require 'date'

class ArticleService

  def initialize
  end

  def articles
    JSON.parse(response.body, symbolize_names: true)[:articles]
  end

  def response
    Faraday.get("https://newsapi.org/v2/everything", params)
  end

  def params
    {
      q: 'Trump AND vote AND gerrymander AND election',
      sortBy: 'publishedAt',
      from: date,
      apiKey: 'eafc95e0454f42c78cbb5b3c4c31cc3d'
    }
  end

  def date
    Date.today - 3
  end

end
