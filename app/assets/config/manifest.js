//= link_tree ../images
//= link_directory ../stylesheets .css
//= link application.js
//= link bootstrap.js
//= link @popperjs--core.js

class mobileNavBar{
    constructor(mobileMenu, navList, navLinks){
        this.mobileMenu = document.querySelector(mobileMenu);
        this.navList = document.querySelector(navList);
        this.navLinks = document.querySelectorAll(navLinks);
        this.activeClass = "active";

        this.handleClick = this.handleCLick.bind(this);
    }
    animeteLinks(){
        this.navLinks.forEach((link, index)=>{
            console.log(index / 7 + 0.3);
            link.style.animation
            ? (link.styke.animation = "")
            : (link.style.animations = `navLinkFade 0.5s ease forwards 0.3s`);
        });
    }
    handleClick(){
        this.navList.CLassList.toogle(this.activeClass);
        this.mobileMenu.classList.toogle(this.activeClass);
        this.animateLinks();
    }
    addClickEvent(){
        this.mobileMenu.addEventListener("click", rhis.handleClick);
    }
    init(){
        if(this.mobileMenu){
            this.addCLicjEvent();
        }
        return this;
    }
}
function initNavbar() {
const mobileNavbar = new mobileNavbar(
    ".mobile-menu",
    ".nav-list",
    ".nav-list li"
)
mobileNavbar.init();
}//= link_tree ../../javascript .js
//= link_tree ../../../vendor/javascript .js
