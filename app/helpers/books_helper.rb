module BooksHelper
  def author_checkboxes(form, book)
    form.fields_for :authors, book.authors do |author_form|
      content_tag(:div, class: "author-checkbox") do
        author_form.check_box(:id, multiple: true, checked: book.authors.include?(author_form.object)) +
        author_form.label(:name, author_form.object.name)
      end
    end
  end

  def genre_checkboxes(form, book)
    form.fields_for :genres, book.genres do |genre_form|
      content_tag(:div, class: "author-checkbox") do
        genre_form.check_box(:id, multiple: true, checked: book.genres.include?(genre_form.object)) +
        genre_form.label(:name, genre_form.object.name)
      end
    end
  end
end
