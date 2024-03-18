# frozen_string_literal: true

class CreateApplications < ActiveRecord::Migration[7.1]
  def change
    create_table(:applications) do |t|
      t.string(:url)
      t.string(:job_title)
      t.text(:notes)
      t.integer(:total_comp)
      t.integer(:company_tier)
      t.belongs_to(:company, null: false, foreign_key: true)

      t.timestamps
    end
  end
end
