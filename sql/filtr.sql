SELECT raj.raj, tiposob.tiposob, tipspd.tipspd, 
f.nazva, f.kod, f.pib, f.uradresa, f.factadresa, 
f.telefon, f.dedit
FROM filtr f
LEFT OUTER JOIN tiposob ON f.tiposob = tiposob.id
LEFT OUTER JOIN tipspd ON f.tipspd = tipspd.id
LEFT OUTER JOIN raj ON f.raj = raj.id
where 1=1
%WHERE%