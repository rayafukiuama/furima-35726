class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase_user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :burden
  belongs_to :area
  belongs_to :shipping_date

  with_options presence: true do
    validates :image
    validates :name
    validates :catch_copy
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id
      validates :burden_id
      validates :area_id
      validates :shipping_date_id
    end
    with_options format: { with: /\A[0-9]+\z/} do
      validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999}
    end
  end
end
