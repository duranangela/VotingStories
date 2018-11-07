require 'date'

class ArticleService

  def initialize
  end

  def articles
    articles = JSON.parse(response.body, symbolize_names: true)[:articles]
    articles = articles.map do |article|
      article = [article[:title], article[:source][:name], article[:url]]
      article
    end
    articles
  end

  def response
    Faraday.get("https://newsapi.org/v2/everything", params)
  end

  def params
    {
      q: 'Trump AND vote AND gerrymander AND election',
      sortBy: 'publishedAt',
      from: date,
      apiKey: ENV['API_KEY']
    }
  end

  def date
    Date.today - 3
  end

end
