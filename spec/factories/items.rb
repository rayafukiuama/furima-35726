FactoryBot.define do
  factory :item do
    name {"商品名"}
    catch_copy {"説明"}
    category_id {2}
    condition_id {2}
    burden_id {2}
    area_id {2}
    shipping_date_id {2}
    price {500}
    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/furima-header01.png'), filename: 'furima-header01.png')
    end
    association :user
  end
end
