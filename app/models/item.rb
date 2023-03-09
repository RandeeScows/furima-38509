class Item < ApplicationRecord
  
  with_options presence: true do
    validates :name
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
    validates :description
    validates :category_id
    validates :condition_id
    validates :shipping_cost_on_id
    validates :origin_id
    validates :lead_time_id
  end

  belongs_to :user
  has_one :order
  has_one_attached :image
  validates :image, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank" }
  
  belongs_to :condition
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank" }
  
  belongs_to :shipping_cost_on
  validates :shipping_cost_on_id, numericality: { other_than: 1 , message: "can't be blank" }
  
  belongs_to :origin
  validates :origin_id, numericality: { other_than: 1 , message: "can't be blank" }

  belongs_to :lead_time
  validates :lead_time_id, numericality: { other_than: 1 , message: "can't be blank" }

end
