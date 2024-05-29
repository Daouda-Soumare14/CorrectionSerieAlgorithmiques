type file = ^structure
début
    info : entier
    suiv : file
fin

procédure exo((D) Tf,Qf : file; TeteLM : file)
variable :

début
    TeteLM <-- nil

// tant que (FileVide(Tf, Qf) = faux) faire: Tant que la file n'est pas vide, on continue.
// défiler(Tf, Qf, val): On retire un élément de la file et on le stocke dans val.
// allouer(PC): On alloue de la mémoire pour un nouveau nœud PC.
// PC^.info <-- val: On assigne la valeur retirée de la file à PC.
// PC^.suiv <-- nil: Le pointeur suivant de PC est initialisé à nil.
// si (TeteLM = nil) alors: Si la liste est vide, TeteLM pointe vers PC.
// sinon: Sinon, on ajoute PC à la fin de la liste.
// PP <-- PC: PP pointe maintenant vers le dernier nœud ajouté.
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

// pos et posMax: Pointeurs pour garder la position actuelle et la position de début de la sous-suite la plus longue.
// cpt: Compteur pour la longueur actuelle de la sous-suite croissante.
// max: Longueur maximale trouvée pour une sous-suite croissante.
// nbss: Nombre de sous-suites croissantes trouvées.
    pos <-- TeteLM
    posMax <-- TeteLM
    cpt <-- 1
    max <-- 0
    nbss <-- 1

// P <-- TeteLM: On initialise P pour parcourir la liste.
// tant que (P^.suiv ≠ nil) faire: On parcourt la liste jusqu'à l'avant-dernier élément.
// si (P^.info < P^.suiv^.info) alors: On vérifie si la sous-suite croissante continue.
// cpt <-- cpt + 1: On incrémente le compteur de longueur de la sous-suite.
// sinon: Si la sous-suite croissante se termine :
// si (cpt > max) alors: Si la sous-suite actuelle est la plus longue trouvée :
// max <-- cpt: On met à jour max.
// posMax <-- pos: On met à jour la position de début de la plus longue sous-suite.
// nbss <-- nbss + 1: On incrémente le compteur de sous-suites.
// cpt <-- 1: On réinitialise le compteur pour la nouvelle sous-suite.
// pos <-- P^.suiv: On met à jour pos pour la nouvelle sous-suite.
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

// si (nbss = 1) alors: Si on a trouvé qu'une seule sous-suite croissante :
// max <-- cpt: On met à jour max avec la longueur de cette sous-suite.
// afficher: On affiche le nombre de sous-suites et la longueur de la plus longue.
// pour i de 1 à max pas de 1 faire: On parcourt la sous-suite la plus longue pour afficher ses éléments.
// P <-- P^.suiv: On passe au prochain élément de la sous-suite pour l'afficher.
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


