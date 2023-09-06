import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["step"];

  nextStep(event) {
    const step = event.target.dataset.step;
    this.stepTargets.forEach((target) => {
      target.classList.add("hidden");
    });
    this.stepTargets[step - 1].classList.remove("hidden");
  }
}
