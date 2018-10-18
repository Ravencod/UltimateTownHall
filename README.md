## Exercice du jeudi 18 Octobre :sunny: 


### Le projet du jour : Scrap, spam et follow 

Nous avons travaillés sur le projet à 5, en séparant le travail en quatre parties: 
le mailer (Axel Ringard, Jonathan Mete), le scrapper (Maëlle Ngachili), 
le bot twitter (Cedric Soares), le views (Raphael Caillaux).
Nous nous sommes aidés les uns les autres mais nous avions une tâche propre assignée.

Le but du projet est de créer un programme permettant de récupérer 
les handle twitters, les adresses mails et les code postaux des Mairies de trois départements choisis aléatoirement.
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
│   ├── townhalls.json  #Fichier contenant 
│   └── townhalls_contact.json  #Fichier contenant 
└── lib #Dossier contenant
    ├── app #Sous-dossier contenant
    │   ├── townhalls_scrapper.rb #Contient le code pour scraper des données
    │   ├── townhalls_mailer.rb #Contient le code pour lancer les mails
    │   ├── townhalls_adder_to_db.rb #Contient le code 
    │   └── townhalls_follower.rb #Contient le code pour 'follow' sur twitter
    └── views #Sous-dossier contenant
        ├── done.rb #Accompli une tâche
        └── index.rb #Affiche une interface utilisateur

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
<ol>Pensez à bien lancer un <em>"bundle install"</em> une fois positionné dans le dossier avant de lancer le programme</li>
             <p>Pour lancer le programme : app.rb</p>
</ol>

### Bonne correction !   :poop:
