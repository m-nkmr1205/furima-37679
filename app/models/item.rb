class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_id
  belongs_to :condition_id 

# validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 
end
