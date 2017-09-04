# frozen_string_literal: true
# == Schema Information
#
# Table name: muslim_files
#
#  id              :string           not null, primary key
#  user_id         :integer          not null
#  download_status :integer          not null
#  download_type   :integer          not null
#  file_size       :integer
#  file_hash       :string           not null
#  storage_id      :string
#  completed_at    :datetime
#  detail          :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class MuslimFile < ActiveRecord::Base
  before_create :init_data
  enum download_status: %i[waiting downloading completed uploading deleted]
  enum download_type: %i[http_upload bitorrent emule magnet]
  store :detail, coder: JSON

  def self.new_file(params)
    mf = MuslimFile.new(params.slice('file_hash', 'detail', 'download_type', 'file_name', 'user_id'))
    mf.save
    mf
  end

  def init_data
    self.id = SecureRandom.hex
    self.download_status = :waiting
  end

  def wcs_token
    # get key and generate token
    App.settings.app
  end
end
