require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end


  describe 'ユーザー新規登録' do
    it "全てのフォーム記入できたら登録できる" do
      expect(@user).to be_valid
    end
    it "nicknameが空だと登録できない" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include ("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include ("Email can't be blank")
    end
    it "emailは@を含まないと登録できない" do
      @user.email = "1q1q.com"
      @user.valid?
      expect(@user.errors.full_messages).to include ("Email is invalid")
    end
    it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include ("Email has already been taken")
    end
    it "passwordが空だと登録できない" do
      @user.password = nil
      @user.valid?
      
      expect(@user.errors.full_messages).to include ("Password can't be blank")
    end
    it "passwordが5文字以下であれば登録できない" do
      @user.password = "00000"
      @user.password_confirmation = "00000"
      @user.valid?
      expect(@user.errors.full_messages).to include ("Password is too short (minimum is 6 characters)")
    end
    it "passwordとpassword_confirmationが不一致では登録できないこと" do
        @user.password = "123456"
        @user.password_confirmation = "1234567"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  
    it "first_nameがない場合は登録できないこと" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include ("First name can't be blank")
    end
    it "last_nameがない場合は登録できないこと" do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include ("Last name can't be blank")
    end
    it "first_name_kanaがない場合は登録できないこと" do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include ("First name kana can't be blank")
    end
    it "last_name_kanaがない場合は登録できないこと" do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include ("Last name kana can't be blank")
    end
    it "birth_dayがない場合は登録できないこと" do
      @user.birth_day = nil
      @user.valid?
      expect(@user.errors.full_messages).to include ("Birth day can't be blank")
    end
    




  end
end
