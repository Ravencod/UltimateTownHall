require 'mail'
require 'json'
# Cette classe permet de gerer les mail
class Mailer

  def emails
    json = File.read('db/townhalls_contact.json')
    @contacts = JSON.parse(json)
  end

  def send_emails
    puts "Give me your mail or press 'N' to use the default fake (but working) mail:"
    print "> "
    adress = gets.chomp
    if adress.upcase == 'N'
      adress = "hyppoleuleu@gmail.com"
      password = "1234567huit!"
    else
      puts "Now, give your password mail or press 'N' to use the default fake (but working) password :"
      print "> "
      password = gets.chomp
    end
    puts password
    options = { address: 'smtp.gmail.com',
                user_name: adress,
                password: password,
                authentication: 'plain',
                enable_starttls_auto: true }

    i = 0
    @contacts.values.each do |dep|
      dep.values.each do |town|
        print " - #{town['name'].capitalize}"
        Mail.defaults do
          delivery_method :smtp, options
        end

        Mail.deliver do
          to 'botinatorx360@gmail.com' # town['email']
          from 'hyppoleuleu@gmail.com'
          charset = 'UTF-8'
          content_transfer_encoding = '8bit'
          subject 'The Hacking Project'
          text_part do
            content_type 'text/plain; charset=utf-8'
            body <<-EOF
            Bonjour,
            The Hacking Project, une formation au code gratuite, sans locaux, sans sélection, sans restriction géographique. La pédagogie de notre école est celle du peer-learning, où nous travaillons par petits groupes sur des projets concrets qui font apprendre le code. Le projet du jour est d'envoyer (avec du codage) des emails aux mairies pour qu'ils nous aident à faire de The Hacking Project un nouveau format d'éducation pour tous.
            Est-ce que la mairie de #{town['name'].capitalize} veut changer le monde avec nous ?
            Charles, co-fondateur de The Hacking Project pourra répondre à toutes vos questions : 06.95.46.60.80
            EOF
          end
        end
        i += 1
      end
    end
  end
end
