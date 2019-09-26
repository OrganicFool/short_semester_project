// JavaScript Document
var i=1;
function plus(){
	i=i+1;
	document.getElementById("demo").innerHTML = i;
	document.getElementById("minu").removeAttribute("disabled");
}
function minus(){
	if(i<=0){
		document.getElementById("minu").setAttribute("disabled", true);
	}
	else{
		i=i-1;
		document.getElementById("demo").innerHTML = i;
		if(i==0){
			document.getElementById("minu").setAttribute("disabled", true);
		}
	}
}