const initUpdateNavbarOnScroll = (elementHeight) => {
  const navbar = document.querySelector('.navbar');
  console.log('navbar', navbar);
  if (navbar !== undefined) {
  // navbar.style.background = "none";
  navbar.classList.remove('bg-light');
  navbar.classList.add('navbar-traseu-yellow');
    window.addEventListener('scroll', () => {
      if (window.scrollY >= elementHeight) {
        // console.log(navbar.className);
        navbar.classList.add('bg-light');
        navbar.classList.remove('navbar-traseu-yellow');
      } else {
        navbar.classList.remove('bg-light');
        navbar.classList.add('navbar-traseu-yellow');
        // console.log(navbar.className);
      }
    });
  }
};

export { initUpdateNavbarOnScroll };
