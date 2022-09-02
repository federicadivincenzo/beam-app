import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "eye"]

  view(e) {
    e.preventDefault();
    if (this.inputTarget.getAttribute('type') == 'text') {
      this.inputTarget.setAttribute('type', 'password');
      this.eyeTarget.classList.add('fa-eye-slash');
      this.eyeTarget.classList.remove('fa-eye');
    } else if  (this.inputTarget.getAttribute('type') == 'password') {
      this.inputTarget.setAttribute('type', 'text');
      this.eyeTarget.classList.remove('fa-eye-slash');
      this.eyeTarget.classList.add('fa-eye');
    }
  }


}
