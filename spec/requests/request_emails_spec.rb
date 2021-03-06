 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/request_emails", type: :request do
  
  # RequestEmail. As you add validations to RequestEmail, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      RequestEmail.create! valid_attributes
      get request_emails_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      request_email = RequestEmail.create! valid_attributes
      get request_email_url(request_email)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_request_email_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      request_email = RequestEmail.create! valid_attributes
      get edit_request_email_url(request_email)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new RequestEmail" do
        expect {
          post request_emails_url, params: { request_email: valid_attributes }
        }.to change(RequestEmail, :count).by(1)
      end

      it "redirects to the created request_email" do
        post request_emails_url, params: { request_email: valid_attributes }
        expect(response).to redirect_to(request_email_url(RequestEmail.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new RequestEmail" do
        expect {
          post request_emails_url, params: { request_email: invalid_attributes }
        }.to change(RequestEmail, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post request_emails_url, params: { request_email: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested request_email" do
        request_email = RequestEmail.create! valid_attributes
        patch request_email_url(request_email), params: { request_email: new_attributes }
        request_email.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the request_email" do
        request_email = RequestEmail.create! valid_attributes
        patch request_email_url(request_email), params: { request_email: new_attributes }
        request_email.reload
        expect(response).to redirect_to(request_email_url(request_email))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        request_email = RequestEmail.create! valid_attributes
        patch request_email_url(request_email), params: { request_email: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested request_email" do
      request_email = RequestEmail.create! valid_attributes
      expect {
        delete request_email_url(request_email)
      }.to change(RequestEmail, :count).by(-1)
    end

    it "redirects to the request_emails list" do
      request_email = RequestEmail.create! valid_attributes
      delete request_email_url(request_email)
      expect(response).to redirect_to(request_emails_url)
    end
  end
end
