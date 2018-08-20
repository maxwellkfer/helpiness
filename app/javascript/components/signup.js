import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["Exchange a service for helpies,", "exchange your helpies for a service!"],
    typeSpeed: 80,
    loop: true
  });
}

export { loadDynamicBannerText };
