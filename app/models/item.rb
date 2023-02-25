class Item < ApplicationRecord
  
  validates :name, presence: true
  validates :price, presence: true, 
  numericality:{ greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 },
  format:{ with:/\d{3,7}/, message: "300-9,999,999の範囲で半角数字で入力してください" }
  validates :description, presence: true
  
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :shipping_cost_on_id, presence: true
  validates :origin_id, presence: true
  validates :lead_time_id, presence: true

  belongs_to :user
  has_one :order
  has_one_attached :image
  validates :image, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  
  belongs_to :condition
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  
  belongs_to :shipping_cost_on
  validates :shipping_cost_on_id, numericality: { other_than: 1 , message: "can't be blank"}
  
  belongs_to :origin
  validates :origin_id, numericality: { other_than: 1 , message: "can't be blank"}

  belongs_to :lead_time
  validates :lead_time_id, numericality: { other_than: 1 , message: "can't be blank"}


end
