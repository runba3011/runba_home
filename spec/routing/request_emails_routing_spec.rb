require "rails_helper"

RSpec.describe RequestEmailsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/request_emails").to route_to("request_emails#index")
    end

    it "routes to #new" do
      expect(get: "/request_emails/new").to route_to("request_emails#new")
    end

    it "routes to #show" do
      expect(get: "/request_emails/1").to route_to("request_emails#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/request_emails/1/edit").to route_to("request_emails#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/request_emails").to route_to("request_emails#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/request_emails/1").to route_to("request_emails#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/request_emails/1").to route_to("request_emails#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/request_emails/1").to route_to("request_emails#destroy", id: "1")
    end
  end
end
