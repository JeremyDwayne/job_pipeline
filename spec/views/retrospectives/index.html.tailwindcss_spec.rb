# frozen_string_literal: true

require "rails_helper"

RSpec.describe("retrospectives/index", type: :view) do
  before do
    assign(:retrospectives, [
      Retrospective.create!(
        notes: "MyText",
        score: 2,
        interview: nil,
        application: nil,
      ),
      Retrospective.create!(
        notes: "MyText",
        score: 2,
        interview: nil,
        application: nil,
      ),
    ])
  end

  it "renders a list of retrospectives" do
    render
    cell_selector = Rails::VERSION::STRING >= "7" ? "div>p" : "tr>td"
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
