const dogs = {
  "Corgi": "https://www.akc.org/dog-breeds/cardigan-welsh-corgi/",
  "Australian Shepherd": "https://www.akc.org/dog-breeds/australian-shepherd/",
  "Affenpinscher": "https://www.akc.org/dog-breeds/affenpinscher/",
  "American Staffordshire Terrier": "https://www.akc.org/dog-breeds/american-staffordshire-terrier/",
  "Tosa": "https://www.akc.org/dog-breeds/tosa/",
  "Labrador Retriever": "https://www.akc.org/dog-breeds/labrador-retriever/",
  "French Bulldog": "https://www.akc.org/dog-breeds/french-bulldog/" 
};

function dogLinkCreator(dogs) {
  let dogName = Object.keys(dogs);
  let dogValues = Object.values(dogs);
  let dogLinks = [];

  dogName.forEach( (dog, idx) => {
    let aTag = document.createElement("a");
    aTag.innerHTML = dog;
    aTag.href = dogValues[idx];
    let liTag = document.createElement("li");
    liTag.classList.add('dog-link');
    liTag.appendChild(aTag);
    dogLinks.push(liTag);
  })

  return dogLinks;
};

function attachDogLinks() {
  let dogLinks = dogLinkCreator(dogs);

  dogLinks.forEach( dogLi => {
    const ul = document.querySelector(".drop-down-dog-list");
    ul.appendChild(dogLi);
  })
}

attachDogLinks();

function handleEnter() {
  const dogLinks = document.querySelectorAll(".dog-link")
  for (let i = 0; i < dogLinks.length; i++) {
    let dogs = dogLinks[i];
    dogs.classList.add('show');
  }
}

function handleLeave() {
  const dogLinks = document.querySelectorAll(".dog-link");
  dogLinks.forEach( dogs => {
    dogs.classList.remove('show');
  })
  
}

const dropDown = document.querySelector(".drop-down-dog-nav"); 
//consider selecting ul class instead

dropDown.addEventListener("mouseenter", handleEnter);
dropDown.addEventListener("mouseleave", handleLeave);
