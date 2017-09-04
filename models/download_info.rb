# == Schema Information
#
# Table name: download_infos
#
#  id                 :integer          not null, primary key
#  file_id            :string           not null
#  progress           :float            default(0.0), not null
#  allow_retry        :integer          default(3), not null
#  priority           :integer          default(2), not null
#  current_downloader :string
#  current_request_id :string           not null
#  step               :integer          default(0), not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class DownloadInfo < ActiveRecord::Base

end
