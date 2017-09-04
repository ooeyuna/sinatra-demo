class CreateDownloadInfo < ActiveRecord::Migration[5.1]
  def change
    create_table :download_infos do |t|
      
      t.string :file_id, unique: true, null: false
      t.float :progress, null: false, default: 0.0
      t.integer :allow_retry, null: false, default: 3
      t.integer :priority, null: false, default: 2
      t.string :current_downloader
      t.string :current_request_id, null: false, unique: true
      t.integer :step, null: false, default: 0

      t.timestamps
    end
  end
end
