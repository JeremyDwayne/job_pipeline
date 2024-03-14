# frozen_string_literal: true

require "rails_helper"

RSpec.describe(User, type: :model) do
  subject(:user) do
    described_class.new(email: "user@example.com", password: "password", password_confirmation: "password")
  end

  it "is valid with valid attributes" do
    expect(user).to(be_valid)
  end

  it "is invalid without an email" do
    user.email = " "
    expect(user).not_to(be_valid)
  end

  it "is invalid with a duplicate email" do
    duplicate_user = user.dup
    user.save
    expect(duplicate_user).not_to(be_valid)
  end

  it "rejects invalid email addresses" do
    invalid_addresses = [
      "user@example,com",
      "user_at_example.org",
      "user.name@example.",
      "foo@bar_baz.com",
      "foo@bar+baz.com",
    ]
    invalid_addresses.each do |invalid_address|
      user.email = invalid_address
      expect(user).not_to(be_valid, "#{invalid_address.inspect} should be invalid")
    end
  end

  it "accepts valid email addresses" do
    valid_addresses = [
      "user@example.com",
      "USER@foo.COM",
      "A_US-ER@foo.bar.org",
      "first.last@foo.jp",
      "alice+bob@baz.cn",
    ]
    valid_addresses.each do |valid_address|
      user.email = valid_address
      expect(user).to(be_valid, "#{valid_address.inspect} should be valid")
    end
  end

  it "saves email addresses as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    user.email = mixed_case_email
    user.save
    expect(user.reload.email).to(eq(mixed_case_email.downcase))
  end
end
