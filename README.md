# Projet workflows
### Fait par Yann Sady & Nicolas Keerpal

## À propos du projet
Nous avons repris notre api e-bakery pour ce projet.  
Le but de ce projet est de créer un workflow qui permet de déployer une image docker de notre api et de créer une release.  
  
On a crée 3 workflows :  
- Test 
- Close pull request
- CI/CD
  
Qui servent respectivement à tester l'api, close les pull request et assurer l'intégration et déploiement continue.  

On travail sur différentes branches puis quand on a fini la feature, on crée une pull request dans before-master et une fois fini avec toutes les fonctionnalités, on fusionne tous ça dans master (via une pull request).

## Workflow de test
Ce workflow se déclenche sur :
- push dans before-master
- pull request sur master et before-master
  
Ce workflow permet de tester l'api en vérifiant :
- l'installation des dépendances
- les tests de l'api
- la syntaxe du code
- la sécurité des dépendances (si il n'y a pas de faille etc...)

## Workflow pour close les pull request
Ce workflow se déclenche quand une pull request est ouverte.  
  
Le workflow va se déclencher et attendre 30 secondes et si la pull request n'a pas de review durant ces 30 secondes, elle est close par le workflow.

## Workflow de CI/CD
Ce workflow se déclenche quand on push dans master (via le merge de la pull request).  
  
Ce workflow se divise en 3 jobs :
- run-node (vérifie que l'api se lance et bien et passe les tests)
- docker (push l'image sur dockerhub)
- release (crée un tag de release)

#### run-node
Les test ne change pas par rapport au workflow de test, on a choisi de diviser ces workflows pour que l'on puisse tester l'api et garder les tests avant de déployer et créer un tag de release dans master.

#### docker
Ce job commence par se connecter à dockerhub.  
Une fois fait, il va :
- build l'image
- la taguer
- la push sur dockerhub

#### release
Ce job va s'identifier va notre adresse mail noreply github et mettre notre nom github.  
Il va ensuite créer un tag de release dans le repo.

## À propos de l'équipe
- Nicolas Keerpal : workflow de test et close pull request
- Yann Sady : workflow de CI/CD
t