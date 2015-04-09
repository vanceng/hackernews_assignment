class Post

  attr_accessor :title, :url, :points, :item_id, :comments

  def initialize (title, url, points, item_id, comments = [])
    @title = title
    @url = url
    @points = points
    @item_id = item_id
    @comments = comments
  end

  def to_s
    message = "TITLE: #{title} ID: #{item_id}".colorize(:blue).underline + "\n#{url} \n#{points}".colorize(:green).blink 
    comments.each { |comment| 
      message << comment.to_s }
    message
  end

end