class Item < ApplicationRecord
  belonges_to :user
  has_one_attached :image
end
