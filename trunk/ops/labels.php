<?php
	function open_db()
	{
		$db = new SQLiteDatabase("labels.db");
		$q = $db->query('PRAGMA table_info(product)');
		if ($q->numRows() == 0) {
		   $db->query('create table product(
				   id integer primary key,
				   title varchar(255),
				   subtitle varchar(255),
				   url varchar(255),
				   sku varchar(32))');
		}
		return $db;
	}

$db = open_db();
$id = $_GET['id'];
if ($id == '') {
    $id = -1;
    // Lookup SKU
    if ($_GET['sku'] != '') {
       $q = $db->query("select id from product where sku='".$_GET['sku']."'");
       if ($q->numRows() != 0) {
       	  $id = $q->column('id');
       }
    }
} 

if ($id != -1) {
    $q = $db->query('select title,subtitle,url,sku from product where id='.$id);
    if ($q->numRows() != 0) {
        $title = $q->column('title');
        $subtitle = $q->column('subtitle');
        $url = $q->column('url');
        $sku = $q->column('sku');
    }

}
?>
 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>LabelMaker</title>
		<meta http-equiv="content-type" content="text/html; charset=ISO-8859-1" >
		<meta http-equiv="Content-Script-Type" content="text/javascript" >
		<meta http-equiv="Content-Style-Type" content="text/css" >
		<link rel="stylesheet" type="text/css" href="css/ops.css" >
	</head>
	<body>
	        <div id="formblock">
		<h1>Name lookup</h1>
		  <form method="GET" name="selectlabel" action="labels.php">
		    <select name="id" id="id" onChange="this.form.submit()">
<?php
$q = $db->query('select id,title,subtitle from product order by title,subtitle');
$n = $q->numRows();
if ($id == -1) {
   print '<option value="-1" selected>-- Use existing label... --</option>\n';
} else {
   print '<option value="-1" selected>-- Create new label... --</option>\n';
}
while($n > 0) {
  $selected = "";
  if ($q->column('id') == $id) { $selected = " selected"; }
  print '<option value="'.$q->column('id').'"'.$selected.'>'.$q->column('title');
  if ($q->column('subtitle')) {
     print '/'.$q->column('subtitle');
  }
  print '</option>\n';
  $q->next();
  $n = $n-1;
}

?>
		    </select>
		  </form>
		</div>
		<div id="formblock">
		<h1>SKU lookup</h1>
		  <form method="GET" name="selectlabel" action="labels.php">
			<input type="submit" value="Lookup SKU"/>
			<input type="text" name="sku" id="sku" value="<?= $sku ?>"></input>
		  </form>
		</div>
		<div id="formblock" name="formblock">
		<h1>Label contents</h1>
		<form method="POST" action="labelmaker.php">
			<input type="hidden" name="id" id="id" value="<?= $id ?>"/>
			<label for="title">Title of product:</label>
			<input type="text" name="title" id="title" value="<?= $title ?>"></input><br/>
			<label for="subtitle">Subtitle of product:</label>
			<input type="text" name="subtitle" id="subtitle" value="<?= $subtitle ?>"></input><br/>
			<label for="url">Short URL of instructions:</label>
			<input type="text" name="url" id="url" value="<?= $url ?>"></input><br/>
			<label for="sku">SKU:</small>include "MB" for our products</small></label>
			<input type="text" name="sku" id="sku" value="<?= $sku ?>"></input><br/>
			<label for="debug">Generate debug label:</label><input type="checkbox" name="debug" id="debug" value="true"></input><br/>

			<input type="submit" name="generate" value="Generate label"/>
			<?php if ($id == -1) { ?>
			      <input type="submit" name="store" value="Create label template"/>
			<?php } else { ?>
			      <input type="submit" name="update" value="Update label template"/>
			      <input type="submit" name="delete" value="Delete label template"/>
			      <input type="submit" name="store" value="Create new label template"/>
			<?php }  ?>

		</form>
		</div>
	</body>
</html>
