const container = document.getElementsByClassName("main-container")[0];
const register_buttcontainer = document.getElementsByClassName("register_button")[0];
const register_btn = document.getElementsByClassName("registerbtn")[0];
const register_anim_div = document.getElementsByClassName('butt-anim-div')[0];
const alert_container = document.getElementsByClassName('alert-container')[0];
const pbar = document.getElementsByClassName('progress')[0];
const pwdvalidation = document.getElementsByClassName('pwdvalidation')[0];
const infobtn = document.getElementsByClassName('info-icon')[0];
const pwdtextbox = document.querySelector(".register input[type='password']");
const tccheck = document.querySelector(".tandc input[type='checkbox']");
const rules = document.querySelectorAll(".pwdvalidation ul li");
const pwdvisiblebtn = document.querySelector(".pwdvisibility");
const alertcontent = document.querySelector(".alert .alertcontent");

var given_pwd = "";

function verifypwd(pwd){
    const p2 = /[!,._()@#%^&*]/
    const p3 = /[0-9]/
    const c1 = pwd.length > 5;
    const c2 = p2.test(pwd);
    const c3 = p3.test(pwd);
    rules[0].style.color = c1 ? 'green' : 'red'
    rules[1].style.color = c2 ? 'green' : 'red'
    rules[2].style.color = c3 ? 'green' : 'red'
    return (c1&c2&c3);
}

register_btn.addEventListener("mouseover", () => {
    register_anim_div.className = 'butt-anim-div btnanim'
})

register_btn.addEventListener("mouseleave", () => {
    register_anim_div.className = 'butt-anim-div'
})

register_btn.addEventListener("click", (e) => {
    
    if(!verifypwd(given_pwd)){
	    e.preventDefault();
        alert_container.className='alert-container alert-drop';
        pbar.className='progress progressing';
        alertcontent.textContent = "password constraints aren't satisfied.";
        setTimeout(()=>{
            alert_container.className='alert-container alert-lift';
            pbar.className='progress';
        }, 4800)
    }
    else if(!tccheck.checked){
	        e.preventDefault();
            alert_container.className='alert-container alert-drop';
            pbar.className='progress progressing';
            alertcontent.textContent = "Please check the terms and conditions.";
            setTimeout(()=>{
                alert_container.className='alert-container alert-lift';
                pbar.className='progress';
            }, 4800)
    }
    
})

infobtn.addEventListener("click", () => {
    pwdvalidation.classList.toggle("show-info-box");
})

pwdtextbox.addEventListener("keyup", (e) => {
    given_pwd = e.target.value;
    const bool = verifypwd(given_pwd);
    if(bool){
        e.target.classList.remove("invalidpwd");
        e.target.classList.add("validpwd");
    }else{
        e.target.classList.remove("validpwd");
        e.target.classList.add("invalidpwd");
    }
})

pwdvisiblebtn.addEventListener("click", () => {
    const type = pwdtextbox.type;
    if(type == "password") {
        pwdtextbox.type = "text";
        pwdvisiblebtn.innerHTML = "HIDE";
    }
    else {
        pwdtextbox.type = "password";
        pwdvisiblebtn.innerHTML = "SHOW";
    }
})
