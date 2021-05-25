module ArticlesHelper
  def gravatar_for_article(article)
    gravatar_id = Digest::MD5::hexdigest(article.title)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: article.title, class: "gravatar")
  end
end
