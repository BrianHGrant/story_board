require 'rails_helper'

describe Story do
  it {should validate_presence_of :title}
  it {should validate_presence_of :genre}
  it {should have_many :contributions}
end
