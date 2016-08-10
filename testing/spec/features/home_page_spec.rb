require "rails_helper"

describe "the home page", :type => :feature do
  it "has Hello World" do
    visit '/'
    expect(page).to have_content 'Hello World!'
  end

  it "has bar" do
    visit '/'
    expect(page).to have_content 'bar'
  end

  it "has foo when js enabled", js: true do
    visit '/'
    expect(page).to have_content 'foo'
  end
end
