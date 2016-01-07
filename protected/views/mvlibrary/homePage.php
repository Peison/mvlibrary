
<!DOCTYPE html>
<html>
	<head>
		<?php require_once 'header.php';?>
		<link rel="stylesheet" href="public\css\HomePage.css">
	</head>
<body>
	<div class="container">
		<?php require_once 'banner.php';?>						
		<div class="photo">
			<?php 
				$point = 0;
				$length = count($movie);
				foreach ($movie as $item){
					if($point % 4 == 0){
						echo "<div class=\"row\">";
					}
			    ?>
				<div class="col-md-3 col-xs-6">
					<div class="thumbnail">
						<a href="?r=Mvlibrary/movie&id=<?php echo $item['MovieID'];?>">
						<img src="<?php echo $item['Poster'];?>" alt="<?php echo $item['Title'];?>" style="vertical-align: middle;"></a>
					</div>
					<div class="desc">
						<a href="?r=Mvlibrary/movie&id=<?php echo $item['MovieID'];?>"><?php echo $item['Title'];?></a>
					</div>
				</div>
			<?php 
				if($point % 4 == 3 || $point + 1 == $length){
					echo "</div>";
				}
				$point++;}
			?>
			
		</div>
		<?php require_once 'footer.php';?>
	</div>		
</body>
</html>