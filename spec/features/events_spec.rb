require 'rails_helper'

feature 'CRUDing events' do


### CREATE
  scenario 'User can create an event' do  #scenario, create, description is ( SET UP)
    visit root_path          #visit, click_on, fill_in are things the USER would be doing that test simulates (DO THE THING)
    click_on "New Event"
    fill_in "Description", with: "My awesome event"
    click_on "Create Event"

    expect(page).to have_content("My awesome event")    #expectation on how the SITE will react (EXPECT)

  end


    # scenario 'User edits a kitten' do
    #   Kitten.create!(
    #     name: "Santacon",
    #     breed: "blah"
    #   )
    #
    #   visit root_path
    #   click_on "edit"
    #   fill_in :location, with: "Union Square"
    #   click_on "Update Event"
    #
    #   expect(page).to have_content("Union Square")
    # end
    #


    #UPDATE

    feature "Events" do
      scenario "User edits an event" do
        Event.create!(
        description: "My aweeesome event"
        )

        visit root_path
        expect(page).to have_content("My aweeesome event")
        click_on "edit"
        fill_in "Description", with: "My awesome event"
        click_on "Update Event"

        expect(page).to have_content("My awesome event")
        expect(page).to have_no_content("My aweeesome event")
      end

    end
  # scenario 'User edits an event' do
  #   Event.create!(
  #   description: "Santacon",
  #   )
  #
  #   visit root_path
  #   click_on "edit"
  #   fill_in :location, with: "Union Square"
  #   click_on "Update Event"
  #
  #   expect(page).to have_content("Union Square")
  # end

  #READ/SHOW
 scenario 'listing events' do
   Event.create!(
   description: "free lunch today",
   )

   Event.create!(
   description: "Hug Momo Hour",
   )

   Event.create!(
   description: "Ramen festival",
   )

   visit root_path
   expect(page).to have_content("Hug Momo Hour")
   expect(page).to have_content("free lunch today")
   expect(page).to have_content("Ramen festival")
 end

 # DELETE
 scenario 'deleting events' do
   Event.create!(
   description: "I'm going to be deleted"
   )

   visit root_path
   click_on "delete"
   expect(page).to have_no_content("I'm going to be deleted")
   expect(page.current_path).to eq(events_path)
 end

end
