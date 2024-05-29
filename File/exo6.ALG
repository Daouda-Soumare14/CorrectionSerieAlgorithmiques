type file = ^structure
début
    info:entier
    suiv:file
fin

type Lb = ^structure
début
    info:entier
    suiv, prec:Lb
fin

procédure exo6((D/R): T,Q : file)
variable:
    TB, QB, pc, PT, PQ, pp: Lb
    val: entier
    tmp: entier

début
    TB <-- nil    
    QB <-- nil   
    
// tant que (FileVide(T,Q) = faux) faire : Tant que la file T n'est pas vide.
// défiler(T,Q, val) : Extrait un élément de la file T dans val.
// allouer(pc) : Alloue un nouveau nœud pour pc.
// pc^.info <-- val : Assigne la valeur extraite à info de pc.
// pc^.suiv <-- nil et pc^.prec <-- nil : Initialise les pointeurs de pc.
// si (TB = nil) alors : Si TB est vide, pc devient la tête TB.
// sinon : Sinon, ajoute pc après QB et lie les pointeurs de pc et QB.
// QB <-- pc : Met à jour QB pour pointer vers le nouveau nœud pc.
    tant que (FileVide(T,Q) = faux) faire
        défiler(T,Q, val)
        allouer(pc)
        pc^.info <-- val
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

// PT <-- TB et PQ <-- QB : Initialise PT à la tête et PQ à la queue.
// tant que (PT ≠ PQ et PT ≠ PQ^.suiv) faire : Tant que PT et PQ ne se croisent pas et que PT ne dépasse pas PQ
// Échange les valeurs : Inverse les valeurs de PT et PQ.
// Avance les pointeurs : PT avance vers le suivant et PQ recule vers le précédent.
    PT <-- TB
    PQ <-- QB

    tant que (PT ≠ PQ et PT ≠ PQ^.suiv) faire
        tmp <-- PT^.info
        PT^.info <-- PQ^.info
        PQ^.info <-- tmp

        PT <-- PT^.suiv
        PQ <-- PQ^.prec
    fin_tant_que
    
// pp <-- TB : Initialise pp à la tête TB.
// tant que (pp ≠ nil) faire : Tant que pp n'a pas atteint la fin de la liste.
// enfiler(pp^.info, T, Q) : Insère l'info de pp dans la file T.
// pp <-- pp^.suiv : Avance pp au nœud suivant.
// pp <-- TB
    pp <-- TB
    tant que (pp ≠ nil) faire
        enfiler(pp^.info, T,Q)
        pp <-- pp^.suiv
    fin_tant_que
fin

