import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { userId: Number }
  static targets = ["notif"]
  connect() {
    console.log("hhahahahahahahah")

    this.channel = createConsumer().subscriptions.create(
      { channel: "NotificationChannel", id: this.userIdValue},
      { received: data => {
        this.notifTarget.classList.remove("d-none")
        this.notifTarget.innerHTML = ""
        this.notifTarget.innerHTML = data}}
    )

    console.log(this.channel)
    this.display()
  }

  display() {

    if (this.notifTarget.innerHTML === "0") {
      this.notifTarget.classList.add("d-none")
    }
  }
}
