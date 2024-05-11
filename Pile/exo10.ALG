type pile = ^structure
début 
    info: entier
    suiv: pile
fin
type file = ^structure
début 
    info: pile
    suiv: file
fin
type fic = fichier file
organisation: sequentielle

procédure exo((D) F:fic; (R) fileMax:file)
variable:
    cpt: entier // Déclaration de la variable cpt pour compter le nombre d'entiers dans une pile
    s, sommet: file // Déclaration des variables pour parcourir les files et les piles

début
    cpt <-- 0 // Initialisation de cpt à 0
    fileMax <-- nil // Initialisation de la file avec le plus grand nombre d'entiers à nil
    ouvrir(F) en lecture // Ouverture du fichier en lecture
    tant que (EOF(F) = faux) faire // Boucle pour parcourir chaque file dans le fichier
        lire(F, s) // Lecture d'une file du fichier
        sommet <-- s // Initialisation de sommet avec la file courante
        tant que (sommet ≠ nil) faire // Boucle pour parcourir chaque pile dans la file
            pour i de 1 à sommet^.info faire // Boucle pour compter le nombre d'entiers dans la pile
                si (i = 1) alors // Condition pour le premier élément de la pile
                    cpt <-- sommet^.info // Initialisation de cpt avec la valeur du premier élément de la pile
                    fileMax <-- s // Mise à jour de fileMax avec la file courante
                sinon // Pour les autres éléments de la pile
                    si (i > cpt) alors // Condition pour vérifier si le nombre actuel d'éléments dans la pile est plus grand que cpt
                        cpt <-- i // Mise à jour de cpt avec le nombre actuel d'éléments dans la pile
                        fileMax <-- s // Mise à jour de fileMax avec la file courante
                    fin_si
                fin_si
            fin_pour
            sommet <-- sommet^.suiv // Passage à la pile suivante dans la file
        fin_tant_que 
    fin_tant_que     
    afficher("La file qui a le plus d'entiers :", fileMax) // Affichage de la file avec le plus grand nombre d'entiers
    fermer(F) 
fin
