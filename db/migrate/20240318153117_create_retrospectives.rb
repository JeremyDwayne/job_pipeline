# frozen_string_literal: true

class CreateRetrospectives < ActiveRecord::Migration[7.1]
  def change
    create_table(:retrospectives) do |t|
      t.text(:notes)
      t.integer(:score)
      t.belongs_to(:interview, null: false, foreign_key: true)
      t.belongs_to(:application, null: false, foreign_key: true)

      t.timestamps
    end
  end
end
