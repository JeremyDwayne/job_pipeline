# frozen_string_literal: true

class CreateContacts < ActiveRecord::Migration[7.1]
  def change
    create_table(:contacts) do |t|
      t.string(:name)
      t.string(:email)
      t.string(:role)
      t.text(:notes)
      t.integer(:tenure)
      t.references(:company, null: false, foreign_key: true)

      t.timestamps
    end
  end
end
