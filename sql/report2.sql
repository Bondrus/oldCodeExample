select spd.raj as nn, raj.raj, sum(if(spd.tipspd=2,1,0)) as k2, 
sum(if(spd.tipspd=2,spd.mest,0)) as m2, 
sum(if(spd.tipspd=2,spd.razmer,0)) as s2, 

sum(if(spd.tipspd=2 and spd.tipsob=1,1,0)) as k201, 
sum(if(spd.tipspd=2 and spd.tipsob=2,1,0)) as k202, 
sum(if(spd.tipspd=2 and spd.tipsob=3,1,0)) as k203, 

sum(if(spd.tipspd=2 and spd.tipsferadeyat=1,1,0)) as k21, 
sum(if(spd.tipspd=2 and spd.tipsferadeyat=1,spd.mest,0)) as m21, 

sum(if(spd.tipspd=2 and spd.tipsferadeyat=1 and spd.tipdeyat=1,1,0)) as k211, 
sum(if(spd.tipspd=2 and spd.tipsferadeyat=1 and spd.tipdeyat=1,spd.mest,0)) as m211, 
sum(if(spd.tipspd=2 and spd.tipsferadeyat=1 and spd.tipdeyat=2,1,0)) as k212, 
sum(if(spd.tipspd=2 and spd.tipsferadeyat=1 and spd.tipdeyat=2,spd.mest,0)) as m212, 
sum(if(spd.tipspd=2 and spd.tipsferadeyat=1 and spd.tipdeyat=3,1,0)) as k213, 
sum(if(spd.tipspd=2 and spd.tipsferadeyat=1 and spd.tipdeyat=3,spd.mest,0)) as m213, 

sum(if(spd.tipspd=2 and spd.tipsferadeyat=2,1,0)) as k22, 
sum(if(spd.tipspd=2 and spd.tipsferadeyat=2,spd.mest,0)) as m22, 

sum(if(spd.tipspd=2 and spd.tipsferadeyat=2 and spd.tipdeyat=1,1,0)) as k221, 
sum(if(spd.tipspd=2 and spd.tipsferadeyat=2 and spd.tipdeyat=1,spd.mest,0)) as m221, 

sum(if(spd.tipspd=2 and spd.tipsferadeyat=2 and spd.tipdeyat=1,spd.mestselo,0)) as m2211, 
sum(if(spd.tipspd=2 and spd.tipsferadeyat=2 and spd.tipdeyat=1,spd.mestlgot,0)) as m2212, 

sum(if(spd.tipspd=2 and spd.tipsferadeyat=2 and spd.tipdeyat=2,1,0)) as k222, 
sum(if(spd.tipspd=2 and spd.tipsferadeyat=2 and spd.tipdeyat=2,spd.mest,0)) as m222, 
sum(if(spd.tipspd=2 and spd.tipsferadeyat=2 and spd.tipdeyat=3,1,0)) as k223, 
sum(if(spd.tipspd=2 and spd.tipsferadeyat=2 and spd.tipdeyat=3,spd.mest,0)) as m223, 

sum(if(spd.tipspd=2 and spd.tipsferadeyat=2 and spd.tipdeyat=3,spd.mestselo,0)) as m2231, 
sum(if(spd.tipspd=2 and spd.tipsferadeyat=2 and spd.tipdeyat=3,spd.mestlgot,0)) as m2232 

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
