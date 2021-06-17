require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品保存' do
    context '商品出品ができるとき' do
      it '全ての入力項目に正しく入力できていれば出品できること' do
        expect(@item).to be_valid
      end
    end

    context '商品出品ができないとき' do
      it '商品画像を1枚つけることが必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("Image can't be blank")
      end

      it '商品名が必須であること' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Name can't be blank")
      end

      it '商品の説明が必須であること' do
        @item.catch_copy = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Catch copy can't be blank")
      end

      it 'カテゴリーの情報が必須であること' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Category can't be blank")
      end
      
      it '商品の状態についての情報が必須であること' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Condition can't be blank")
      end

      it '配送料の負担についての情報が必須であること' do
        @item.burden_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Burden can't be blank")
      end

      it '発送元の地域についての情報が必須であること' do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Area can't be blank")
      end

      it '発送までの日数についての情報が必須であること' do
        @item.shipping_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Shipping date can't be blank")
      end

      it '販売価格についての情報が必須であること' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price can't be blank")
      end

      it '販売価格は、¥300~¥9,999,999の間のみ保存可能であること' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price must be greater than or equal to 300")
      end

      it '販売価格は、¥300~¥9,999,999の間のみ保存可能であること' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price must be less than or equal to 9999999")
      end

      it '販売価格は半角英字では保存できない' do
        @item.price = 'aaaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price is not a number")
      end

      it '販売価格は全角では保存できない' do
        @item.price = 'ａａ１１'
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price is not a number")
      end
      

      it 'condition_idが一の場合保存できないこと' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Condition must be other than 1")
      end

      it 'category_idが一の場合保存できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Category must be other than 1")
      end

      it 'burden_idが一の場合保存できないこと' do
        @item.burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Burden must be other than 1")
      end

      it 'area_idが一の場合保存できないこと' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Area must be other than 1")
      end

      it 'shipping_date_idが一の場合保存できないこと' do
        @item.shipping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Shipping date must be other than 1")
      end

      it '紐づくユーザーが存在いないと保存できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("User must exist")
      end

    end
  end
end
