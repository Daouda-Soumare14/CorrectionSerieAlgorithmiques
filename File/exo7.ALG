
type fileLm = ^structure
début 
    info : entier
    suiv : fileLm
fin 

procédure exo2((D) T,Q:fileLm; (R) Tm:fileLm)
variable:

début
    P <-- T
    Tm <-- nil
    tant que (FileVide(T,Q) = faux) faire
        défiler(T,Q,val)
        pour i de 1 à val div 2 faire
            si (val = (i * i)) alors
                allouer(PC)
                PC^.info <-- val
                PC^.suiv <-- nil
                si (Tm = nil) alors
                    Tm <-- PC
                sinon
                    PP^.suiv <-- PC
                fin_si
                PP <-- PC
                i <-- val
            fin_si
        fin_pour  
    fin_tant_que

fin