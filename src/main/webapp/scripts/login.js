const container = document.getElementsByClassName("main-container")[0];
const login_buttcontainer = document.getElementsByClassName("login_button")[0];
const login_btn = document.getElementsByClassName("loginbtn")[0];
const login_anim_div = document.getElementsByClassName('butt-anim-div')[0];


login_btn.addEventListener("mouseover", () => {
    login_anim_div.className = 'butt-anim-div btnanim'
})

login_btn.addEventListener("mouseleave", () => {
    login_anim_div.className = 'butt-anim-div'
})
