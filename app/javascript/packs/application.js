// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "bootstrap"
import anime from 'animejs/lib/anime.es.js';


Rails.start()
Turbolinks.start()
ActiveStorage.start()

function bounce() {
  const bounceUp = anime({
    autoplay: false, // We don't want to immediately start the animation
    targets: ['.orange', '.white'], // target the <ball></ball>
    translateY: {
      value: ['0px', '-40px'], // When bouncing up, start at 160px and end at 0px
      duration: 575,
      easing: 'easeOutQuad',
    },
    complete: bounce,
  });

  const bounceDown = anime({
    autoplay: false, // See similar comments above
    targets: ['.orange', '.white'],
    translateY: {
      value: ['-40px', '0px'], // When bouncing down, start at 0px and end at 160px
      duration: 575,
      easing: 'easeInQuad',
    },
    complete() {
      bounceUp.play(); // After we bounce down, start the bounce up animation
    },
  });

  bounceDown.play();
}

bounce(); // Start the animation!
