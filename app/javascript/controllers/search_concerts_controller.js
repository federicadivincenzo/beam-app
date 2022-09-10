import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "input", "list"]

  connect() {
    let test = this.inputTarget;
    test.value = ''
  }

}
