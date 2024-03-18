# frozen_string_literal: true

class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :url, format: { with: URI::DEFAULT_PARSER.make_regexp }
  normalizes :url, with: ->(url) { url.strip.downcase }
end
