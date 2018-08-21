import "bootstrap";
import { loadDynamicBannerText } from '../components/signup';

import '../components/select2';

if (document.getElementById("banner-typed-text")) {
  loadDynamicBannerText();
}
