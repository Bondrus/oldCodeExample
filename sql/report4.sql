select spd.raj as nn, raj.raj, sum(if(spd.tipspd=4,1,0)) as k4, 
sum(if(spd.tipspd=4 and spd.tipviddeyat=1,1,0)) as k41, 
sum(if(spd.tipspd=4 and spd.tipviddeyat=2,1,0)) as k42, 
sum(if(spd.tipspd=4 and spd.tipviddeyat=3,1,0)) as k43, 
sum(if(spd.tipspd=4 and spd.tipviddeyat=4,1,0)) as k44, 
sum(if(spd.tipspd=4 and spd.tipviddeyat=5,1,0)) as k45, 
sum(if(spd.tipspd=4 and spd.tipviddeyat=6,1,0)) as k46, 
sum(if(spd.tipspd=4 and spd.tipviddeyat=7,1,0)) as k47, 
sum(if(spd.tipspd=4 and spd.tipviddeyat=8,1,0)) as k48 
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