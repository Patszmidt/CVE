import { Controller } from "@hotwired/stimulus"
import {get} from "@rails/request.js"

// Connects to data-controller="select"
export default class extends Controller {

	static targets = ["ressource"]
	
  change(event) {
  	let matiere = event.target.selectedOptions[0].value
  	let target = this.ressourceTarget.id
  	
  	get(`/utilisations/ressources?target=${target}&matiere=${matiere}`,{
  		responseKind: "turbo-stream"
  		})
  	
  }
  
}
