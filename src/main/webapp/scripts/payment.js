const cardnuminput = document.querySelector("input.cardnum");
const expmnth = document.querySelectorAll(".exp-input input")[0];
const expyr = document.querySelectorAll(".exp-input input")[1];
const cvv = document.querySelector(".cvv input");

cardnuminput.addEventListener("keyup", (e) => {
    num = e.target.value;
    if(num.length == 4 || num.length == 9 || num.length == 14){
        e.target.value += '-';
    }else if(num.length == 19){
        expmnth.focus();
    }
})

expmnth.addEventListener("keyup", (e) => {
    num = e.target.value;
    if(num.length == 2){
        expyr.focus();
    }
})

expyr.addEventListener("keyup", (e) => {
    num = e.target.value;
    if(num.length == 2){
        cvv.focus()
    }
})

cvv.addEventListener("keyup", (e) => {
    num = e.target.value;
    if(num.length == 3){
        cvv.blur()
    }
})