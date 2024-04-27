type file = ^structure
début 
    info : entier
    suiv : file
fin 

type pile = ^structure
début 
    info : entier
    suiv : pile
fin 

procédure nombreCarre((D) T,Q: file; (R) sommet: pile)
variable:

début
    initPile(sommet)
    
    tant que (fileVide(T,Q) = faux) faire
        defiler(T,Q, val)
        pour i de 1 à val div 2 faire
            si (i * i = val) alors
                empiler(val, sommet)
            fin_si
        fin_pour
    fin_tant_que    
fin