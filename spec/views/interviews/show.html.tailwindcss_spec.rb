# frozen_string_literal: true

require "rails_helper"

RSpec.describe("interviews/show", type: :view) do
  before do
    assign(:interview, Interview.create!(
      type: "Type",
      stage: "Stage",
      notes: "MyText",
      contact: nil,
      company: nil,
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to(match(/Type/))
    expect(rendered).to(match(/Stage/))
    expect(rendered).to(match(/MyText/))
    expect(rendered).to(match(//))
    expect(rendered).to(match(//))
  end
end
