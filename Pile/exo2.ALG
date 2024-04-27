type LM = ^structure
début 
    info : entier
    suiv : LM
fin 

type LB = ^structure
début 
    info : entier
    suiv, prec : LB
fin 

procédure transfert((D) T,Q : LB; (R) sommet : LM)
variable:
    PB, PM, tmp, sommet2 : LB  // Déclaration des variables locales

début 
    initPile(sommet)  // Initialise la pile "sommet"

    PB <-- T  // Initialise un pointeur PB à la tête de la file T
    tant que (PB ≠ nil) faire  // Boucle tant que PB n'est pas nul
        PM <-- PB^.info  // Récupère l'information de l'élément actuel de la file et la stocke dans PM
        tant que (PM !≠ nil) faire  // Boucle tant que PM n'est pas nul
            trouve <-- faux  // Initialise une variable "trouve" à faux
            initPile(sommet2)  // Initialise une nouvelle pile "sommet2"
            tant que (pileVide(sommet) = faux) faire  // Boucle tant que la pile "sommet" n'est pas vide
                depiler(sommet, tmp)  // Dépile un élément de la pile "sommet" et le stocke dans une variable temporaire "tmp"
                si (PM^.info = tmp) alors  // Vérifie si l'information de l'élément actuel de la file est égale à l'élément temporaire
                    trouve <-- vrai  // Définit la variable "trouve" à vrai si l'élément est trouvé dans la pile "sommet"
                empiler(tmp, sommet2)  // Empile l'élément temporaire dans la pile "sommet2"
            fin_tant_que  // Fin de la boucle interne de recherche dans la pile "sommet"
            sommet <-- sommet2  // Affecte la pile "sommet2" à la pile "sommet"
            si (trouve = faux) alors  // Vérifie si l'élément de la file n'a pas été trouvé dans la pile "sommet"
                empiler(PM^.info, sommet)  // Empile l'élément de la file dans la pile "sommet"
            PM <-- PM^.suiv  // Passe à l'élément suivant dans la file
        fin_tant_que  // Fin de la boucle interne de parcours de la file
        PB <-- PB^.suiv  // Passe à l'élément suivant dans la file
    fin_tant_que  // Fin de la boucle externe de parcours de la file
fin  // Fin de la procédure
