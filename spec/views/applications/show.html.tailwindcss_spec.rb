# frozen_string_literal: true

require "rails_helper"

RSpec.describe("applications/show", type: :view) do
  before do
    assign(:application, Application.create!(
      url: "Url",
      job_title: "Job Title",
      notes: "MyText",
      total_comp: 2,
      company_tier: 3,
      company: nil,
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to(match(/Url/))
    expect(rendered).to(match(/Job Title/))
    expect(rendered).to(match(/MyText/))
    expect(rendered).to(match(/2/))
    expect(rendered).to(match(/3/))
    expect(rendered).to(match(//))
  end
end
