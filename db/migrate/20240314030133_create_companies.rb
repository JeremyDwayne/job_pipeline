# frozen_string_literal: true

class CreateCompanies < ActiveRecord::Migration[7.1]
  def change
    create_table(:companies) do |t|
      t.string(:name, index: { unique: true })
      t.string(:url)

      t.timestamps
    end
  end
end
