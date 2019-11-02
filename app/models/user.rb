class User < ApplicationRecord
  validates :name,  presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :email, uniqueness: true
  has_secure_password
  has_many :tasks ,dependent: :destroy

  scope :login_user, -> {find(current_user.id)}
  scope :admin_count, -> {where(admin: 'ture').count}
end
