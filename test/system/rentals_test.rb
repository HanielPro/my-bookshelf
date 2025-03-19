require "application_system_test_case"

class RentalsTest < ApplicationSystemTestCase
  setup do
    @rental = rentals(:one)
  end

  test "visiting the index" do
    visit rentals_url
    assert_selector "h1", text: "Rentals"
  end

  test "should create rental" do
    visit rentals_url
    click_on "New rental"

    fill_in "Rental date", with: @rental.rental_date
    fill_in "Return date", with: @rental.return_date
    fill_in "Schedules return date", with: @rental.return_estimate_date
    click_on "Create Rental"

    assert_text "Rental foi criado com sucesso"
    click_on "Back"
  end

  test "should update Rental" do
    visit rental_url(@rental)
    click_on "Edit this rental", match: :first

    fill_in "Rental date", with: @rental.rental_date
    fill_in "Return date", with: @rental.return_date
    fill_in "Schedules return date", with: @rental.return_estimate_date
    click_on "Update Rental"

    assert_text "Rental was successfully updated"
    click_on "Back"
  end

  test "should destroy Rental" do
    visit rental_url(@rental)
    click_on "Destroy this rental", match: :first

    assert_text "Rental was successfully destroyed"
  end
end
