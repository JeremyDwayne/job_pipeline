# frozen_string_literal: true

require "rails_helper"

RSpec.describe("contacts/show", type: :view) do
  before do
    assign(:contact, Contact.create!(
      name: "Name",
      email: "Email",
      role: "Role",
      notes: "Notes",
      tenure: 2,
      company: nil,
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to(match(/Name/))
    expect(rendered).to(match(/Email/))
    expect(rendered).to(match(/Role/))
    expect(rendered).to(match(/Notes/))
    expect(rendered).to(match(/2/))
    expect(rendered).to(match(//))
  end
end
