import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["a service for Helpies", "Helpies for a service."],
    typeSpeed: 80,
    loop: true
  });
}

export { loadDynamicBannerText };
