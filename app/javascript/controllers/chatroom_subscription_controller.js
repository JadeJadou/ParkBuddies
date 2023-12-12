import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { chatroomId: Number, currentUserId: Number  }
  static targets = ["messages"]

  connect() {
    console.log(this.chatroomIdValue)
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: data =>
        this.insertMessageAndScrollDown(data),
      }
    )
    setTimeout(() => {
    this.scrollMessagesToBottom();
  }, 100);
  }


  insertMessageAndScrollDown(data) {
    const currentUserIsSender = this.currentUserIdValue === data.sender_id
    const messageElement = this.#buildMessageElement(currentUserIsSender, data.message, data.avatar)
    this.messagesTarget.insertAdjacentHTML("beforeend", messageElement),
    this.scrollMessagesToBottom();
  }

  scrollMessagesToBottom() {
    this.messagesTarget.scrollTop = this.messagesTarget.scrollHeight;
  }

  resetForm(event) {
    event.target.reset()
  }

  #buildMessageElement(currentUserIsSender, message, avatar) {
    if (currentUserIsSender) {
    return `
    <div class="message-row">
      <div class="avatar-message">
            ${avatar}
      </div>
      <div class="message-content sender-style">
              ${message}
      </div>
    </div>
    `
  }
else {
  return `
  <div class="message-row">
    <div class="message-content receiver-style">
            ${message}
    </div>
    <div class="avatar-message">
          ${avatar}
    </div>
  </div>
  `
}}

  // #justifyClass(currentUserIsSender) {
  //   return currentUserIsSender ? "justify-content-end" : "justify-content-start"
  // }

  // #userStyleClass(currentUserIsSender) {
  //   return currentUserIsSender ? "sender-style" : "receiver-style"
  // }
}
