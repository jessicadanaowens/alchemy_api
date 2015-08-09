require "rails_helper"

describe "home" do
  it "shows hello" do

  visit '/'

  expect(page).to have_content "Alchemy API Analyzer"
  end

end