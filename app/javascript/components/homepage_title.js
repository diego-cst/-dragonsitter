import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["The company for...", "WOOOW LOOK AT THAT DRAGON !"],
    typeSpeed: 70,
    loop: true
  });
}

export { loadDynamicBannerText };
