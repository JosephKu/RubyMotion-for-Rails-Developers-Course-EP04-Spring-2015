class AboutWebScreen < PM::WebScreen
  title 'About'

  def content
    # NSURL.URLWithString("http://www.apple.com")
    url = "http://www.apple.com".nsurl
    mp url

  end
end