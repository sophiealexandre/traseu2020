const collapse = () => {

  const cities = document.querySelectorAll(".itinerary-show-city");
  citiesElements(cities);

  const citiesSelectNone = document.querySelectorAll(".city-select-none");
  citiesSelectNoneElements(citiesSelectNone);

}

const citiesElements = (elements) => {
  elements.forEach((element) => {
    // console.log(element.dataset);
    const customSwitch = document.querySelector(`#switch-${element.dataset.city}`);
    customSwitch.checked = true;

    const city = document.querySelector(`#city-id-${element.dataset.city}`);

    const deleteAnchor = document.querySelector(`#city-delete-id-${element.dataset.city}`);
    const createAnchor = document.querySelector(`#city-create-id-${element.dataset.city}`);
    // console.log(createAnchor);
    const details = document.querySelector(`#city-id-${element.dataset.city}-details`);
    details.style.display = "block";
    // console.log(details);

    customSwitch.addEventListener("change", (event) => {
      const isChecked = event.target.checked;
      console.log(isChecked);

      if (isChecked) {
        createAnchor.click();
        details.style.display = "block";
      } else {
        deleteAnchor.click();
        details.style.display = "block";
      }
    });
  });
}

const citiesSelectNoneElements = (elements) => {
  elements.forEach((element) => {
    console.log(element.dataset);
    const customSwitch = document.querySelector(`#switch-${element.dataset.city}`);
    // customSwitch.checked = false;

    const city = document.querySelector(`#city-id-${element.dataset.city}`);

    const deleteAnchor = document.querySelector(`#city-delete-id-${element.dataset.city}`);
    const createAnchor = document.querySelector(`#city-create-id-${element.dataset.city}`);
    // console.log(createAnchor);
    const details = document.querySelector(`#city-id-${element.dataset.city}-details`);
    details.style.display = "block";
    // console.log(details);

    customSwitch.addEventListener("change", (event) => {
      const isChecked = event.target.checked;
      console.log(isChecked);

      if (isChecked) {
        createAnchor.click();
        details.style.display = "block";
      } else {
        deleteAnchor.click();
        details.style.display = "block";
      }
    });
  });
}

export { collapse };
