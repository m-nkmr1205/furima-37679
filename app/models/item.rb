class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category_id
  belongs_to :condition_id 
  belongs_to :postage_type_id
  belongs_to :prefecture_id
  belongs_to :preparation_day_id 
  has_one_attached :image

  validates :item_name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :condition_id , presence: true
  validates :postage_type_id, presence: true
  validates :prefecture_id, presence: true
  validates :preparation_day_id, presence: true
  validates :price, presence: true, format: { with: /\A[0-9]+\z/ }, numericality: {only_integer: true, :greater_than_or_equal_to: 300, less_than_or_equal_to:9999999}


  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :postage_type_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :preparation_day, numericality: { other_than: 1 , message: "can't be blank"}  
end
