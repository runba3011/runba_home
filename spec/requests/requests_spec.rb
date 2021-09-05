require 'rails_helper'

RSpec.describe "Requests", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/requests/index"
      expect(response).to have_http_status(:success)
    end
  end

end
