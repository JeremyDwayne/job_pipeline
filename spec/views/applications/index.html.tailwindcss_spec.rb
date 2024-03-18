# frozen_string_literal: true

require "rails_helper"

RSpec.describe("applications/index", type: :view) do
  before do
    assign(:applications, [
      Application.create!(
        url: "Url",
        job_title: "Job Title",
        notes: "MyText",
        total_comp: 2,
        company_tier: 3,
        company: nil,
      ),
      Application.create!(
        url: "Url",
        job_title: "Job Title",
        notes: "MyText",
        total_comp: 2,
        company_tier: 3,
        company: nil,
      ),
    ])
  end

  it "renders a list of applications" do
    render
    cell_selector = Rails::VERSION::STRING >= "7" ? "div>p" : "tr>td"
    assert_select cell_selector, text: Regexp.new("Url".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Job Title".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
