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
import ScrollReveal from 'scrollreveal'

Rails.start()
Turbolinks.start()
ActiveStorage.start()

var animateScaling = anime({
  targets: '.scale-animation',
  scale: [14,1],
  opacity: [0,1],
  easing: "easeOutCirc",
  duration: 800,
  autoplay: true
});


var animateScalingLogo = anime({
  targets: '#logo-white',
  scale: [14,1],
  opacity: [0,1],
  easing: "easeOutCirc",
  duration: 800,
  autoplay: true
});

var animateScalingImage = anime({
  targets: '.card-value-img',
  translateY: [100,0],
  translateZ: 0,
  opacity: [0,1],
  easing: "easeOutExpo",
  duration: 3000,
  delay: (el, i) => 300 + 30 * i
});

ScrollReveal().reveal('.card-animate', { delay: 500 });
