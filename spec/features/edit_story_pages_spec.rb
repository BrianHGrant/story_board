require 'rails_helper'

describe "the edit a story process" do
  it "edits a story" do
    story = Story.create(:title => 'See Spot Run', :genre => "Children's Action")
    visit story_path(story)
    click_on 'Edit'
    fill_in 'Title', :with => 'Run Spot Run'
    fill_in 'Genre', :with => "Children's Action"
    click_on 'Update Story'
    expect(page).to have_content 'Run Spot Run'
  end

  it "gives error when no title is entered" do
    story = Story.create(:title => 'See Spot Run', :genre => "Children's Action")
    visit story_path(story)
    click_on 'Edit'
    fill_in 'Title', :with => ''
    click_button 'Update Story'
    expect(page).to have_content 'errors'
  end
end
