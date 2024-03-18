# frozen_string_literal: true

require "rails_helper"

RSpec.describe("interviews/edit", type: :view) do
  let(:interview) do
    Interview.create!(
      type: "",
      stage: "MyString",
      notes: "MyText",
      contact: nil,
      company: nil,
    )
  end

  before do
    assign(:interview, interview)
  end

  it "renders the edit interview form" do
    render

    assert_select "form[action=?][method=?]", interview_path(interview), "post" do
      assert_select "input[name=?]", "interview[type]"

      assert_select "input[name=?]", "interview[stage]"

      assert_select "textarea[name=?]", "interview[notes]"

      assert_select "input[name=?]", "interview[contact_id]"

      assert_select "input[name=?]", "interview[company_id]"
    end
  end
end
