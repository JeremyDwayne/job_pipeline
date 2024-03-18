# frozen_string_literal: true

require "rails_helper"

RSpec.describe("retrospectives/edit", type: :view) do
  let(:retrospective) do
    Retrospective.create!(
      notes: "MyText",
      score: 1,
      interview: nil,
      application: nil,
    )
  end

  before do
    assign(:retrospective, retrospective)
  end

  it "renders the edit retrospective form" do
    render

    assert_select "form[action=?][method=?]", retrospective_path(retrospective), "post" do
      assert_select "textarea[name=?]", "retrospective[notes]"

      assert_select "input[name=?]", "retrospective[score]"

      assert_select "input[name=?]", "retrospective[interview_id]"

      assert_select "input[name=?]", "retrospective[application_id]"
    end
  end
end
