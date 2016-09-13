<!DOCTYPE html>
<?php session_start(); ?>

<html>
    <head>
        <title>WorkMates</title>
    </head>
	
	<body> 
	<?php 
	 
	echo "Welcome to WorkMates, " . $_SESSION['username'] . "! </br></br>";
	  
	
	echo "Name: " . $_SESSION['firstname'] . " " . $_SESSION['surname']. "</br>";
	echo "E-mail Address: " . $_SESSION['email'];
	echo "</br>" . "Age: " . $_SESSION['age']. "</br>";
	?>
	</body>    
	
	<?php 
	
	
	
	
	try {
			$host = '127.0.0.1';
			$user = 'root';
			$pass = '';
		
		# MySQL with PDO_MYSQL
		
			$DBH = new PDO("mysql:host=$host;dbname=dbass", $user, $pass);
		} catch(PDOException $e) {echo $e->getMessage();}
	


    $q = $DBH->prepare("select * from signup1");
  
	$q->execute();

    $check = $q->fetchAll(PDO::FETCH_ASSOC);

		echo '</br>Your Friends: </br>';
    
	foreach($check as $row){

       
	   echo '<a href="profile.php?id=' . $row['userID'] . '">' .$row['username'].'</a> </BR>';

    }


 
 ?>
<?php if ($_POST){
		
		$comments = $_POST['comments'];
	
try {
			$host1 = '127.0.0.1';
			$user1 = 'root';
			$pass1 = '';
		
		# MySQL with PDO_MYSQL
		
			$DBH1 = new PDO("mysql:host=$host1;dbname=dbass", $user1, $pass1);
		} catch(PDOException $e1) {echo $e1->getMessage();}
		
	
		
		$sql1 = "INSERT INTO `comments` (comment) VALUES (?);";
			
			$sth1 = $DBH1->prepare($sql1);
			
			$sth1->bindParam(1,$comments,PDO::PARAM_INT);
			$sth1->execute();
			global $nextComment;
			echo $comments;
			
			if (!empty($comments)){
				$_POST['comments'] = $nextComment++;
				echo $nextComment;
			}
			
			

}
	?>

 
</br> </br>

 <form action="profile.php" method="post">
    <textarea rows="4" cols="50" name="comments"> </textarea>  	
   <input type="submit" value="Send"/>
   
   </form>
</br> </br>
   <form action="logout.php" method="post">
      	
   <input type="submit" value="Logout"/>
   </form>	

	</html>
