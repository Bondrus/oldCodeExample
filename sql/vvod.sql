SELECT spd.id, raj.raj, tiposob.tiposob, tipspd.tipspd, 
spd.nazva, spd.kod, spd.pib, spd.uradresa, spd.factadresa, 
spd.telefon, spd.razmer
FROM spd
LEFT OUTER JOIN tiposob ON spd.tiposob = tiposob.id
LEFT OUTER JOIN tipspd ON spd.tipspd = tipspd.id
LEFT OUTER JOIN raj ON spd.raj = raj.id
