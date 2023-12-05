class Library < ApplicationRecord
  belongs_to :user
  belongs_to :book, dependent: :destroy
end
