type
    pile = ^structure // Définition d'un type pointeur vers une structure de pile
    début
        info: entier // Champ pour stocker l'information (dans ce cas, un entier)
        suiv: pile // Champ pour pointer vers le prochain élément de la pile
    fin

type
    pilepile = ^structure // Définition d'un type pointeur vers une structure de pile de piles
    début
        info: pile // Champ pour stocker une pile
        suiv: pilepile // Champ pour pointer vers la prochaine pile de piles
    fin

type
    lc = ^structure // Définition d'un type pointeur vers une structure de liste chaînée
    début
        info: entier // Champ pour stocker l'information (dans ce cas, un entier)
        suiv: lc // Champ pour pointer vers le prochain élément de la liste chaînée
    fin

procédure exo((D) sommet: pilepile; (R) LCT: lc, LCQ: lc)
    variable:
        s, pc, pc1, pp, pp1: lc // Déclaration de variables locales
        trouve: booléen // Variable pour vérifier si un élément existe déjà dans une liste chaînée
        p: entier // Variable pour calculer la somme des entiers jusqu'à un entier donné
    début
        LCT <-- nil // Initialisation de la liste chaînée LCT à nil
        LCQ <-- nil // Initialisation de la liste chaînée LCQ à nil
        pp <-- nil // Initialisation du pointeur de fin de LCT à nil
        pp1 <-- nil // Initialisation du pointeur de fin de LCQ à nil
        tant que (sommet ≠ nil) faire // Parcours des piles de la pile de piles
            depiler(sommet, s) // Dépiler la pile actuelle
            tant que (s ≠ nil) faire // Parcours des éléments de la pile actuelle
                trouve <-- faux // Initialisation de la variable trouve à faux
                p <-- 0 // Initialisation de p à 0
                pour i de 1 à s^.info faire // Parcours des éléments de la pile actuelle
                    p <-- p + i // Calcul de la somme des entiers jusqu'à i
                    si (s^.info = i * i) alors // Vérification si l'entier est un carré parfait
                        tant que (LCT ≠ nil) faire // Parcours de la liste chaînée LCT
                            si (LCT^.info = s^.info) alors // Vérification si l'entier est déjà présent dans LCT
                                trouve <-- vrai // L'élément est trouvé dans LCT
                            fin_si
                            pp <-- LCT // Mettre à jour pp
                            LCT <-- LCT^.suiv // Avancer dans la liste chaînée LCT
                        fin_tant_que
                        si (trouve = faux) alors // Si l'élément n'est pas présent dans LCT
                            allouer(pc) // Allouer de la mémoire pour un nouvel élément de LCT
                            pc^.info <-- s^.info // Stocker l'entier dans le champ info de l'élément
                            pc^.suiv <-- nil // Initialiser le champ suivant à nil
                            si (LCT = nil) alors // Si LCT est vide
                                LCT <-- pc // L'élément est le premier de LCT
                            sinon
                                pp^.suiv <-- pc // Relier le nouvel élément à la fin de LCT
                            fin_si
                            pp <-- pc // Mettre à jour pp
                        fin_si
                    sinon // Si l'entier n'est pas un carré parfait
                        si (s^.info = p) alors // Vérification si l'entier est un nombre parfait
                            tant que (LCQ ≠ nil) faire // Parcours de la liste chaînée LCQ
                                si (LCQ^.info = s^.info) alors // Vérification si l'entier est déjà présent dans LCQ
                                    trouve <-- vrai // L'élément est trouvé dans LCQ
                                fin_si
                                pp1 <-- LCQ // Mettre à jour pp1
                                LCQ <-- LCQ^.suiv // Avancer dans la liste chaînée LCQ
                            fin_tant_que
                            si (trouve = faux) alors // Si l'élément n'est pas présent dans LCQ
                                allouer(pc1) // Allouer de la mémoire pour un nouvel élément de LCQ
                                pc1^.info <-- s^.info // Stocker l'entier dans le champ info de l'élément
                                pc1^.suiv <-- nil // Initialiser le champ suivant à nil
                                si (LCQ = nil) alors // Si LCQ est vide
                                    LCQ <-- pc1 // L'élément est le premier de LCQ
                                sinon
                                    pp1^.suiv <-- pc1 // Relier le nouvel élément à la fin de LCQ
                                fin_si
                                pp1 <-- pc1 // Mettre à jour pp1
                            fin_si
                        fin_si
                    fin_si
                fin_pour
                s <-- s^.suiv // Passer à l'élément suivant de la pile actuelle
            fin_tant_que
        fin_tant_que
    fin
