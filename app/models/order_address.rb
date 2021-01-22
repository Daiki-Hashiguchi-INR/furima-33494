class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_number, :city, :address,
                :phone_number, :building, :prefecture_id, :order_id, :item_id, :user_id,
                :token

  with_options presence: true do
    validates :post_number, format: { with: /\A\d{3}-\d{4}\z/, message: 'Input correctly' }
    validates :city
    validates :address
    validates :phone_number, numericality: { only_interger: true, message: 'Half-width number' },
                             length: { maximum: 11, message: 'Over number' }
    validates :token, presence: true
    validates :user_id
    validates :item_id
  end

  validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    Address.create(post_number: post_number, prefecture_id: prefecture_id, city: city, address: address,
                   building: building, phone_number: phone_number, order_id: order.id)
  end
end
