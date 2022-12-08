import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { chatroomId: Number }
  static targets = ["messages"]





// Écouter l'événement de réception d'un nouveau message

  connect() {

    console.log(`Subscribe to the chatroom with the id ${this.chatroomIdValue}.`)

    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: data => this.#insertMessageAndScrollDown(data)}
    )
    console.log(`Subscribed to the chatroom with the id ${this.chatroomIdValue}.`)
  }


  #insertMessageAndScrollDown(data) {
    let audio = new Audio('notification.mp3');
    console.log("insert")
    this.messagesTarget.insertAdjacentHTML("beforeend", data)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
    audio.play();
  }

  resetForm(event) {
    event.target.reset()
    console.log("reset")
  }

  disconnect() {
    console.log("Unsubscribed from the chatroom")
    this.channel.unsubscribe()
  }
}
