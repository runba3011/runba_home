require 'rails_helper'

RSpec.describe "StickmanWarStages", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/stickman_war_stage/show"
      expect(response).to have_http_status(:success)
    end
  end

end
