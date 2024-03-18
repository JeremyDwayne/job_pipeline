# frozen_string_literal: true

class Retrospective < ApplicationRecord
  belongs_to :interview
  belongs_to :application
end
