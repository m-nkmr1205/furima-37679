FactoryBot.define do
  factory :item do
    item_name           { 'hoge' }
    description         { '商品説明' }
    category_id         { 2 }
    condition_id        { 2 }
    postage_type_id     { 2 }
    prefecture_id       { 2 }
    preparation_day_id  { 2 }
    price               { '1000' }
    association :user

     after(:build) do |item|
       item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
     end
  end
end

