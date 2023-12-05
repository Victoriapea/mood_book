import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["togglableElement", "togglableRating"]
  connect() {
  }

  fire() {
    this.togglableElementTarget.classList.toggle("d-none");
  }
}
