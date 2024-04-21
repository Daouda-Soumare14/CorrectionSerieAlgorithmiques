type file = ^structure
début
    info : entier
    suiv : file
fin

procédure exo((D) Tf,Qf : file; TeteLM : file)
variable :

début
    TeteLM <-- nil
    
    tant que (FileVide(Tf,Qf) = faux) faire
        défiler(Tf, Qf, val)
        allouer(PC)
        PC^.info <-- val
        PC^.suiv <-- nil
        si (TeteLM = nil) alors
            TeteLM <-- PC
        sinon
            PP^.suiv <-- PC
        fin_si
        PP <-- PC
    fin_tant_que

    pos <-- TeteLM
    posMax <-- TeteLM
    cpt <-- 1
    max <-- 0
    nbss <-- 1

    P <--TeteLM
    tant que (P^.suiv ≠ nil) faire
        si (P^.info < P^.suiv^.info) alors
            cpt <-- cpt + 1
        sinon
            si (cpt > max) alors
                max <-- cpt
                posMax <-- pos
            fin_si
            nbss <-- nbss + 1
            cpt <-- 1
            pos <-- P^.suiv
        fin_si
    fin_tant_que
    si (nbss = 1) alors
        max <-- cpt
        afficher("le nombre de sous suite est", nbss)
        afficher("la sous suite la plus longue compte", max, "nombre")
        pour i de 1 à max pas de 1 faire
            afficher(P^.info)
            P <-- P^.suiv
        fin_pour
    fin_si
fin





type
    file = ^structure
    début
        info : entier
        suiv : file
    fin

procédure exo((D) Tf, Qf : file; TeteLM : file)
variable :
    pos, posMax, cpt, max, nbss : entier
    P, PP, PC : file  // Déclaration des variables

début
    TeteLM <-- nil  // Initialisation de TeteLM à nil
    
    // Boucle pour dépiler les éléments de la file Tf et les stocker dans TeteLM
    tant que (FileVide(Tf, Qf) = faux) faire
        défiler(Tf, Qf, val)  // Défiler un élément de la file
        allouer(PC)  // Allouer un nouveau nœud de la liste chaînée
        PC^.info <-- val  // Stocker la valeur défilée dans le champ info du nœud
        PC^.suiv <-- nil  // Initialiser le champ suivant à nil
        si (TeteLM = nil) alors  // Vérifier si TeteLM est vide
            TeteLM <-- PC  // Si oui, initialiser TeteLM avec le nouveau nœud PC
        sinon
            PP^.suiv <-- PC  // Sinon, ajouter le nouveau nœud PC à la fin de la liste
        fin_si
        PP <-- PC  // Mettre à jour le pointeur PP pour pointer vers le dernier nœud
    fin_tant_que

    pos <-- TeteLM  // Initialisation de la position actuelle avec TeteLM
    posMax <-- TeteLM  // Initialisation de la position maximale avec TeteLM
    cpt <-- 1  // Initialisation du compteur à 1
    max <-- 0  // Initialisation de la longueur maximale à 0
    nbss <-- 1  // Initialisation du nombre de sous-suites à 1

    P <-- TeteLM  // Initialisation de P à TeteLM
    // Boucle pour parcourir les nœuds de la liste chaînée
    tant que (P^.suiv ≠ nil) faire
        si (P^.info < P^.suiv^.info) alors  // Vérifier si la suite est croissante
            cpt <-- cpt + 1  // Incrémenter le compteur
        sinon
            si (cpt > max) alors  // Si la longueur de la suite est supérieure à max
                max <-- cpt  // Mettre à jour la longueur maximale
                posMax <-- pos  // Mettre à jour la position maximale
            fin_si
            nbss <-- nbss + 1  // Incrémenter le nombre de sous-suites
            cpt <-- 1  // Réinitialiser le compteur
            pos <-- P^.suiv  // Mettre à jour la position actuelle
        fin_si
        P <-- P^.suiv  // Avancer vers le prochain nœud dans la liste
    fin_tant_que

    // Affichage des informations sur la sous-suite la plus longue s'il n'y a qu'une seule sous-suite
    si (nbss = 1) alors
        max <-- cpt  // Mettre à jour max avec la longueur de la dernière suite
        afficher("le nombre de sous suite est", nbss)  // Afficher le nombre de sous-suites
        afficher("la sous suite la plus longue compte", max, "nombre")  // Afficher la longueur maximale
        P <-- posMax  // Initialiser P à la position maximale
        // Boucle pour afficher les éléments de la sous-suite la plus longue
        pour i de 1 à max pas de 1 faire
            afficher(P^.info)  // Afficher la valeur du nœud actuel
            P <-- P^.suiv  // Avancer vers le prochain nœud dans la liste
        fin_pour
    fin_si
fin
