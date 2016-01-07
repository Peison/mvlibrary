<!DOCTYPE html>
<html>
	<head>		
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width,initial-scale=1.0,  maximum-scale=1.0, user-scalable=no">
		<link rel="stylesheet" href="\bootstrap-3.2.0-dist\css\bootstrap.min.css">		

		<style type="text/css">
			p{				
			 	text-indent: 2em;
			}
		</style>
	</head>
	<body>
	<div class="container">
     	<h2>表格</h2>
      	<p>  创建响应式表格 (将在小于768px的小型设备下水平滚动)。另外：添加交替单元格的背景色：</p>      
      	<div class="table-responsive">          
       	<table class="table table-striped table-bordered">
        	 <thead>
	           <tr>
	             <th>Number</th>
	             <th><a href="#">Name</a></th>
	             <th>Street</th>
	           </tr>
	         </thead>
	         <tbody>
	           <tr>
	             <td>1</td>
	             <td><a href="index.php">Anna Awesome</a></td>
	             <td>Broome Street</td>
	           </tr>
	           <tr>
	             <td>2</td>
	             <td>Debbie Dallas</td>
	             <td>Houston Street</td>
	           </tr>
	           <tr>
	             <td>3</td>
	             <td>John Doe</td>
	             <td>Madison Street</td>
	           </tr>
	         </tbody>
       </table>
      </div>

    <div class="row">
      <div class="col-md-3 col-sm-4 col-xs-6" style="background-color: #dedef8;box-shadow: 
         inset 1px -1px 1px #444, inset -1px 1px 1px #444;">
         <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do 
            eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut 
            enim ad minim veniam, quis nostrud exercitation ullamco laboris 
            nisi ut aliquip ex ea commodo consequat. 
         </p>

         <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem 
            accusantium doloremque laudantium, totam rem aperiam, eaque ipsa 
            quae ab illo inventore veritatis et quasi architecto beatae vitae 
            dicta sunt explicabo. 
         </p>
    </div>	        

   	<div class="col-md-3 col-sm-2 col-xs-6" style="background-color: #dedef8;box-shadow: 
         inset 1px -1px 1px #444, inset -1px 1px 1px #444;">
		  <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem 
            accusantium doloremque laudantium.
         </p>

         <p>Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, 
            consectetur, adipisci velit, sed quia non numquam eius modi 
            tempora incidunt ut labore et dolore magnam aliquam quaerat 
            voluptatem. 
         </p>         
   	</div>
	
	 <div class="clearfix visible-xs"></div>

	<div class="col-md-3 col-sm-2 col-xs-6" style="background-color: #dedef8;box-shadow: 
         inset 1px -1px 1px #444, inset -1px 1px 1px #444;">
         <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do 
            eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut 
            enim ad minim veniam, quis nostrud exercitation ullamco laboris 
            nisi ut aliquip ex ea commodo consequat. 
         </p>

         <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem 
            accusantium doloremque laudantium, totam rem aperiam, eaque ipsa 
            quae ab illo inventore veritatis et quasi architecto beatae vitae 
            dicta sunt explicabo. 
         </p>
    </div>

      <div class="col-md-3 col-sm-4 col-xs-6" style="background-color: #dedef8;box-shadow: 
         inset 1px -1px 1px #444, inset -1px 1px 1px #444;">
         <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem 
            accusantium doloremque laudantium.
         </p>

         <p>Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, 
            consectetur, adipisci velit, sed quia non numquam eius modi 
            tempora incidunt ut labore et dolore magnam aliquam quaerat 
            voluptatem. 
         </p>
   	  </div>	
	</div>

<br><h3>响应式表格布局</h3>
	<div class="table-responsive">	
   <table class="table  table-bordered table-hover">      
      <thead>
         <tr>
            <th>产品</th>
            <th>付款日期</th>
            <th>商家</th>
            <th>买家</th>
            <th>状态</th>
         </tr>
      </thead>
      <tbody>
         <tr class="active">
            <td>产品1</td>
            <td>23/11/2013</td>
            <td>simth</td>
            <td>lucy</td>
            <td>待发货</td>
         </tr>
         <tr class="success">
            <td>产品2</td>
            <td>10/11/2013</td>
            <td>simth</td>
            <td>lucy</td>
            <td>发货中</td>
         </tr>
         <tr class="warning">
            <td>产品3</td>
            <td>20/10/2013</td>
            <td>simth</td>
            <td>jack</td>
            <td>待确认</td>            
         </tr>
         <tr class="danger">
            <td>产品4</td>
            <td>20/10/2013</td>
            <td>simth</td>
            <td>jack</td>
            <td>已退货</td>            
         </tr>
      </tbody>
   </table>
</div>  
	<form class="form-horizontal" role="form" action="#" method="get">
	   <div class="form-group ">
	      <label for="firstname" class="col-sm-2 control-label">名字</label>
	      <div class="col-sm-5">
	         <input type="text" class="form-control" id="firstname" name="firstname" 
	            placeholder="请输入名字">
	      </div>
	   </div>
	   <div class="form-group">
	      <label for="lastname" class="col-sm-2 control-label">姓</label>
	      <div class="col-sm-5">
	         <input type="text" class="form-control" id="lastname" name="lastname"
	            placeholder="请输入姓">
	      </div>
	   </div>
	   <div class="form-group">
	      <label for="birthday" class="col-sm-2 control-label ">出生日期</label>
	      <div class="col-sm-5">
	         <input type="datetime" class="form-control" id="birthday" name="birthday"
	            placeholder="请输入出生日期" required="required" disabled="true">
	      </div>
	   </div>	   

	   <div class="form-group ">
	   		<label for="self_desc" class="col-sm-2 control-label">自我介绍</label>
	   		<div class="col-sm-5">
    			<textarea class="form-control" placeholder="请输入自我介绍" name="self_desc"
    			rows="5"></textarea>
    		</div>
	   </div>

	   <div class="form-group">
	      <div class="col-sm-offset-2 col-sm-5">
	         <div class="checkbox">
	            <label>
	               <input type="checkbox"> 请记住我
	            </label>
	         </div>
	      </div>
	   </div>
	   <div class="form-group">
	      <div class="col-sm-offset-2 col-sm-5">
	         <button type="submit" class="btn btn-default">登录</button>	         
	      </div>
	   </div>
	</form>	
	<div class="col-sm-offset-2 col-sm-5">
	<button class="btn btn-primary btn-block">验证</button>
	</div>
	
  </div>

  <hr>  
  <p class="text-center
   ">copyright@peison<p>
  <br>
  <br>
		<script src="\bootstrap-3.2.0-dist\js\jquery-1.11.1.min.js"></script>
		<script src="\bootstrap-3.2.0-dist\js\bootstrap.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
			  $(".btn-primary").click(function(){
			  		$(".form-group").toggleClass("has-success");			  		
			  });
			});
		</script>
	</body>	
</html>