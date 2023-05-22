class User < ApplicationRecord
  before_save :downcase_nick
  has_secure_password

  validates :email, presence: true, uniqueness: true
  def downcase_nick
    nickname.downcase!
  end
end
