import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';
import { initMapBox } from '../plugins/init_mapbox';
import { initUpdateNavbarOnScroll } from '../navbar';
import { scrollToAnchor } from "../scroll-to-anchor";
import { collapse } from "../itineraries-show";
import { dynamicText } from "../dynamic-text";
import { progressBar } from "../progress-bar";
import { backButton } from "../back-button";
import { toggleCards } from "../city-card-toggle";

// scrollTo();

// let currentPage = window.location.href.split(/.*[\/]/)[1] || null;
let currentPage = window.location.pathname.split("/")[1] || null;
let currentAction = window.location.pathname.split("/")[2] || null;
console.log('currentAction ', currentAction);

if (currentPage === "pages" && currentAction === "print") {
  document.querySelector('.navbar').classList.add('bg-light');
}

if (currentPage === "itineraries") {
  // if (currentAction === "new" || currentAction.match(/\d+/) !== null) {
  if (currentAction === "new") initUpdateNavbarOnScroll(128);
  const bookmarks = document.querySelectorAll('.bookmark');
  console.log(bookmarks);
  bookmarks.forEach(bookmark => {
    console.log(bookmark.dataset);
    if (bookmark.dataset.bookmark === "true") {
      document.querySelector(`#bookmark-show-false-${bookmark.dataset.itinerary}`).style.display = "none";
    } else {
      document.querySelector(`#bookmark-show-true-${bookmark.dataset.itinerary}`).style.display = "none";
    }
  });
  // }
}

const elementsMaxHeight = elements => {
  let max = 0;
  elements.forEach((element, index) => {
    // console.log(element.offsetHeight);
    if (element.offsetHeight > max) max = element.offsetHeight;
  });
  return max;
};

if (currentPage === "users") {
  document.querySelector('.navbar').classList.add('bg-light');
}

if (currentPage === "cities") {
  initUpdateNavbarOnScroll(128);
  const texts = document.querySelectorAll(".text");
  const textMaxHeight = elementsMaxHeight(texts);
  console.log(textMaxHeight);
  texts.forEach(text => {
    text.style.height = `${textMaxHeight}px`;
  });

  const fabbuttons = document.querySelectorAll(".fabbutton");
  fabbuttons.forEach((fabbutton, index) => {
    console.log('fabbutton index', index);
    if (currentAction === "1") console.log('cuzco');
    if (currentAction === "1") {
      if(index === 0 || index === 4 || index === 8) {
        fabbutton.classList.add('active');
        fabbutton.parentElement.parentElement.classList.toggle("active");
      }
    }
    if (currentAction === "5") console.log('puno');
    if (currentAction === "5") {
      if(index === 1 || index === 6 || index === 8) {
        fabbutton.classList.add('active');
        fabbutton.parentElement.parentElement.classList.toggle("active");
      }
    }
  });
}

if (currentPage === "itineraries" && currentAction.match(/\d+/) !== null) {
  initUpdateNavbarOnScroll(128);
  initMapBox();
  collapse();
  // console.log('map', (window.innerHeight - 76))
  // document.querySelector("#map").style.height = `${(window.innerHeight - 96)}px`;
}

if (currentPage === null || currentPage === '#experience' || currentPage === '#country' || currentPage === '#budget' || currentPage === '#days' || currentPage === '#page-content') {
  initUpdateNavbarOnScroll(window.innerHeight);
  scrollToAnchor();
  dynamicText();
  progressBar();
  //backButton();

  const countryNextBtn = document.querySelectorAll("a.country-next").forEach((el) => {
    el.addEventListener("click", (event) => {
      console.log("country-next clicked");
      document.querySelector("#experience").classList.add("d-none");
      document.querySelector("#homepage-onboarding").classList.remove("d-none");
      document.querySelectorAll(".homepage").forEach((element) => {
        element.classList.add("d-none");
      });
      document.querySelector("#country").classList.remove("d-none");
      countryLoad();
    });
  });

  const countryLoad = () => {
    document.querySelector("#progress-point2").classList.add("pp2");
    const progressPoint2 = document.querySelector("#progress-point2");
    progressPoint2.click();
  }

}


window.addEventListener("hashchange", () => {

  const formPage = window.location.href.match("page-content");

  if (formPage != null && formPage[0] === "page-content") {

    backButton();
    const navbar = document.querySelector('.navbar');
    navbar.classList.remove('navbar-traseu-yellow');

    const budgetNextBtn = document.querySelectorAll(".budget-next");
    budgetNextBtn.forEach((button) => {
      button.addEventListener("click", (event) => {
      console.log("budget-next clicked");
      document.querySelector("#country").classList.add("d-none");
      document.querySelector("#homepage-onboarding").classList.remove("d-none");
      document.querySelector("#budget").classList.remove("d-none");
      budgetLoad();
      });
    });

    const daysNextBtn = document.querySelector("#days-next");
    daysNextBtn.addEventListener("click", (event) => {
      console.log("days-next clicked");
      document.querySelector("#budget").classList.add("d-none");
      document.querySelector("#homepage-onboarding").classList.remove("d-none");
      document.querySelector("#days").classList.remove("d-none");
      daysLoad();
    });
  }
  const budgetLoad = () => {
    document.querySelector("#progress-point3").classList.add("pp3");
    const progressPoint3 = document.querySelector("#progress-point3");
    progressPoint3.click();
  }

  const daysLoad = () => {
    const progressPoint4 = document.querySelector("#progress-point4");
    progressPoint4.click();
  }
});

window.addEventListener("scroll", () => {
  const formPage = window.location.href.match("page-content");

  if (formPage != null && formPage[0] === "page-content") {
    const navbar = document.querySelector('.navbar');
    navbar.classList.remove('navbar-traseu-yellow');
  }
});

if (currentPage == "cities") {
  toggleCards();
}

