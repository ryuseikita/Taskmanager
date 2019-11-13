class Label < ApplicationRecord
    validates :name, presence: true
    has_many :tags,dependent: :destroy
    has_many :tasks, through: :tags
end
