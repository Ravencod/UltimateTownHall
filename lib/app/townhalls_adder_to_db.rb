require 'pry'
require 'watir'
require "json"

# le townhalls_adders_to_db permet de recuperer tous les twitter handles des villes listees dans le json townhalls_contact

# methode qui etait le json des villes dans un hash
class Adder
  def extract_json
    @contacts = {}
    json = File.read('db/townhalls_contact.json')
    @contacts = JSON.parse(json)
  end

  # methode qui recupere les twitter handles de chaque ville
  def update_twitter_handle
    browser = Watir::Browser.new(:firefox)
    @contacts.each do |department, v_dep|
      print "\nRetrieving handles for #{department.upcase}:\n"
        v_dep.each do |town, v_town|
        print " / #{town.capitalize}-> "
        # initialisation de l'API REST twitter
        browser.goto 'google.com'
        search_bar = browser.text_field(class: 'gsfi')
        search_bar.set("twitter account #{town}")
        # lancement avec Watir d'une recharche Google "ville" + twitter account
        search_bar.send_keys(:enter)

        # attentte de l'affichage des resultats
        browser.driver.manage.timeouts.implicit_wait = 3

        # recup result / recup first research
        search_result_divs = browser.divs(class: 'rc')
        begin
          twitter_handle = "@#{search_result_divs[0].h3.text.split('@')[1][0..-12]}"
        rescue # if there's any issues it will set the twitter handle to "N/A"
            twitter_handle = 'N/A'  # recuperation du handle twitter puis concatenation avec "@"
        ensure
            v_town["handle_twitter"]  = twitter_handle
        end
        print twitter_handle
        end
    end
  end

  # methode qui renvoie les coordonnees au JSON
  def export_to_json
    File.open('db/townhalls_contact.json', 'w') do |f|
      f.write(JSON.pretty_generate(@contacts))
    end
  end
end
