# frozen_string_literal: true

require "rails_helper"

RSpec.describe("interviews/index", type: :view) do
  before do
    assign(:interviews, [
      Interview.create!(
        type: "Type",
        stage: "Stage",
        notes: "MyText",
        contact: nil,
        company: nil,
      ),
      Interview.create!(
        type: "Type",
        stage: "Stage",
        notes: "MyText",
        contact: nil,
        company: nil,
      ),
    ])
  end

  it "renders a list of interviews" do
    render
    cell_selector = Rails::VERSION::STRING >= "7" ? "div>p" : "tr>td"
    assert_select cell_selector, text: Regexp.new("Type".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Stage".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
