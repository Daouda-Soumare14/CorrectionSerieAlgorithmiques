
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
        tant que (P1 ≠ nil) faire
            si (P^.info > P1^.info) alors
                tmp <-- P^.info
                P^.info <-- P1^.info
                P1^.info <-- tmp
            fin_si
            P1 <-- P1^.suiv
        fin_tant_que  
        P <-- P^.suiv  
    fin_tant_que

fin