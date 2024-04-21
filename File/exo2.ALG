const N = 100
type file = ^structure
début 
    info : entier
    suiv : file
fin 
type tab = tableau [1..100] file

procédure exo2((D) T,Q:file; val:entier)
variable:

début
    pour i de 1 à N faire
        P <-- T[i]
        cpt <-- 0
        tant que (P ≠ nil) faire
            si (P^.info = val) alors
                cpt <-- cpt + 1
            fin_si
            P <-- P^.suiv
        fin_tant_que
        écrire("le nombre de presence de val dans la file est ", cpt) 
    fin_pour    
fin