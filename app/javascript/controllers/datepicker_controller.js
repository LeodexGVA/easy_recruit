import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()

export default class extends Controller {
  connect() {
    const datePickerElement = document.getElementsByClassName("datepicker-input"); // Remplacez "datepicker-input" par le bon ID de votre champ de date
    if (datePickerElement) {
      flatpickr(datePickerElement, {
        dateFormat: "Y-m-d", // Format pour afficher la date au format YYYY-MM-DD
      });
    }

    const timePickerElement = document.getElementsByClassName("timepicker-input"); // Remplacez "timepicker-input" par le bon ID de votre champ d'heure
    if (timePickerElement) {
      flatpickr(timePickerElement, {
        enableTime: true, // Activez la sélection de l'heure
        noCalendar: true, // Désactivez le calendrier
        dateFormat: "H:i", // Format pour afficher l'heure au format HH:MM
      });
    }
  }
}
