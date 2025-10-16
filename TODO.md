# First steps 
### 1) Supprimer les éléments inutiles (pas utilisés dans l'analyse) Marion
    * In ref ID, 
    * all length pred except standardized, 
    * all length + dimensionprey except SI, 
    * all pred/prey mass except SI mass unit, 
    * prey/pred common name 
    * reference
    * Predator TL/FL/SL conversion reference
    * Predator fork length	Predator total length	
    * Predator TL/FL/SL conversion reference	
    * Predator measurement type	
    * Predator length-mass conversion method	
    * Predator length-mass conversion reference	
    * Predator quality of length-mass conversion	
    * Predator mass	Predator mass unit	
    * Predator mass check	
    * Predator mass check diff	
    * Predator ratio mass/mass
    * Predator length	
    * Predator length unit
### 2) Check units + types (int/float/string) Marion
### 3) visualize data (variables to be used, check unusualities) : Emilie + Feryel
    * box plot/ skewness test + histograms, (frequency distribution) 
    * temperature vs location, 
    * size predator vs size prey , 
    * size pred/prey vs envrionmental factors (temp, location, pp, depth) 
    * pp vs location 
    * heatmap (size pred/prey + temp + depth + location + pp) -> compare heatmap prey vs pred
    * heatmap size pred size prey

### 4) Data cleaning : Zeineb
    * remove les valeurs impo
    * remove les colonnes avec plus de 70/60 ? % 
    * Add column to convert length in SI (predator)
    * Handle nans + duplicates (indiviidual id ne pas enlever, juste lui assigner une valeur)
    


### 5) Data transformation : Alena
    * log-transformation (make it normal distribution) A NE PAS FAIRE MNTN (une fois on a trouvé des méthdodes)
    * check possible methods to use for correlate features + analyze data

### 6) Analyse : Alena 
    * classify (create dict to group) prey and pred sizes en ordre de grandeur  