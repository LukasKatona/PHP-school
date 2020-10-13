<?php
    session_start();
?>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

<?php
        if (empty($_SESSION["jazyk"]))
        {
            $_SESSION["jazyk"] = "sk";
        }

        if (!empty($_GET["jazyk"]))
        {
            $_SESSION["jazyk"] = $_GET["jazyk"];
        }
        #var_dump($_SESSION["jazyk"]);
?>

<?php
$servername = "localhost:3308";
$username = "root";
$password = "";
$dbname = "katona";

// Create connection
$conn = mysqli_connect($servername, $username, $password, $dbname);
// Check connection
if (!$conn) {
  die("Connection failed: " . mysqli_connect_error());
}

if (!empty($_GET["trieda"]))
{
    $where = " WHERE rozvrh.trieda = '".$_GET["trieda"]."'";
}
else
{
    $where = "";
}

$sql = "SELECT * FROM rozvrh".$where;
$result = mysqli_query($conn, $sql);

if (mysqli_num_rows($result) > 0) {
  // output data of each row
  while($row = mysqli_fetch_assoc($result)) {
    $rozvrh[$row["den"]][$row["hodina"]] = $row["predmet"];
  }
} else {
  echo "0 results";
}

#mysqli_close($conn);
?>

<?php
$dni = array ("Pondelok", "Utorok", "Streda", "Stvrtok", "Piatok");
$hodiny = array (0,1,2,3,4,5,6,7);
?>

<div style="margin: 10px">

<a href = "tabulka.php?jazyk=sk">slovensky</a>
<a href = "tabulka.php?jazyk=en">anglicky</a>

<?php
    $sql = "SELECT trieda FROM rozvrh GROUP BY trieda ORDER BY trieda";
    $result = mysqli_query($conn, $sql);
    while ($row = mysqli_fetch_assoc($result))
    {
        echo "<br><a href =  tabulka.php?trieda=".$row["trieda"].">".$row["trieda"]."</a>";
    }
?>
<hr>

<table border=1 class="table">
    <tr>
        <th>DEN</th>
        <?foreach ($hodiny As $i=>$hodina):?>
            <th style="text-align: center"><?echo $hodina;?></th>
        <?endforeach;?>
    </tr>

    <?foreach ($dni As $i=>$den):?>
        <tr>
            <th><?echo $den;?></th>
            <?foreach ($hodiny as $j=>$hodina):?>
                <td style="text-align: center"><?echo @$rozvrh[$i][$j];?></td>
            <?endforeach;?>
        </tr>
    <?endforeach;?>
</table>
<hr>

<?php
    #echo "<pre>";
    #var_dump($rozvrh);
?>

</div>