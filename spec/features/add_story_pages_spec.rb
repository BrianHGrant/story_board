require 'rails_helper'

describe 'the add a story process' do
  it "adds a new story" do
    visit stories_path
    click_link "New Story"
    expect(page).to have_content "New story"
    fill_in 'Title', :with => "See Spot Run"
    fill_in 'Genre', :with => "Children's Action"

    click_on "Create Story"
    expect(page).to have_content "Story list"
  end

  it "gives an error when no title or genre is entered" do
    visit new_story_path
    click_on "Create Story"
    expect(page).to have_content 'errors'
  end
end
