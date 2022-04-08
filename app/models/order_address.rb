class OrderAddress
  include ActiveModel::Model
  attr_accesor :user, :item, :post_code, :prefecture_id, :municipulities, :block_number, :building_name, :phone_number, :purchase_record

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipulities
    validates :block_number
    validates :phone_number, format: {with: /\A\d{10,11}\z/} 
    validates :purchase_record_id
  end
    
end


