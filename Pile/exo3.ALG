type pile = ^structure
début
    info : entier  // Définit un champ info de type entier pour chaque nœud de la pile
    suiv : pile    // Définit un pointeur suivant vers le prochain nœud de la pile
fin

procédure trie((D) sommet : pile)
variable:
    Tm, pc, pp, Pl, Pl1, Ps : pile  // Déclare les variables locales de type pile

début
    Tm <-- nil  // Initialise un pointeur vers la tête de la pile temporaire Tm à nil
    pp <-- nil  // Initialise un pointeur pour le dernier nœud ajouté à la pile temporaire pp à nil

    tant que (pileVide(sommet) = faux) faire  // Boucle tant que la pile d'entrée n'est pas vide
        depiler(sommet, val)  // Dépile un élément de la pile d'entrée et le stocke dans val
        allouer(pc)  // Alloue de la mémoire pour un nouveau nœud pc
        pc^.info = val  // Affecte la valeur val au champ info du nouveau nœud pc
        pc^.suiv = nil  // Initialise le pointeur suivant du nouveau nœud pc à nil

        si (Tm = nil) alors  // Si la pile temporaire est vide
            Tm <-- pc  // Pointe Tm vers le nouveau nœud pc
        sinon
            pp^.suiv <-- pc  // Pointe le dernier nœud de la pile temporaire vers pc
        fin_si
        pp <-- pc  // Met à jour le pointeur pp pour pointer vers le dernier nœud ajouté
    fin_tant_que  // Fin de la boucle de construction de la pile temporaire

    Pl <-- Tm  // Initialise un pointeur Pl pour parcourir la pile temporaire Tm

    tant que (Pl ≠ nil) faire  // Boucle tant que Pl n'est pas nul (parcours de la pile temporaire)
        Pl1 <-- Pl^.suiv  // Initialise un pointeur Pl1 pour parcourir les nœuds suivants de Pl

        tant que (Pl1 ≠ nil) faire  // Boucle tant que Pl1 n'est pas nul
            si (Pl^.info > Pl1^.info) alors  // Si la valeur du nœud actuel est plus grande que celle du nœud suivant
                // Échange les valeurs des nœuds
                tmp <-- Pl^.info
                Pl^.info <-- Pl1^.info
                Pl1^.info <-- tmp
            fin_si
            Pl1 <-- Pl1^.suiv  // Passe au nœud suivant
        fin_tant_que  // Fin de la boucle de tri à l'intérieur de la pile temporaire

        Ps <-- Pl  // Initialise un pointeur Ps pour parcourir la pile triée

        tant que (Ps ≠ nil) faire  // Boucle tant que Ps n'est pas nul (parcours de la pile triée)
            empiler(Ps^.info, sommet)  // Empile la valeur du nœud dans la pile d'entrée
            Ps <-- Ps^.suiv  // Passe au nœud suivant
        fin_tant_que  // Fin de la boucle de réorganisation des éléments dans la pile d'entrée

        Pl <-- Pl^.suiv  // Passe au nœud suivant dans la pile temporaire
    fin_tant_que  // Fin de la boucle de parcours de la pile temporaire
fin  // Fin de la procédure
