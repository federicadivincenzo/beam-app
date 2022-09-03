import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["infos", "form-discover", "form-join" ];

  displayForm() {
    this.infosTarget.classList.toggle("d-none")
  }
}
