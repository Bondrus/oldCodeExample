SELECT SQL_CALC_FOUND_ROWS spd.id, raj.raj, tiposob.tiposob, tipspd.tipspd, 
spd.nazva, spd.kod, spd.pib, spd.uradresa, spd.factadresa, 
spd.telefon, spd.dedit
FROM spd
LEFT OUTER JOIN tiposob ON spd.tiposob = tiposob.id
LEFT OUTER JOIN tipspd ON spd.tipspd = tipspd.id
LEFT OUTER JOIN raj ON spd.raj = raj.id, filtr f
where (spd.raj=f.raj or f.raj=0) 
and (spd.tiposob=f.tiposob or f.tiposob=0) 
and (spd.tipspd=f.tipspd or f.tipspd=0) 
and (spd.nazva like f.nazva or f.nazva="") 
and (spd.kod=f.kod or f.kod=0) 
and (spd.pib like f.pib or f.pib="") 
and (spd.uradresa like f.uradresa or f.uradresa="") 
and (spd.factadresa like f.factadresa or f.factadresa="") 
and (spd.telefon like f.telefon or f.telefon="") 
and (spd.dedit like f.dedit or f.dedit="") 
%WHERE%
%ORDER%
limit %STARTROW%,5