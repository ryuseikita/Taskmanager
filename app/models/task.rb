class Task < ApplicationRecord
  validates :title, presence: true
  validates :details, presence: true
  validates :deadline, presence: true
  validates :priority, presence: true
  validates :status, presence: true
end
