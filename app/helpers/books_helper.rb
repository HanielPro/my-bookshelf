module BooksHelper
  def genre_checkboxes(form, book)
    form.fields_for :genres, book.genres do |genre_form|
      content_tag(:div, class: "author-checkbox") do
        genre_form.check_box(:id, multiple: true, checked: book.genres.include?(genre_form.object)) +
        genre_form.label(:name, genre_form.object.name)
      end
    end
  end
end
