import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["box"];

  connect() {
    console.log("Hover controller connected");
  }

  async hover() {
    const id = this.element.dataset.id;
    const response = await fetch(`/commandes/${id}.json`);
    const data = await response.json();
    this.boxTarget.innerHTML = `
      <p>Numero de commande: ${data.numero_de_commande}</p>
    `;
    this.boxTarget.style.display = "block";
  }

  unhover() {
    this.boxTarget.style.display = "none";
  }
}
