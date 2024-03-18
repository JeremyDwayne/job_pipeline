# frozen_string_literal: true

require "rails_helper"

RSpec.describe("retrospectives/new", type: :view) do
  before do
    assign(:retrospective, Retrospective.new(
      notes: "MyText",
      score: 1,
      interview: nil,
      application: nil,
    ))
  end

  it "renders new retrospective form" do
    render

    assert_select "form[action=?][method=?]", retrospectives_path, "post" do
      assert_select "textarea[name=?]", "retrospective[notes]"

      assert_select "input[name=?]", "retrospective[score]"

      assert_select "input[name=?]", "retrospective[interview_id]"

      assert_select "input[name=?]", "retrospective[application_id]"
    end
  end
end
