<!-- BEGIN row2 -->
<b>�������� ���������� �� �ᒺ���� ������, ������, ������������ ������������ �� ��������� ������ </b>
<form action="index.php" method="post">
 <table border>
  <tr class="{class}" >
  <td><a href="index.php?oper=main&order=id">ID ���.</a></td>
  <td><a href="index.php?oper=main&order=raj">�����</a></td>
  <td><a href="index.php?oper=main&order=tiposob">��� �����</a></td>
  <td><a href="index.php?oper=main&order=tipspd">��� �ᒺ��� ��� </a></td>  
  <td><a href="index.php?oper=main&order=nazva">����� ����� ���</a></td>    
  <td><a href="index.php?oper=main&order=kod">��� ������</a></td>      
  <td><a href="index.php?oper=main&order=pib">ϲ� ��������/��������</a></td>        
  <td><a href="index.php?oper=main&order=uradresa">�������� ������</a></td>          
  <td><a href="index.php?oper=main&order=factadresa">�������� ������</a></td>            
  <td><a href="index.php?oper=main&order=telefon">�������� �������/����</a></td>               
  <td><a href="index.php?oper=main&order=dedit">���� �����������</a></td>               
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
 ������ {allrecords} ������
 </td></tr>
   
   
   </table>
</form>
 

 



<!-- END row2 -->


