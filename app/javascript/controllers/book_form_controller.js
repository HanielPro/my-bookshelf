import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["existingAuthors", "newAuthors", "authorFields"]

  connect() {
    this.toggleAuthorFields(); // Inicializa com a seleção padrão
  }

  toggleAuthorFields() {
    const selectedOption = document.querySelector('input[name="author_option"]:checked').value;

    if (selectedOption === 'existing') {
      this.existingAuthorsTarget.style.display = 'block';
      this.newAuthorsTarget.style.display = 'none';
    } else {
      this.existingAuthorsTarget.style.display = 'none';
      this.newAuthorsTarget.style.display = 'block';
    }
  }

  addAuthor() {
    let association = this.authorFieldsTarget.dataset.association || 'authors';
    let new_id = new Date().getTime();  // Use a timestamp for a unique ID
    let regexp = new RegExp("new_" + association, "g");
    let content = this.authorFieldsTarget.dataset.associationInsertContent.replace(regexp, new_id);

    this.authorFieldsTarget.insertAdjacentHTML('beforeend', content);
  }
}