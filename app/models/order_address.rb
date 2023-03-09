class OrderAddress
  include ActiveModel::Model
  attr_accessor :zip_code, :prefecture_id, :township, :block, :building, :tel, :item_id, :user_id, :token

  with_options presence: true do
    validates :zip_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid' }
    validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank" }
    validates :township, format: { with: /.+/ }
    validates :block, format: { with: /.+/ }
    validates :tel, format: { with: /\A[0-9]{10,11}\z/, message: 'is invalid' }
    validates :item_id
    validates :user_id
    validates :token
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(zip_code: zip_code, prefecture_id: prefecture_id, township: township, block: block, building: building, tel: tel, order_id: order.id)
  end

end