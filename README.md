## Exercice du jeudi 18 Octobre :sunny: 


### Le projet du jour : Scrap, spam et follow 

Nous avons travaillé sur le projet à 5, en répartissant le travail.
Nous nous sommes aidés les uns les autres mais nous avions une tâche propre assignée.

Le but du projet est de créer un programme permettant de récupérer 
les handle twitters, les adresses mails et les codes postaux des mairies de trois départements choisis aléatoirement (le Vendée, les Hauts-de-Seines et la Seine-Saint-Denis)
Puis dans un second temps on cherche à follow leur compte twitter et leur envoyer un mail à chacunes.


```
UltimateTownHall
├── .gitignore #Permet d'ignoré certains fichiers
├── .env (pas sur le répo GitHub, bien entendu 😉)
├── README.md #T'es en train de lire ^^
├── Gemfile 
├── Gemfile.lock
├── app.rb #Permet de lancer le programme
├── db  #Dossier contenant les textes
│   └── townhalls_contact.json  #contient les informations name, email, code postale et twitter handle pour chaque ville
│   └── townhalls_contact_sample.json # version allégée de townhalls_contact.json pour tester le Adder(#3)
└── lib #Dossier contenant
    ├── app #Sous-dossier contenant
    │   ├── townhalls_scrapper.rb #Contient le code pour scraper des données
    │   ├── townhalls_mailer.rb #Contient le code pour lancer les mails
    │   ├── townhalls_adder_to_db.rb #Contient le code ajouter les handles twitter dans la base de données
    │   └── townhalls_follower.rb #Contient le code pour 'follow' sur twitter
    └── views #Sous-dossier contenant
        ├── done.rb #contient les messages de d'avancement du programme
        └── index.rb #Contient les actions possibles par l'utilisateur

```   
### Binôme :
Noms | Pseudo Slack
------------ | -------------
Raphael Caillaux| @Raphael
Maëlle Ngachili|@Maëlle
Cedric Soares|@iCedric
Jonathan Mete|@JonathanMete
Axel Ringard|@Axel

### NOTES IMPORTANTES
<ol><li>Pensez à bien lancer un <em>"bundle install"</em> une fois positionné dans le dossier avant de lancer le programme</li>
    <li>Avant de lancer le programme, pensez à insérer vos clés d'API Twitter dans le <em>.env<em> situé à la racine du dossier du projet. Celui-ci est préformaté. Vous n'avez plus qu'à mettre les clés entre guillemets"</li>
    <li><p>Pour lancer le programme : app.rb</p></li>
    <li>Lorsque vous en serez à lancer le Adder (choix #3), le programme met un certain temps à tourner dû au nombre important de handles a récupérer. On vous propose une version allégée de la base de données dans "<em>db/townhalls_contact_sample.json</em>". Vous pouvez donc remplacer le contenu du fichier "<em>db/townhall_contact.json</em>" par celui ci pour tester le programme sans que celà ne prenne des heures.</li>
</ol>

### Bonne correction !   :poop:
