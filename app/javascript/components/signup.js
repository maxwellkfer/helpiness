import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["Exchange a service for Helpies", "Spend your Helpies on a service."],
    typeSpeed: 60,
    loop: true
  });
}

export { loadDynamicBannerText };
