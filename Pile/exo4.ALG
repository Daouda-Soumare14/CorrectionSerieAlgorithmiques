type LC = ^structure
début
    info:entier
    suiv:LC
fin

type Pile = ^structure
début
    info:entier
    suiv:Pile
fin

type LB = ^structure
début
    info:entier
    suiv, prec:LB
fin

procédure exo((D) Qlc:LC; (R) sommet:Pile)
variable

début
    P <-- nil
    initPile(sommet)
    Qlc <-- nil

    Si(Qlc ≠ nil)
        svg <-- Qlc^.info
    fin_si

    répéter
        si (P ≠ nil) faire
            P^.info <-- P^.suiv^.info
            empiler(P^.info, sommet)
            P <-- P^.suiv
        fin_si
    jusqu'à  P^.info = Qlc  
    
    P^.suiv <-- svg
    empiler(svg, sommet) 
fin