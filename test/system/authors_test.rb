require "application_system_test_case"

class AuthorsTest < ApplicationSystemTestCase
  setup do
    @author = authors(:one)
  end

  test "visiting the index" do
    visit authors_url
    assert_selector "h1", text: "Authors"
  end

  test "should create author" do
    visit authors_url
    click_on "New author"

    fill_in "date_of_birth", with: @author.date_of_birth
    fill_in "Name", with: @author.name
    click_on "Create Author"

    assert_text "Author foi criado com sucesso"
    click_on "Back"
  end

  test "should update Author" do
    visit author_url(@author)
    click_on "Edit this author", match: :first

    fill_in "date_of_birth", with: @author.date_of_birth
    fill_in "Name", with: @author.name
    click_on "Update Author"

    assert_text "Author was successfully updated"
    click_on "Back"
  end

  test "should destroy Author" do
    visit author_url(@author)
    click_on "Destroy this author", match: :first

    assert_text "Author was successfully destroyed"
  end
end
