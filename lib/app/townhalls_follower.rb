require 'pry'
require 'twitter'
require 'json'
require 'dotenv'

Dotenv.load('../../.env')

#townhalls_follower.rb permet de follow sur twitte toutes les villes du json townhalls_contact


class folloers 

	def iitialize 
		twitter_init
		follow_all
	end 



	

	#méthode qui extrait le json des villes dans un hash 
	def extract_json

		@handles = Hash.new

		json = File.read('../../townhalls_contact.json')
	   	@handles = JSON.parse(json)

	end 

	#méthode pour iniatialiser l'API Twitter 
	def twitter_init 


		@client = Twitter::REST::Client.new do |config|
	 		config.consumer_key = ENV["TWITTER_API_KEY"]
	 		config.consumer_secret = ENV["TWITTER_SECRET_KEY"]
	  		config.access_token = ENV["TWITTER_ACCESS_TOKEN"]
	  		config.access_token_secret = ENV["TWITTER_ACESS_TOKEN_SECRET"]
		end
	end

	#méthode qui follow tous les handles du hashs 
	def follow_all

		extract_json

		@handles.each do |departement, v_dep|

			v_dep.each do |town, v_town|
			

				#follow de chaque handles du hash 	
				@client.follow("#{v_town["handle_twitter"]}")

			end

	   	end 

	end

end

