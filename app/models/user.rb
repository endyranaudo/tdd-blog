class User < ApplicationRecord
  scope :active_users, -> { where(active: true) }
  scope :inactive_users, -> { where(active: false) }

  validates :username, presence: true
  validates :email, presence: true
  validates :password, presence: true
end
