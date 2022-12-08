import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="notes"
export default class extends Controller {
  static targets = [ "card", "button", "error", "form", "annuler", "display" ]
  connect() {
    // let button = this.buttonTarget
    this.display_form()

  }

  addNotes() {
    this.displayTarget.classList.remove("d-none")
    this.buttonTarget.classList.add("d-none");
  }

  annuler() {
    this.displayTarget.classList.add("d-none");
  }


  send(event) {
    event.preventDefault()
    const url = this.formTarget.action
    fetch(url, {
      method: "POST",
      headers: { "Accept": "text/plain" },
      body: new FormData(this.formTarget)
    })
      .then(response => response.text())
      .then((data) => {

        document.getElementById('notes').insertAdjacentHTML('beforeend', data)
        console.log(data)
        // this.display_form()
      })



      this.formTarget.classList.add("d-none");
      this.displayTarget.classList.add("d-none");

      this.buttonTarget.classList.remove("d-none");


  }


  display_form() {
    let notes = this.cardTargets
    console.log(this.displayTarget)
    if (notes.length == 10) {
      this.buttonTarget.classList.add("d-none");
      this.errorTarget.classList.remove('d-none')
      this.displayTarget.classList.add("d-none")
    }
  }
}
