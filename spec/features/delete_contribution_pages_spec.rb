require 'rails_helper'

describe "the destroy a contribution process" do
  it "destroys a contribution" do
    story = Story.create(:title => "See Spot Run", :genre => "Children's Action")
    contribution = story.contributions.create(:content => "Run Spot Run", :image_url => "www.example.com/example.png", :username => "Bob")
    visit story_contribution_path(story, contribution)
    click_on 'Delete'
    expect(page).to have_content "See Spot Run"
  end
end
