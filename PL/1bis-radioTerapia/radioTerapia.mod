# Esercizio Radioterapia

# DATI
param nO;                              # Numero organi
param nP;                              # Numero posizioni
set organi := 1..nO;                 # insieme degli organi
set posizioni := 1..nP;              # insieme delle posizioni
param assOrgani {organi,posizioni};    # assorbimento degli organi adiacenti al tumore
param assTumore {posizioni};    # assorbimento degli organi adiacenti al tumore
param intensita {posizioni};           # Limite di radiazione erogabile da ogni posizione
param limite {organi};                 # Limite di assorbimento per ogni organo

# VARIABILI
# La radiazione erogata da ogni posizione
var x {posizioni} >= 0;

# VINCOLO
# Per ogni posizione non si può superare l'antensità massima
subject to limite_radiazione {p in posizioni}:
    x[p] <= intensita[p];

# Per ogni organo non si può superare il limite di assorbimento
subject to limite_assorbimento {o in organi}:
    sum {p in posizioni} assOrgani[o, p] * x[p] <= limite[o];

# Radiazione utilizzate <= a 60 Gray
subject to limite_gray:
    sum {p in posizioni} x[p] <= 600;


# OBBIETTIVO
maximize z: sum {p in posizioni} assTumore[p] * x[p];

####################

data;

param nO := 7;
param nP := 5;
param assOrgani:    
    1     2     3     4     5 :=
1   0.1   0.0   0.0   0.1   0.2
2   0.1   0.0   0.15  0.0   0.1
3   0.0   0.1   0.0   0.0   0.0
4   0.0   0.2   0.1   0.1   0.0
5   0.1   0.0   0.2   0.0   0.1
6   0.1   0.3   0.15  0.1   0.1
7   0.2   0.1   0.15  0.0   0.0;
param assTumore := 
1   0.40
2   0.30
3   0.25
4   0.70
5   0.50;
param intensita :=
1   120
2   130
3   100
4   150
5   150;
param limite :=
1   55
2   90
3   60
4   24
5   70
6   55
7   95;
end;