class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_id
  belongs_to :condition_id 
  belongs_to :postage_type_id

# validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 
# validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"} 
# validates :postage_type_id, numericality: { other_than: 1 , message: "can't be blank"} 
end
