require 'rails_helper'

describe 'the add a contribution process' do
  it "adds a new contribution to a story" do
    visit stories_path
    click_link "New Story"
    fill_in 'Title', :with => "See Spot Run"
    fill_in 'Genre', :with => "Children's Action"
    click_on "Create Story"
    click_link 'See Spot Run'
    click_link "Contribute to Story"
    fill_in "Content", :with => "Run Spot Run"
    fill_in "Image url", :with => "www.example.com/example.png"
    fill_in "Username", :with => "Bob"
    click_on "Create Contribution"
    expect(page).to have_content "Run Spot Run"
  end

  it "gives an error when no Content is entered" do
    visit stories_path
    click_link "New Story"
    fill_in 'Title', :with => "See Spot Run"
    fill_in 'Genre', :with => "Children's Action"
    click_on "Create Story"
    click_link 'See Spot Run'
    click_link "Contribute to Story"
    fill_in "Content", :with => ""
    fill_in "Image url", :with => "www.example.com/example.png"
    fill_in "Username", :with => "Bob"
    click_on "Create Contribution"
    expect(page).to have_content "errors"
  end

end
