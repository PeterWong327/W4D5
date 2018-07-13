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

class User < ApplicationRecord
  attr_reader :password
  
  
  validates :username, presence: true, uniqueness: true
  validates :password_digest, :cheers_remaining, :session_token, presence: true
  validates :password, length: { minimum: 8, allow_nil: true }
  validates :cheers_remaining, numericality: { less_than: 13 }
  
  has_many :goals
  has_many :cheers
  has_many :comments, as: :location
  
  
  after_initialize :ensure_session_token
  
  def self.find_by_credentials(username, password)
    found_user = User.find_by(username: username)
    
    return nil unless found_user
    found_user if found_user.is_password?(password)
  end
  
  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password).to_s
  end
    
  def ensure_session_token
    self.session_token = SecureRandom.urlsafe_base64
  end
  
  def reset_session_token!
    ensure_session_token
    save!
    session_token
  end
  
  def is_password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end
end
