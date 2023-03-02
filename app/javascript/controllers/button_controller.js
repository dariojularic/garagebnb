import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="button"
export default class extends Controller {
  static targets = [ "button", "updatebutton" ]

  submit(event) {
    alert("Button clicked!")
    // event.preventDefault();
    console.log("Button clicked!")
    this.buttonTarget.disabled = true
    this.buttonTarget.value = "Garage created!"
    // event.target.form.submit();
  }

  update(event) {
    // alert("Update clicked!")
    console.log(event.submitter)
    console.log("Update clicked!")
    event.submitter.disabled = true
    event.submitter.value = "Garage updated!"
  }
}
