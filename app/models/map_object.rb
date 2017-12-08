class MapObject
  attr_reader :location

  def initialize(location)
    @location = location
  end

  def title
    "<b><h2>#{location.title}</h2></b>"
  end

  def lat
    location.lat
  end

  def lng
    location.lng
  end

  def attribution
    "<p>More Info: <a href='#{location.url_address}'>#{location.url_title}</a></p>"
  end

  def text
    "<p>#{location.content}</p>"
  end

  def content
    "#{title}#{date}#{text}#{attribution}"
    # "<b><h1>Fake Title</h1></b><p>Fake Content</p><p>2017/12/1</p><p>More Info: <a href='http://example.com'>Fake Url</a></p>"
  end

  def date
    "<h3>#{location.date}</h3>"
  end

  def format
    {content: content, lat: lat, lng: lng, title: title}
  end
end
