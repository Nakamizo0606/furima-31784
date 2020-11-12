class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery

  with_options presence: true do
  validates :name           
  validates :info           
  validates :category_id    
  validates :sales_status_id
  validates :shipping_fee_status_id
  validates :prefecture_id         
  validates :scheduled_delivery_id 
  validates :price
  validates :image 
  end

  with_options numericality: { other_than: 0 } do
  validates :category_id
  validates :sales_status_id
  validates :shipping_fee_status_id
  validates :prefecture_id
  validates :scheduled_delivery_id
  end
  
  validates :price,  numericality: { only_integer: true,greater_than: 300, less_than: 9999999}
  validates :price,  format: { with: /\A[0-9]\w*\z/, message: '販売価格は半角数字を使用してください' } 


end