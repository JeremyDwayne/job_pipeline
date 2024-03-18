# frozen_string_literal: true

class Interview < ApplicationRecord
  belongs_to :contact
  belongs_to :company
end
