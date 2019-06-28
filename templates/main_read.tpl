<!-- BEGIN row2 -->
<b>Загальна інформація по об’єктах торгівлі, ринках, ресторанного господарства та побутових послуг </b>
<form action="index.php" method="post">
 <table border>
  <tr class="{class}" >
  <td><a href="index.php?oper=main&order=id">ID зап.</a></td>
  <td><a href="index.php?oper=main&order=raj">Район</a></td>
  <td><a href="index.php?oper=main&order=tiposob">тип особи</a></td>
  <td><a href="index.php?oper=main&order=tipspd">тип об’єкта СПД </a></td>  
  <td><a href="index.php?oper=main&order=nazva">повна назва СПД</a></td>    
  <td><a href="index.php?oper=main&order=kod">код ЄДРПОУ</a></td>      
  <td><a href="index.php?oper=main&order=pib">ПІБ керівника/власника</a></td>        
  <td><a href="index.php?oper=main&order=uradresa">юридична адреса</a></td>          
  <td><a href="index.php?oper=main&order=factadresa">фактична адреса</a></td>            
  <td><a href="index.php?oper=main&order=telefon">контактні телефон/факс</a></td>               
  <td><a href="index.php?oper=main&order=dedit">дата редагування</a></td>               
  </tr>
<!-- BEGIN row -->
  <tr class="{class}" >
<!-- BEGIN cell -->
   <td>
    {DATA}
   </td>
<!-- END cell -->
  </tr>
<!-- END row -->
 </table>
<table class="clean"><tr class="clean"> <td class="clean"><form action="index.php" method="post">
 <input type="hidden" name="order" value="{order}"> 
 <input type="hidden" name="startrow" value="{prev}">
 <input type="submit" name="prev" class="prevsubmit" value="<---------">
 </form> 
 </td><td class="clean">
 <form action="index.php" method="post">
 <input type="hidden" name="order" value="{order}"> 
  <input type="hidden" name="startrow" value="{next}">
  <input type="submit" name="next" class="nextsubmit" value="--------->"> </form>
   </td><td class="clean">
 Всього {allrecords} записів
 </td></tr>
   
   
   </table>
</form>
 

 



<!-- END row2 -->


