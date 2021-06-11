require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it '全項目が存在すれば登録できること' do
        expect(@user).to be_valid
      end

      it 'passwordが6文字以上の場合保存できる' do
        @user.password = "aaa111"
        @user.password_confirmation = "aaa111"
        expect(@user).to be_valid
      end

      it 'passwordが半角英数字混合の場合保存できる' do
        @user.password = "aaa111"
        @user.password_confirmation = "aaa111"
        expect(@user).to be_valid
      end
    end
    context '新規登録がうまくいかないとき' do
      it 'nicknameが空では登録できないこと' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Nickname can't be blank")
      end

      it 'emailが空では登録できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Email can't be blank")
      end

      it '重複したemailが存在する場合登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include ("Email has already been taken")
      end

      it '＠をがemailに記載されていない場合登録できないこと' do
        @user.email = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Email is invalid")
      end

      it 'passwordが空では登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password can't be blank")
      end

      it 'passwordが5文字以下の場合登録できないこと' do
        @user.email = '11111'
        @user.password_confirmation = '11111'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Email is invalid")
      end
     
      it 'passwordは半角英数でない場合登録できないこと' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password confirmation doesn't match Password")
      end

      it 'passwordは半角数字でない場合登録できないこと' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password confirmation doesn't match Password")
      end

      it 'passwordは全角文字では登録できないこと' do
        @user.password = '１１１１１１'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password confirmation doesn't match Password")
      end

      it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password confirmation doesn't match Password")
      end

      it '誕生日が空では登録できないこと' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Birthday can't be blank")
      end

      it 'last_name_kanjiが空では登録できないこと' do
        @user.last_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Last name kanji can't be blank")
      end

      it 'last_name_kanjiが全角でないと登録できないこと' do
        @user.last_name_kanji = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Last name kanji is invalid. Input full-width characters.")
      end

      it 'first_name_kanjiが空では登録できないこと' do
        @user.first_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("First name kanji can't be blank")
      end

      it 'first_name_kanjiがカタカナ以外の全角でないと登録できないこと' do
        @user.first_name_kanji = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include ("First name kanji is invalid. Input full-width characters.")
      end

      it 'last_name_kanaが空では登録できないこと' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Last name kana can't be blank")
      end

      it 'last_name_kanaがカタカナ以外の全角でないと登録できないこと' do
        @user.last_name_kana = 'あいう絵尾'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Last name kana is invalid. Input full-width katakana characters.")
      end

      it 'first_name_kanaが空では登録できないこと' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("First name kana can't be blank")
      end
     
      it 'first_name_kanaが全角でないと登録できないこと' do
        @user.first_name_kana = 'あいう絵尾'
        @user.valid?
        expect(@user.errors.full_messages).to include ("First name kana is invalid. Input full-width katakana characters.")
      end
    end
  end
end
