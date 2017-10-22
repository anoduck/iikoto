class Post < ActiveRecord::Base
  def file
    Image.find_by(post: number)
  end

  def format_body
    Rack::Utils.escape_html(body).gsub(/\&gt;\&gt;(?<you>\d+)/, '<a href="#p\k<you>">&gt;&gt;\k<you></a>')
               .gsub(/^\&gt;(?<greentext>.+)$/, '<span class="quote">&gt;\k<greentext></span>')
  end
end
