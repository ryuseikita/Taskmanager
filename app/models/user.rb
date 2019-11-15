class User < ApplicationRecord
  before_destroy :anotheradmin_check
  validates :name,  presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :email, uniqueness: true
  has_secure_password
  has_many :tasks ,dependent: :destroy

  scope :login_user, -> {find(current_user.id)}
  scope :admin_count, -> {where(admin: true).count}

  private

  def anotheradmin_check
    if User.admin_count == 1 and admin?
      throw :abort
    end
  end
end
