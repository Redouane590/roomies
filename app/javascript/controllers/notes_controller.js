import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="notes"
export default class extends Controller {
  static targets = [ "card", "button", "error", "form", "annuler" ]
  connect() {
    // let button = this.buttonTarget
    let notes = this.cardTargets
    console.log("coucou", this.buttonTarget)
    if (notes.length == 10) {
      this.buttonTarget.classList.add("d-none");
      this.errorTarget.classList.remove('d-none')
    }

  }

  addNotes() {
    this.formTarget.classList.remove("d-none")
    this.buttonTarget.classList.add("d-none");
  }

  annuler() {
    this.formTarget.classList.add("d-none");
  }


  send(event) {
    event.preventDefault()

    fetch(this.formTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data)
      })
  }
}
