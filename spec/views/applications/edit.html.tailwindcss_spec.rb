# frozen_string_literal: true

require "rails_helper"

RSpec.describe("applications/edit", type: :view) do
  let(:application) do
    Application.create!(
      url: "MyString",
      job_title: "MyString",
      notes: "MyText",
      total_comp: 1,
      company_tier: 1,
      company: nil,
    )
  end

  before do
    assign(:application, application)
  end

  it "renders the edit application form" do
    render

    assert_select "form[action=?][method=?]", application_path(application), "post" do
      assert_select "input[name=?]", "application[url]"

      assert_select "input[name=?]", "application[job_title]"

      assert_select "textarea[name=?]", "application[notes]"

      assert_select "input[name=?]", "application[total_comp]"

      assert_select "input[name=?]", "application[company_tier]"

      assert_select "input[name=?]", "application[company_id]"
    end
  end
end
