require 'nokogiri'
require 'open-uri'
require 'pry'
require 'json'
class Scrapper # loire
  def initialize
    @departments = {}
    @departments[:vendee] = 'http://annuaire-des-mairies.com/vendee.html'
    @departments[:hauts_de_seine] = 'http://annuaire-des-mairies.com/hauts-de-seine.html'
    @departments[:seine_saint_denis] = 'http://annuaire-des-mairies.com/seine-saint-denis.html'
    @xpath = "html/body/table/tr[3]/td/table//tr/td//a[@class='lientxt']"
    @list_email = {}
    @list_email[:vendee] = {}
    @list_email[:hauts_de_seine] = {}
    @list_email[:seine_saint_denis] = {}
  end
  
  def get_townhall_email_and_postalcode(url)
    xpath_mail = '/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]'
    xpath_postalcode = '/html/body/div/main/section[1]/div/div/div/h1'
    page = Nokogiri::HTML(open(url))
    rslt = [page.xpath(xpath_mail).text, page.xpath(xpath_postalcode).text[-5..-1]]
  end

  def get_all_infos
    @departments.each do |dep, url|
      page = Nokogiri::HTML(open(url))
      i=1
      dep_page_xpath = page.xpath(@xpath)
      print "\nExtracting for #{dep.capitalize}:\n"
      dep_page_xpath.each do |el|
        next unless el['href'].length > 1 && !el['href'].include?('adobe.com') # !el['href'].nil? &&
        begin
          town_url = "http://annuaire-des-mairies.com#{el['href'].delete_prefix('.')}"
          email_and_code = get_townhall_email_and_postalcode(town_url)
          @list_email[dep][el.text] = {name: el.text, email: email_and_code[0], postalcode: email_and_code[1], handle_twitter: ""}
        rescue
        end
        print "#{i}/#{dep_page_xpath.length} - "
        i+=1
      end
      print "\n All done for #{dep.capitalize}!!!"
    end
  end

  def export_emails_to_json
    File.open("db/townhalls_contact.json","w") do |f|
      f.write(JSON.pretty_generate(@list_email))
    end
  end
end
