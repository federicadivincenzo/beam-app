import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["infos", "form" ];

  displayForm() {
    this.formTarget.classList.toggle("d-none");
    console.log(this.formTarget);
    console.log('hey')
  }
}
