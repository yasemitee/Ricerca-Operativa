# Esercizio mix produttivo

# DATI
param nR;                           # Numero di reparti
param nP;                           # Numero di prodotti
set R := 1..nR;                     # Insieme dei reparti
set P := 1..nP;                     # Insieme dei prodotti
param profitti {P};                 # Profitto unitario [€/unità]
param risorseDisponibili {R};       # Risorse disponibili [h-uomo/sett]
param tempiLavorazione {R, P};      # Tempi di lavorazione [h-uomo/unità]

# VARIABILI
var x {P} >= 0;                           # Numero di veicoli prodotti per settimana

# VINCOLI
# Massimo consumo per ogni risorsa
subject to consumi {i in R}:
    sum {j in P} tempiLavorazione[i,j] * x[j] <= risorseDisponibili[i];

# OBBIETTIVO
# Massimizzazione dei profitti
maximize z: sum {i in P} profitti[i] * x[i];

###################

data;
param nR := 5;
param nP := 3;
param profitti := 
1			  840
2			 1120
3			 1200;
param risorseDisponibili := 
1			 120
2			  80
3			  96
4			 102
5			  40;
param tempiLavorazione : 
    1	2	3 :=
1   3	2	1
2   1	2	3
3   2	0	0
4   0	3	0
5   0	0	2;
end;