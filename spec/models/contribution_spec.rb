require 'rails_helper'

describe Contribution do
  [:image_url, :username, :content].each do |attr|
    it {should validate_presence_of(attr)}
  end

  it { should belong_to :story}
end
