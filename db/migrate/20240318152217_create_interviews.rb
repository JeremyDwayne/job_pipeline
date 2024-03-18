# frozen_string_literal: true

class CreateInterviews < ActiveRecord::Migration[7.1]
  def change
    create_table(:interviews) do |t|
      t.string(:type)
      t.string(:stage)
      t.datetime(:scheduled_at)
      t.text(:notes)
      t.belongs_to(:contact, null: false, foreign_key: true)
      t.belongs_to(:company, null: false, foreign_key: true)

      t.timestamps
    end
  end
end
