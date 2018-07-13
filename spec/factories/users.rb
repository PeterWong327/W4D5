# == Schema Information
#
# Table name: users
#
#  id               :bigint(8)        not null, primary key
#  username         :string           not null
#  password_digest  :string           not null
#  cheers_remaining :integer          not null
#  session_token    :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

FactoryBot.define do
  # factory :user do
  #   username "MyString"
  #   password_digest "MyString"
  #   cheers_remaining 12
  # end
end
