$:.unshift File.expand_path("../lib", __FILE__)
require 'app/townhalls_scrapper'
require 'app/townhalls_mailer'
require 'app/townhalls_follower'
require 'app/townhalls_adder_to_db'
require 'views/index'
require 'views/done'

class App
  def initialize
    @action_index = Index.new
    @msg = Done.new
    puts "Welcome dear CEO"
    perform
  end

  def perform
    loop do
      @action_index.set_action
      case @action_index.action
      when 1
        scrapper = Scrapper.new
        puts @msg.msg_1_1
        scrapper.all_infos
        print @msg.msg_1_2
        scrapper.export_emails_to_json
        puts @msg.msg_1_3
      when 2
        mailer = Mailer.new
        puts @msg.msg_2_1
        mailer.emails
        print @msg.msg_2_2
        mailer.send_emails
        puts @msg.msg_2_3
      when 3
        adder = Adder.new
        puts @msg.msg_3_1
        adder.extract_json
        print @msg.msg_3_2
        adder.update_twitter_handle
        puts @msg.msg_3_3
        adder.export_to_json
        puts @msg.msg_3_4
      when 4
        follower = Followers.new
        puts @msg.msg_4_1
        follower.extract_json
        print @msg.msg_4_2
        follower.twitter_init
        puts @msg.msg_4_3
        follower.follow_all
        puts @msg.msg_4_4
      end
    end
  end
end

App.new
