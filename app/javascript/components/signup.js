import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["Come get it,", "we got it !"],
    typeSpeed: 80,
    loop: true
  });
}

export { loadDynamicBannerText };
