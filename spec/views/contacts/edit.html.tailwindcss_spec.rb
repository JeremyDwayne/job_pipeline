# frozen_string_literal: true

require "rails_helper"

RSpec.describe("contacts/edit", type: :view) do
  let(:contact) do
    Contact.create!(
      name: "MyString",
      email: "MyString",
      role: "MyString",
      notes: "MyString",
      tenure: 1,
      company: nil,
    )
  end

  before do
    assign(:contact, contact)
  end

  it "renders the edit contact form" do
    render

    assert_select "form[action=?][method=?]", contact_path(contact), "post" do
      assert_select "input[name=?]", "contact[name]"

      assert_select "input[name=?]", "contact[email]"

      assert_select "input[name=?]", "contact[role]"

      assert_select "input[name=?]", "contact[notes]"

      assert_select "input[name=?]", "contact[tenure]"

      assert_select "input[name=?]", "contact[company_id]"
    end
  end
end
