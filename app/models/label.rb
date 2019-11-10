class Label < ApplicationRecord
    has_many :tags,dependent: :destroy
    has_many :tasks, through: :tags
end
