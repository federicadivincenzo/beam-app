import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["count", "grid"]

  connect() {
    console.log(this.gridTarget);
    let counter = this.countTarget.textContent;
    if (counter == 1) {
      this.gridTarget.classList.remove('card-grid_column');
      this.gridTarget.classList.add('card_column');
    }

  }
}
