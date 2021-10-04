require 'rails_helper'

RSpec.describe "request_emails/show", type: :view do
  before(:each) do
    @request_email = assign(:request_email, RequestEmail.create!(
      name: "Name",
      email: "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
  end
end
