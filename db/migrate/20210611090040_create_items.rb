class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string       :name,         null: false
      t.text         :catch_copy,   null: false
      t.integer      :category_id,  null: false
      t.integer      :condition_id, null: false
      t.integer      :burden_id,    null: false
      t.integer      :area_id,      null: false
      t.integer      :shipping_date_id,      null: false
      t.integer      :price,        null: false
      t.references   :user,         foreign_key: true
      t.timestamps
    end
  end
end
