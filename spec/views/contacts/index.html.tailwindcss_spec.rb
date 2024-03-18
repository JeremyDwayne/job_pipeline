# frozen_string_literal: true

require "rails_helper"

RSpec.describe("contacts/index", type: :view) do
  before do
    assign(:contacts, [
      Contact.create!(
        name: "Name",
        email: "Email",
        role: "Role",
        notes: "Notes",
        tenure: 2,
        company: nil,
      ),
      Contact.create!(
        name: "Name",
        email: "Email",
        role: "Role",
        notes: "Notes",
        tenure: 2,
        company: nil,
      ),
    ])
  end

  it "renders a list of contacts" do
    render
    cell_selector = Rails::VERSION::STRING >= "7" ? "div>p" : "tr>td"
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Email".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Role".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Notes".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
