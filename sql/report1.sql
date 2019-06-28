select spd.raj as nn, raj.raj, sum(if(spd.tipspd=1,1,0)) as k1, 
sum(if(spd.tipspd=1 and spd.tipsferadeyat=1,1,0)) as k11, 
sum(if(spd.tipspd=1 and spd.tipsferadeyat=1 and spd.tipdeyat=1,1,0)) as k111, 
sum(if(spd.tipspd=1 and spd.tipsferadeyat=1 and spd.tipdeyat=2,1,0)) as k112, 
sum(if(spd.tipspd=1 and spd.tipsferadeyat=1 and spd.tipdeyat=3,1,0)) as k113, 

sum(if(spd.tipspd=1 and spd.tipsferadeyat=2,1,0)) as k12, 
sum(if(spd.tipspd=1 and spd.tipsferadeyat=2 and spd.tipdeyat=1,1,0)) as k121, 
sum(if(spd.tipspd=1 and spd.tipsferadeyat=2 and spd.tipdeyat=2,1,0)) as k122, 
sum(if(spd.tipspd=1 and spd.tipsferadeyat=2 and spd.tipdeyat=3,1,0)) as k123, 

sum(if(spd.tipspd=1 and spd.tipsferadeyat=2 and spd.tiprozdrib=1,1,0)) as k124, 
sum(if(spd.tipspd=1 and spd.tipsferadeyat=2 and spd.tiprozdrib=1,spd.razmer,0)) as s124, 

sum(if(spd.tipspd=1 and spd.tipsferadeyat=2 and spd.tiprozdrib=1 and spd.tipdeyat=1,1,0)) as k1241, 
sum(if(spd.tipspd=1 and spd.tipsferadeyat=2 and spd.tiprozdrib=1 and spd.tipdeyat=2,1,0)) as k1242, 
sum(if(spd.tipspd=1 and spd.tipsferadeyat=2 and spd.tiprozdrib=1 and spd.tipdeyat=3,1,0)) as k1243, 

sum(if(spd.tipspd=1 and spd.tipsferadeyat=2 and spd.tiprozdrib=2,1,0)) as k125, 
sum(if(spd.tipspd=1 and spd.tipsferadeyat=2 and spd.tiprozdrib=2,spd.razmer,0)) as s125, 

sum(if(spd.tipspd=1 and spd.tipsferadeyat=2 and spd.tiprozdrib=2 and spd.tipdeyat=1,1,0)) as k1251, 
sum(if(spd.tipspd=1 and spd.tipsferadeyat=2 and spd.tiprozdrib=2 and spd.tipdeyat=2,1,0)) as k1252, 

sum(if(spd.tipspd=1 and spd.tipsferadeyat=3 and spd.tiprozdrib=2,1,0)) as k126, 
sum(if(spd.tipspd=1 and spd.tipsferadeyat=3 and spd.tiprozdrib=2,spd.razmer,0)) as s126, 

sum(if(spd.tipspd=1 and spd.tipsferadeyat=3 and spd.tiprozdrib=2 and spd.tipdeyat=1,1,0)) as k1261, 
sum(if(spd.tipspd=1 and spd.tipsferadeyat=3 and spd.tiprozdrib=2 and spd.tipdeyat=2,1,0)) as k1262 
from spd left outer join raj on spd.raj=raj.id, filtr f
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
