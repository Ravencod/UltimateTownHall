require 'pry'
require 'watir'
require "json"

#le townhalls_adders_to_db permet de récupérer tous les twitter handles des villes listées dans le json townhalls_contact

#méthode qui étrait le json des villes dans un hash
class Adder
  def extract_json
  	@contacts = Hash.new
  	json = File.read('db/townhalls_contact.json')
  	@contacts = JSON.parse(json)
  end

  #méthode qui récupère les twitter handles de chaque ville 
  def update_twitter_handle
    browser = Watir::Browser.new(:firefox)
  	@contacts.each do |department, v_dep|
      print "\nRetrieving handles for #{department.upcase}:\n"
        v_dep.each do |town, v_town|
        print " - #{town.capitalize}>"
        #initialisation de l'API REST twitter
        browser.goto 'google.com'
        search_bar = browser.text_field(class: 'gsfi')
        search_bar.set("twitter account #{town}")
        #lancement avec Watir d'une recharche Google "ville" + twitter account
        search_bar.send_keys(:enter)
        
        #attentte de l'affichage des résultats
        browser.driver.manage.timeouts.implicit_wait = 3
        
        #récupération de tous les résultats dans un search_result_divs puis récupération de la première recjherche (index [O])
        search_result_divs = browser.divs(class:"rc")
        begin
            twitter_handle = "@#{search_result_divs[0].h3.text.split('@')[1][0..-12]}"
        rescue
            # if there's any issues it will set the twitter handle to "N/A"
            twitter_handle = "N/A"
            #récupération du handle twitter puis concaténation avec "@"
        ensure
            v_town["handle_twitter"]  = twitter_handle
        end
        print twitter_handle
      end
  	end
  end

  #méthode qui renvoie les coordonnées au JSON
  def export_to_json
  	File.open("db/townhalls_contact.json","w") do |f|
      	f.write(JSON.pretty_generate(@contacts))
    	end
  end
end
