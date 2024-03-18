# frozen_string_literal: true

require "rails_helper"

RSpec.describe("retrospectives/show", type: :view) do
  before do
    assign(:retrospective, Retrospective.create!(
      notes: "MyText",
      score: 2,
      interview: nil,
      application: nil,
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to(match(/MyText/))
    expect(rendered).to(match(/2/))
    expect(rendered).to(match(//))
    expect(rendered).to(match(//))
  end
end
