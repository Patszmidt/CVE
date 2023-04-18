import { Controller } from "@hotwired/stimulus"
import {get} from "@rails/request.js"

export default class extends Controller {
  static targets = ["box"];

  connect() {
    console.log("Hover controller connected");
  }

  hover(event) {

    var box = document.getElementById("box");
    box.style.display = "block";
    box.style.left = event.pageX + "px";
    box.style.top = event.pageY + "px";
    
    let id = event.currentTarget.getAttribute('id').split("_")[1]
  	console.log(id)
  	get(`/commandes/${id}/details`,{
  		responseKind: "turbo-stream"
  		})
  }

  hide() {
    console.log("Click")
    this.boxTarget.style.display = "none";
  }
}
