FactoryBot.define do
  factory :order_address do
    post_code { '123-4567' }
    prefecture_id { 2 }
    municipulities { '栃木市' }
    block_number { '1-1' }
    building_name { '栃木ハイツ' }
    phone_number { '09012345678' }
  end
end
