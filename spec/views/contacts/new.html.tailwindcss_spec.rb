# frozen_string_literal: true

require "rails_helper"

RSpec.describe("contacts/new", type: :view) do
  before do
    assign(:contact, Contact.new(
      name: "MyString",
      email: "MyString",
      role: "MyString",
      notes: "MyString",
      tenure: 1,
      company: nil,
    ))
  end

  it "renders new contact form" do
    render

    assert_select "form[action=?][method=?]", contacts_path, "post" do
      assert_select "input[name=?]", "contact[name]"

      assert_select "input[name=?]", "contact[email]"

      assert_select "input[name=?]", "contact[role]"

      assert_select "input[name=?]", "contact[notes]"

      assert_select "input[name=?]", "contact[tenure]"

      assert_select "input[name=?]", "contact[company_id]"
    end
  end
end
