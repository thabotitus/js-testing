require "rails_helper"

RSpec.describe HomeController, :type => :controller do
  render_views

  describe "GET index" do
    it "has Hello world heading" do
      get :index
      expect(response.body).to include "Hello World!"
    end
  end
end
