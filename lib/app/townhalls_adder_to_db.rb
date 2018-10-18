
require 'pry'
require 'watir'
require "json"


#le townhalls_adders_to_db permet de récupérer tous les twitter handles des villes listées dans le json townhalls_contact


#méthode qui étrait le json des villes dans un hash
def extract_json

	contacts = Hash.new

	json = File.read('db/townhalls_contact.json')
	contacts = JSON.parse(json)
end 

def get_twitter_handle
   		
	extract_json

	i = 0 

	while i < contacts.length 

		#initialisation de l'API REST twitter 
		browser = Watir::Browser.new(:firefox)
		browser.goto 'google.com'
		search_bar = browser.text_field(class: 'gsfi')
		search_bar.set("#{contacts[[i][O]}")

		#lancement avec Watir d'une recharche Google "ville" + twitter account
		submit_button = browser.button(type:"submit")
		submit_button.click

		#attentte de l'affichage des résultats 
		browser.driver.manage.timeouts.implicit_wait = 3

		#récupération de tous les résultats dans un search_result_divs puis récupération de la première recjherche (index [O])
		search_result_divs = browser.divs(class:"rc")
		search_result_div[0].click

		#récupération du handle twitter puis concaténation avec "@"
		twitter_handle = browser.text_field(class: 'u-linkComplex-target')
		contacts[i][3]  = "@#{twitter_hanndle}"

		i+=1

	end 

end 

def export_to_json

File.open("townhalls_contact","w") do |f|
    	f.write(JSON.pretty_generate(contacts))
  		end

	end 
