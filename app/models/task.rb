class Task < ApplicationRecord
  has_and_belongs_to_many :contacts, dependent: :destroy
  has_and_belongs_to_many :users, dependent: :destroy
  has_and_belongs_to_many :properties, dependent: :destroy
end
