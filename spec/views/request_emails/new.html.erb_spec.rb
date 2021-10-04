require 'rails_helper'

RSpec.describe "request_emails/new", type: :view do
  before(:each) do
    assign(:request_email, RequestEmail.new(
      name: "MyString",
      email: "MyString"
    ))
  end

  it "renders new request_email form" do
    render

    assert_select "form[action=?][method=?]", request_emails_path, "post" do

      assert_select "input[name=?]", "request_email[name]"

      assert_select "input[name=?]", "request_email[email]"
    end
  end
end
