require 'mail'

options = { :address              => "smtp.gmail.com",
            :user_name            => 'hyppoleuleu@gmail.com',
            :password             => '1234567huit!',
            :authentication       => 'plain',
            :enable_starttls_auto => true  }



Mail.defaults do
  delivery_method :smtp, options
end

a = 'botinatorx360@gmail.com'
nom_commune = "LOL"

Mail.deliver do
       to a
     from 'hyppoleuleu@gmail.com'
  subject 'The Hacking Project'
     body "Bonjour,
     The Hacking Project, une formation au code gratuite, sans locaux, sans sélection, sans restriction géographique. La pédagogie de ntore école est celle du peer-learning, où nous travaillons par petits groupes sur des projets concrets qui font apprendre le code. Le projet du jour est d'envoyer (avec du codage) des emails aux mairies pour qu'ils nous aident à faire de The Hacking Project un nouveau format d'éducation pour tous.
     Déjà 500 personnes sont passées par The Hacking Project. Est-ce que la mairie de #{nom_commune} veut changer le monde avec nous ?
     Charles, co-fondateur de The Hacking Project pourra répondre à toutes vos questions : 06.95.46.60.80"
end