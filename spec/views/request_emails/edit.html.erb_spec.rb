require 'rails_helper'

RSpec.describe "request_emails/edit", type: :view do
  before(:each) do
    @request_email = assign(:request_email, RequestEmail.create!(
      name: "MyString",
      email: "MyString"
    ))
  end

  it "renders the edit request_email form" do
    render

    assert_select "form[action=?][method=?]", request_email_path(@request_email), "post" do

      assert_select "input[name=?]", "request_email[name]"

      assert_select "input[name=?]", "request_email[email]"
    end
  end
end
