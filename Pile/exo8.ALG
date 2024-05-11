type pile = ^structure
début
    info: entier
    suiv: pile
fin
type file = ^structure
début
    info: pile
    suiv: file
fin
type lb = ^structure
début
    info: entier
    suiv: lb
fin

procédure exo((D/R) T,Q: file)
variable:

début
    Qsvg <-- Q 
    i <-- 0
    tant que (Qsvg^.info ≠ T) faire
        defiler(T,Q, tmp)
        TB <-- nil
        QB <-- nil
        i <-- i+1
        tant que (pilevide(tmp) ≠ faux) faire
            depiler(tmp, tmp2)
            allouer(pc)
            pc^.info <-- tmp2
            pc^.suiv <-- nil
            pc^.prec <-- nil
            si (TB = nil) alors
                TB <-- pc
            sinon
                QB^.suiv <-- pc
                pc^.prec <-- QB
            fin_si
            QB <-- pc
        fin_tant_que
        si (i mod 2 = 0) alors
            p <-- TB
            svg <-- TB^.info
            tant que (p^.suiv ≠ nil) faire
                p^.info <-- p^.suiv^.info
                p <-- p^.suiv
            fin_tant_que
            QB^.info <-- svg
        sinon
            // decallage de la liste bi vers la droite
            p <-- QB
            svg <--QB^.info
            tant que (p^.prec ≠ nil) faire
                p^.info <-- p^.prec^.info
                p <-- p^.prec
            fin_tant_que
            TB^.info <-- svg
        fin_si
        p <-- TB
        tant que (p ≠ nill) faire
            empiler(p^.info, tmp)
            p <-- p^.suiv
        fin_tant_que
        enfiler(tmp, T,Q)
    fin_tant_que
fin
