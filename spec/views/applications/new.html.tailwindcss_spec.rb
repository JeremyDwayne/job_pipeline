# frozen_string_literal: true

require "rails_helper"

RSpec.describe("applications/new", type: :view) do
  before do
    assign(:application, Application.new(
      url: "MyString",
      job_title: "MyString",
      notes: "MyText",
      total_comp: 1,
      company_tier: 1,
      company: nil,
    ))
  end

  it "renders new application form" do
    render

    assert_select "form[action=?][method=?]", applications_path, "post" do
      assert_select "input[name=?]", "application[url]"

      assert_select "input[name=?]", "application[job_title]"

      assert_select "textarea[name=?]", "application[notes]"

      assert_select "input[name=?]", "application[total_comp]"

      assert_select "input[name=?]", "application[company_tier]"

      assert_select "input[name=?]", "application[company_id]"
    end
  end
end
