import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "hiddenInput"]

  calculateAverage() {
    const checkedInputs = this.inputTargets.filter((input) => input.checked)
    const values = checkedInputs.map((input) => parseInt (input.value))
    const sum = values.reduce((a,b) => {
      return a+b
    }, 0)
    console.log(sum/values.length)
    this.hiddenInputTarget.value = sum/values.length
  }
}
