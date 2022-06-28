
var q = document.querySelectorAll(".qty");
q.forEach((i)=>{
	i.addEventListener('change',function(){
		const td = i.parentElement;
		const price = td.previousElementSibling;
		const tot= td.nextElementSibling;
		tot.innerText="$"+(parseInt(price.innerText.slice(2))*parseInt(i.value)).toString();
	});
});

setInterval(function(){
	var total=document.getElementById("total");
	var sub=document.querySelectorAll(".tot-col");
	var tot=document.getElementById('totalpri');
	var t1=0;
	sub.forEach((i)=>{
		t1+=parseInt(i.innerText.slice(1));
	});
	total.innerText=t1.toString();
	t1=t1*(106/100)+80;
	tot.innerText=t1.toString();
},50);