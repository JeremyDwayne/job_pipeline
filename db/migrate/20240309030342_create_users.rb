# frozen_string_literal: true

# Creates the users table with built-in Rails Authentication
class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table(:users) do |t|
      t.string(:email, index: { unique: true })
      t.string(:password_digest)

      t.timestamps
    end
  end
end
