class Comment 

  attr_reader :commenter_name, :commenter_text

  def initialize (commenter_name, commenter_text)
    @commenter_name = commenter_name
    @commenter_text = commenter_text
  end  

  def to_s
    "\n\n\n#{commenter_name} says: \n\"#{commenter_text}\"\n".colorize(:red)
  end

end


