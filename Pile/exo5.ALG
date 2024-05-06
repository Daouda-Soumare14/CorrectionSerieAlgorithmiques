type file = ^structure   // Définition du type de donnée "file" qui représente une file, avec un pointeur vers une structure

début                    // Début de la procédure exo
    info:entier          // Déclaration d'une variable info de type entier
    suiv:file            // Déclaration d'une variable suiv de type file (pointeur vers la structure)

procédure exo((D/R) T,Q:file; val:entier)  // Définition de la procédure exo prenant en entrée T et Q (tête et queue de la file) et la valeur à insérer (val)
variable:                               // Section de déclaration des variables locales
    T1, Q1: file                        // Déclaration de deux variables locales de type file pour stocker la nouvelle tête et la nouvelle queue de la file
    tmp: entier                         // Déclaration d'une variable locale temporaire de type entier pour stocker les éléments de la file
    trouve: entier                      // Déclaration d'une variable locale de type entier pour marquer si la valeur a été trouvée dans la file

    début                               // Début de la section de traitement de la procédure
        trouve <-- 0                    // Initialise la variable trouve à 0
        initfile(T1,Q1)                 // Initialise les pointeurs de la nouvelle file à vide
        
        tant que (filevide(T1,Q1) = faux) faire  // Boucle tant que la nouvelle file n'est pas vide
            defiler(T1,Q1,tmp)                   // Défile un élément de la nouvelle file et le stocke dans tmp
            si (tmp < val) alors                 // Si l'élément tmp est inférieur à la valeur à insérer (val)
                defiler(tmp, T1,Q1)              // Défile un autre élément de la nouvelle file et le stocke dans tmp
            sinon                                 
                si (trouve = 0) alors            // Si la valeur à insérer n'a pas encore été trouvée dans la file
                    enfiler(val, T1,Q1)         // Enfile la valeur à insérer dans la nouvelle file
                    trouve <-- 1                // Marque que la valeur a été insérée
                fin_si
                enfiler(tmp, T1,Q1)             // Enfile l'élément tmp dans la nouvelle file
            fin_si
        fin_tant_que
        
        si (trouve = 0) alors                   // Si la valeur à insérer n'a pas encore été trouvée dans la file
            enfiler(val, T1,Q1)                // Enfile la valeur à insérer à la fin de la nouvelle file
        fin_si    
        T <-- T1                               // Met à jour la tête de la file initiale avec la nouvelle tête
        Q <-- Q1                               // Met à jour la queue de la file initiale avec la nouvelle queue
    fin
