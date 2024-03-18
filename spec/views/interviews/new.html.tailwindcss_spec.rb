# frozen_string_literal: true

require "rails_helper"

RSpec.describe("interviews/new", type: :view) do
  before do
    assign(:interview, Interview.new(
      type: "",
      stage: "MyString",
      notes: "MyText",
      contact: nil,
      company: nil,
    ))
  end

  it "renders new interview form" do
    render

    assert_select "form[action=?][method=?]", interviews_path, "post" do
      assert_select "input[name=?]", "interview[type]"

      assert_select "input[name=?]", "interview[stage]"

      assert_select "textarea[name=?]", "interview[notes]"

      assert_select "input[name=?]", "interview[contact_id]"

      assert_select "input[name=?]", "interview[company_id]"
    end
  end
end
