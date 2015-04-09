class CommandOptions

  class << self 

    def ask_comments(scraper)
      puts "\n\nWould you like to see the comments? y/n"
      user_response = STDIN.gets.chomp
      if user_response == 'y'
        puts scraper.create_comments
      else
        puts "Goodbye!"
      end
    end

  end

end 