const toggleCards = () => {

  const buttons = document.querySelectorAll(".fabbutton");

  const toggleActiveClass = (event) => {
    event.currentTarget.classList.toggle("active");
    event.currentTarget.parentElement.parentElement.classList.toggle("active");
  };

  const bindCardToClick = (button) => {
    button.addEventListener('click', toggleActiveClass);
  };

  buttons.forEach(bindCardToClick);

};

export { toggleCards };
