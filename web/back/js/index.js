$(document).ready(function(){
	$("#formClick").click(function(){
		alert("aaaa");
		$("#content").load("../form/form.html",function(aa){
			alert(aa);
		});
	});
});