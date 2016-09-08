require 'rails_helper'

describe 'the edit a contribution process' do
  it "edits a contribution to a story" do
    story = Story.create(:title => "See Spot Run", :genre => "Children's Action")
    contribution = story.contributions.create(:content => "Run Spot Run", :image_url => "www.example.com/example.png", :username => "Bob")
    visit story_contribution_path(story, contribution)
    click_on "Edit"
    fill_in "Content", :with => "Spot is running"
    fill_in "Image url", :with => "www.example.com/example2.png"
    fill_in "Username", :with => "Robert"
    click_on "Update Contribution"
    expect(page).to have_content "Spot is running"
  end

  it "gives an error when Content is empty" do
    story = Story.create(:title => "See Spot Run", :genre => "Children's Action")
    contribution = story.contributions.create(:content => "Run Spot Run", :image_url => "www.example.com/example.png", :username => "Bob")
    visit story_contribution_path(story, contribution)
    click_on "Edit"
    fill_in "Content", :with => ""
    fill_in "Image url", :with => "www.example.com/example2.png"
    fill_in "Username", :with => "Robert"
    click_on "Update Contribution"
    expect(page).to have_content "errors"
  end

end
