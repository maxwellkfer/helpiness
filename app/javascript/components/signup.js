import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["Be helped for free", "Pay with Helpies !"],
    typeSpeed: 80,
    loop: true
  });
}

export { loadDynamicBannerText };
