#Création bâtiments
Building.create(name: "Mine de métal", description: "Permet d'extraire du minerai", costMoney: 50, costMetal: 100, metalFarmPerMinute: 20)
Building.create(name: "Extracteur d'énergie", description: "Permet d'extraire de l'énergie de la vibration des cordes", costMoney: 50, costMetal: 100, energyFarmPerMinute: 20)
Building.create(name: "Spatioporc", description: "Permet la création de vaisseaux", costMoney: 200, costMetal: 500)
Building.create(name: "Ministère de la défense", description: "Permet de créer des systèmes de défense", costMoney: 200, costMetal: 500)
Building.create(name: "Laboratoire de Dexter", description: "Permet d'exploiter un petit roux afin de découvrir de nouvelles technologies.", costMoney: 1000, costMetal: 15000)

#Création défenses actives
Defense.create(name: "Lance-fourchette", description: "Arme de haute technologie permettant de lancer des fourchettes recyclables contre les vaisseaux ennemis.", costMoney: 10, costMetal: 5, isActive: true, points: 5)
Defense.create(name: "Canon à poulet ioniques", description: "La découverte de la technologie ionique permet d'envoyer des volailles d'élevage en plein air à une allure supersonique en direction des méchants vaisseaux.", costMoney: 5000, costMetal: 8000, isActive: true, points: 100)
Defense.create(name: "Lance-boulanger", description: "Défense qui envoie le pain.", costMoney: 20000, costMetal: 50000, isActive: true, points: 2000)

#Création défenses passives
Defense.create(name: "Bouclier en bois", description: "Ce magnifique bouclier orné de jolis dessins vous protège efficacement contre toute attaque ennemie, tant que celle-ci n'utilise pas de feu.", costMoney: 10, costMetal: 5, isActive: false, points: 1)
Defense.create(name: "Bouclier ionique bovin", description: "L'extraction du méthane produit par les vaches, permet de ioniser l'air ambiant afin de repousser les attaques ennemies. Attention, odeur désagréable.", costMoney: 8000, costMetal: 12000, isActive: false, points: 10)
Defense.create(name: "Machine à café plasma", description: "Cette machine à café crée un café au goût exceptionnel grâce au plasma. Elle a tout de fois comme inconvénient majeur de créer une barrière protectrice sur la planète.", costMoney: 50000, costMetal: 80000, isActive: false, points: 200)

#Création vaisseau
Spaceship.create(name: "Boîte en carton", description: "Cette magnifique boîte en carton à déjà servi à contenir des choses, mais elle fera très bien l'affaire comme vaisseau.", costMoney: 20, costMetal: 10, energyTank: 500, attackPoints: 1)
Spaceship.create(name: "Gyropode volant", description: "Ce bijou de technologie vous permet de vous déplacer librement dans l'espace", costMoney: 200, costMetal: 300, energyTank: 1200, attackPoints: 10)
Spaceship.create(name: "DeLorean d'occasion", description: "Cette voiture au look rétro puise son énergie dans les déchets de notre planète, ce qui en fait l'engin le plus écolo de la galaxie, mais aussi le plus puissant avec ses 2.21 Gigowatts.", costMoney: 75000, costMetal: 100000, energyTank: 5000, attackPoints: 75)

#Création technologies
Technology.create(name: "Perceuse", description: "Améliore grandement le forage", costMoney: 1000, costEnergy: 1000, typeTech: "bâtiment")
Technology.create(name: "Roue à pterodactyle", description: "Permet d'améliorer grandement l'extraction d'énergie en faisant courir des ptérodactyles dans des roues", costMoney: 1000, costEnergy: 5000, typeTech: "bâtiment")
Technology.create(name: "Fourchette à 5 dents", description: "Cette avancée monumentale dans le domaine de la gastronomie vous permet d'améliorer votre lance-fourchette.", costMoney: 5000, costEnergy: 20000, typeTech: "défense active")
Technology.create(name: "Modification génétique des poulets", description: "Désormais, les poulets sont munis de dents, ce qui améliore votre canon à poulets", costMoney: 10000, costEnergy: 50000, typeTech: "défense active")
Technology.create(name: "Chirurgie esthétique", description: "L'agrandissement des miches de la boulangère permet une meilleure efficacité du boulanger.", costMoney: 80000, costEnergy: 100000, typeTech: "défense active")
Technology.create(name: "Peinture rose", description: "Permet de customiser votre bouclier tout en l'impérméabilisant.", costMoney: 1000, costEnergy: 1000, typeTech: "défense passive")
Technology.create(name: "Aspirateur à méthane", description: "Ce petit outil permet d'extraire une plus grande quantité de méthane directement à la source.", costMoney: 1000, costEnergy: 5000, typeTech: "défense passive")
Technology.create(name: "Grains de Kopi Luwak", description: "Ce café extrêmement rare satisfera encore mieux vos papilles gustatives.", costMoney: 5000, costEnergy: 80000, typeTech: "défense passive")
Technology.create(name: "Papier cadeau", description: "Permet de camoufler votre boîte en carton en cadeau. Effet Cheval de Troie garanti !", costMoney: 10000, costEnergy: 5, typeTech: "vaisseau")
Technology.create(name: "Porte-bagages atomique", description: "Permet de ranger vos courses sur votre gyropode.", costMoney: 5000, costEnergy: 8000, typeTech: "vaisseau")
Technology.create(name: "Kit carosserie", description: "Avec ça, vous serez la fierté du bled", costMoney: 10000, costEnergy: 26000, typeTech: "vaisseau")
