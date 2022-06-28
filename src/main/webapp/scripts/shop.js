const listdiv = document.querySelector(".in-list")
const searchbtn  = document.querySelector("nav .search-icon");
const searchdiv = document.querySelector(".searchdiv");
const searchbar = document.querySelector(".searchdiv .searchbar");
const headContent = document.querySelector(".head-content");



var searchbarVisible = false;

searchbtn.addEventListener("click", () => {
    searchdiv.classList.add("showup");
    searchbarVisible = true;
    searchbar.focus();
    window.onscroll = function(){
        searchdiv.classList.remove("showup");
        searchbarVisible = false;
    }
})

setInterval(() => {
    listdiv.classList.remove("list-anim");
    const timeout = setTimeout(() => {
        listdiv.classList.add("list-anim");
    }, 1000)
}, 10000)



