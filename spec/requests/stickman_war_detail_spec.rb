require 'rails_helper'

RSpec.describe "StickmanWarDetails", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/stickman_war_detail/show"
      expect(response).to have_http_status(:success)
    end
  end

end
