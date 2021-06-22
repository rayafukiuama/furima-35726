class PurchaseUserAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :area_id, :city, :block, :building, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :area_id, numericality: { other_than: 1 }
    validates :city
    validates :block
    validates :token
    validates :phone_number, format: {with: /\A\d{10,11}\z/}
  end

  def save
    purchase_user = PurchaseUser.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, area_id: area_id, city: city, block: block, building: building, phone_number: phone_number, purchase_user_id: purchase_user)
  end
end