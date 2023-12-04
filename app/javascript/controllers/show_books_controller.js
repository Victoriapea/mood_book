import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="show-books"
export default class extends Controller {
  static targets = ["list", "form", "input"]

  connect() {
    console.log(this.listTarget);
    console.log(this.formTarget);
    console.log(this.inputTarget);
    console.log("coucouu");
  }

  displayBooks() {
    console.log("displaying");

    // console.log(this.formTarget.query.value);
    // this.formTarget.query.value = this.inputTarget.value
    this.listTarget.classList.remove("d-none")


  }

}
// Poser un ecouteur sur le submit
// prevent default
// sur l'action togglle une class
