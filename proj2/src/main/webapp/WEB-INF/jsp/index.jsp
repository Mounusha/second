<!DOCTYPE html>
<html lang="en">
<script
	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<body>
<div data-ng-app="myApp" data-ng-controller="formCtrl">
<form name="formData" >
<pre>
User name : <input type="text" data-ng-model="username">
			
Password  : <input type="text" data-ng-model="password"> 
			
Mobile    : <input type="number" data-ng-model="mobile">
		
               <button type="submit">Submit</button>      
		
</pre>		    
</form>
</div>

	
  </script>
</body>
</html>
