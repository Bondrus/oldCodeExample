select spd.raj as nn, raj.raj, sum(if(spd.tipspd=3,1,0)) as k3, 
sum(if(spd.tipspd=3,spd.mest,0)) as m3, 
sum(if(spd.tipspd=3 and spd.tiprest<>9,1,0)) as k31, 
sum(if(spd.tipspd=3 and spd.tiprest=1,1,0)) as k311, 
sum(if(spd.tipspd=3 and spd.tiprest=2,1,0)) as k312, 
sum(if(spd.tipspd=3 and spd.tiprest=3,1,0)) as k313, 
sum(if(spd.tipspd=3 and spd.tiprest=4,1,0)) as k314, 
sum(if(spd.tipspd=3 and spd.tiprest=5,1,0)) as k315, 
sum(if(spd.tipspd=3 and spd.tiprest=6,1,0)) as k316, 
sum(if(spd.tipspd=3 and spd.tiprest=7,1,0)) as k317, 
sum(if(spd.tipspd=3 and spd.tiprest=8,1,0)) as k318, 
sum(if(spd.tipspd=3 and spd.tiprest=9,1,0)) as k32
from spd left outer join raj on spd.raj=raj.id , filtr f
where (spd.raj=f.raj or f.raj=0) 
and (spd.tiposob=f.tiposob or f.tiposob=0) 
and (spd.tipspd=f.tipspd or f.tipspd=0) 
and (spd.nazva like f.nazva or f.nazva="") 
and (spd.kod=f.kod or f.kod=0) 
and (spd.pib like f.pib or f.pib="") 
and (spd.uradresa like f.uradresa or f.uradresa="") 
and (spd.factadresa like f.factadresa or f.factadresa="") 
and (spd.telefon like f.telefon or f.telefon="") 
%WHERE%
group by spd.raj