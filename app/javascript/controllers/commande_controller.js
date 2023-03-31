import { Controller } from "@hotwired/stimulus"
import {get} from "@rails/request.js"

// Connects to data-controller="commande"
export default class extends Controller {

submit() {
  console.log("Button clicked!")
  // Perform desired action here
}


}
