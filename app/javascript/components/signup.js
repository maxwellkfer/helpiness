import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["Services for Helpies,", "Helpies for services !"],
    typeSpeed: 80,
    loop: true
  });
}

export { loadDynamicBannerText };
