
<!-- BEGIN row2 -->
<hr>
<b>
Вибір за параметрами
<form action="index.php" method="post">
  <input type="hidden" name="oper" value="main">
  <input type="submit" name="filtr" class="filtrsubmit" value="Фільтрувати" title="Фільтрувати">  
</form>
</b>
 <table border>
  <tr class="{class}">
  <td>Район</td>
  <td>тип особи</td>
  <td>тип об’єкта СПД </td>  
  <td>повна назва СПД</td>    
  <td>код ЄДРПОУ</td>      
  <td>ПІБ керівника/власника</td>        
  <td>юридична адреса</td>          
  <td>фактична адреса</td>            
  <td>контактні телефон/факс</td>   
  <td>дата редагування</td>               
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
Допускається фільтрація за шаблонами: %значення%
<!-- END row2 -->


