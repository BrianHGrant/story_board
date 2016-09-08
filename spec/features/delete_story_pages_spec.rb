require 'rails_helper'

describe "the destroy a story process" do
  it "destroys a story" do
    story = Story.create(:title => 'See Spot Run', :genre => "Children's Action")
    visit story_path(story)
    click_on 'Delete'
    expect(page).to have_content "Story list"
  end

end
