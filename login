<?php
session_start();

if($_POST){

    $email = (isset ($_POST['use']));
    $password = $_POST['password'];
    
    try {
        $host = '127.0.0.1';
        $dbname = 'dbass';
        $user = 'root';
        $pass = '';
        # MySQL with PDO_MYSQL
     
	 $DBH = new PDO("mysql:host=$host;dbname=$dbname", $user, $pass);
    } catch(PDOException $e) {echo 'Error';}  


    
   
    $q = $DBH->prepare("select * from signup1 where email = :email and password = :password LIMIT 1");
    $q->bindValue(':email', $email);
    $q->bindValue(':password',  $password);
    $q->execute();
    $check = $q->fetch(PDO::FETCH_ASSOC);
 
    $message = '';
    if (!empty($check)){
        $email = $check['email'];
        
        $message = 'Loggin in!';
    } else {
         $message= 'Sorry your log in details are not correct';
    }
    
}
?>
<h2>Login</h2><br></br>
<form action="login.php" method="post">
Username <input type="text" name="email"/>
Password <input type="text" name="password"/>
<input type="submit"/>
<?php
    if(!empty($message)){
     echo '<br>';
     echo $message;
    }
 ?>
</form>
