
type file = ^structure
début 
    info : entier
    suiv : file
fin 

procédure exo2((D) T,Q:file)
variable:

début
    P <-- T
    tant que (P^.suiv ≠ nil) faire
        P1 <-- P^.suiv
        cpt <-- 0
        trouve <-- faux 
        tant que (P1 ≠ nil) faire
            si (P^.info = P1^.info) alors
                trouve <-- vrai 
                cpt <-- cpt + 1
            fin_si
            P1 <-- P1^.suiv
        fin_tant_que
        écrire("le nombre de presence de val dans la file est ", cpt)  
        P <-- P^.suiv  
    fin_tant_que

fin