class Index
  attr_accessor :action
  
  def get_action
    puts "Press 1 to launch the scrapper: retrieve contacts information for each townhall of each department"
    puts "Press 2 to launch the mailer: send an email introducing THP to each tonwhall"
    puts "Press 3 to launch the adder: retrieve the twitter hadnles of each townhall"
    puts "Press 4 to launch the follower: follow on twitter each townhall"
    print '>> '
    @action = gets.chomp.to_i
  end
end
