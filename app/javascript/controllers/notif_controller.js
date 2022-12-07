import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { userId: Number }
  static targets = ["notif"]
  connect() {

    console.log("notif controller js")

    this.channel = createConsumer().subscriptions.create(
      { channel: "NotificationChannel", id: this.userIdValue},
      { received: data => {
        this.notifTarget.innerHTML = ""
        this.notifTarget.innerHTML = data}}
    )

    console.log(this.channel)

  }
}
