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

FactoryGirl.define do
  factory :muslim_file do
    user_id 1
    download_status 1
    download_type 1
    file_size 0
    file_hash 'abc'
  end
end
