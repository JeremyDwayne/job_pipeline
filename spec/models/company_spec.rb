# frozen_string_literal: true

require "rails_helper"

RSpec.describe(Company, type: :model) do
  subject(:company) do
    described_class.new(name: "Example Company", url: "http://www.example.com")
  end

  it "is valid with valid attributes" do
    expect(company).to(be_valid)
  end

  it "is invalid without an email" do
    company.email = " "
    expect(company).not_to(be_valid)
  end

  it "is invalid with a duplicate email" do
    duplicate_company = company.dup
    company.save
    expect(duplicate_company).not_to(be_valid)
  end
end
