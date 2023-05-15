<?php
include './adminheader.php';
?>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<?php
if(!isset($_POST['submit1'])) {
$result = mysqli_query($link, "select pid,brand,pname from product order by cname");
?>
<center>
<div>
<a href="achart.php">Gender wise Sales</a> |
<a href="achart1.php">City wise Sales</a> | 
<a href="achart2.php">Country wise Sales</a>
</div>
<br><br>
</center>
<h4 style="text-align:center;">COUNTRY WISE SALES</h4>
<form name="f" action="achart2.php" method="post">
<center>
Select Product
<select name="pid">
<?php
while($row = mysqli_fetch_row($result)) {
echo "<option value='$row[0]'>$row[1] - $row[2]</option>";
}
mysqli_free_result($result);
?>
</select>
<br><br>
<input type="submit" name="submit1" value="Show Chart">
</center>
</form>
<?php
} else {
	extract($_POST);
$result = mysqli_query($link, "select country,count(*) as countt from pur p,newuser n where p.userid=n.userid and p.pid='$pid' group by country");
if(mysqli_num_rows($result)) {
?>
<script type="text/javascript">
 google.load("visualization", "1", {packages:["corechart"]});
 google.setOnLoadCallback(drawChart);
 function drawChart() {
 var data = google.visualization.arrayToDataTable([
 ['Country','Count'],
 <?php 
	while($row = mysqli_fetch_array($result)){
	echo "['".$row['country']."',".$row['countt']."],";
	}
?> 
]);

var options = {
	title: 'Sales of Product according to Country',
	pieHole: 0.5,
	pieSliceTextStyle: {
	color: 'black',
	},
	legend: 'bottom'
};
var chart = new google.visualization.ColumnChart(document.getElementById("columnchart12"));
chart.draw(data,options);
}	
</script>
<?php
//while($row = mysqli_fetch_row($result))
//echo "<br>$row[0] - $row[1]";
} else {
echo "<center>No Purchase Record Found...!</center>";
}
mysqli_free_result($result);
}
?>
<div class="container-fluid">
<div id="columnchart12" style="width: 100%; height: 500px;"></div>
</div>
<?php
include './adminfooter.php';
?>