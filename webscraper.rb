class WebScraper

  def initialize(website)
    @website = website
    @@doc = Nokogiri::HTML(open(website))  
  end  
  
  def create_post
  title = post_title
  url = post_url
  points = post_points
  item_id = post_id
  # comments = create_comments
  Post.new(title, url, points, item_id)
  end

  def create_comments
  commenters = post_commenters 
  comments = post_comments 
  comment_objects = []
  i = 0
  while i < commenters.size 
    temp_data = Comment.new(commenters[i], comments[i])
    i += 1
    comment_objects << temp_data 
  end 
  comment_objects 
  end  


  private

  def post_title
    @@doc.search('.title').text 
  end

  def post_points
    @@doc.search('.subtext .score').text 
  end

  def post_url
    @@doc.search('.title a').map { |link| link['href'] }.first 
  end

  def post_id
    raw_data = @@doc.search('.subtext a').map { |a| a['href'] }
    raw_data[1][8..-1]
  end 

  def post_comments
    @@doc.search('.comment > font:first-child').map { |font| font.inner_text}
  end

  def post_commenters
    @@doc.search('.comhead > a:first-child').map { |element| element.inner_text}
  end 

end

 


