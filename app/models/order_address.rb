class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :post_code, :prefecture_id, :municipulities, :block_number, :building_name,
                :phone_number, :purchase_record

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipulities
    validates :block_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :token
    validates :user_id
    validates :item_id

  end

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    ShippingInformation.create(post_code: post_code, prefecture_id: prefecture_id, municipulities: municipulities,
                               block_number: block_number, building_name: building_name, phone_number: phone_number, purchase_record_id: purchase_record.id)
  end
end
