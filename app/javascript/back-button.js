const backButton = () => {

  const backButton = document.querySelector('.back-button')

  function backAnimation(){
    if (backButton.classList.contains('back')){
      backButton.classList.remove('back');
    }
    else{
      backButton.classList.add('back');
      setTimeout(backAnimation, 1000);
    }
  }
  backButton.addEventListener('click', backAnimation);

}

export { backButton };

