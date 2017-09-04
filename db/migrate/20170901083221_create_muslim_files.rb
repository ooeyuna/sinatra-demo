# frozen_string_literal: true

class CreateMuslimFiles < ActiveRecord::Migration[5.1]
  def change
    create_table :muslim_files, id: false do |t|
      t.primary_key :id, :string
      t.integer :user_id, null: false
      t.integer :download_status, null: false
      t.integer :download_type, null: false
      t.integer :file_size, limit: 8
      t.string :file_hash, null: false, unique: true
      t.string :storage_id
      t.string :file_name
      t.datetime :completed_at

      t.text :detail

      t.timestamps
    end
  end
end
