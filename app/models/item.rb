class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :post_type
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :preparation_day

  with_options presence: true do
    validates :image
    validates :name
    validates :explain
  end

  validates :price, numericality: { only_interger: true, message: 'Half-width number' }
  validates :price, numericality: { greater_than_or_equal_to: 300,less_than_or_equal_to: 9999999 , message: 'Out of setting range' }

  with_options numericality: { other_than: 1, message: 'Select' } do
  validates :category_id 
  validates :condition_id 
  validates :post_type_id 
  validates :prefecture_id
  validates :preparation_day_id 
  end
end
