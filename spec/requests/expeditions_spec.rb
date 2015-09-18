require 'rails_helper'

RSpec.describe "Expeditions", type: :request do
  describe "GET /expeditions" do
    it "works! (now write some real specs)" do
      get expeditions_path
      expect(response).to have_http_status(200)
    end
  end
end
