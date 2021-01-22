require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @address = FactoryBot.build(:order_address)
  end

  describe "商品購入機能" do
    context "購入できる時" do
      it "全ての項目を適切に記入,tokenがあれば購入できる" do
        expect(@address).to be_valid
      end
      it "建物名だけ空欄でも購入できる" do
        @address.building = ""
        expect(@address).to be_valid
      end
    end

    context "購入できない時" do
      it "tokenが空だと購入できない" do
        @address.token = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Token can't be blank")
      end
      it "郵便番号が空だと購入できない" do
        @address.post_number = ""
        @address.valid?
        expect(@address.errors.full_messages).to include "Post number can't be blank"
      end
      it "郵便番号にハイフンがないと購入できない" do
        @address.post_number = "3333333"
        @address.valid?
        expect(@address.errors.full_messages).to include "Post number Input correctly"
      end
      it "都道府県が空だと購入できない" do
        @address.prefecture_id = nil
        @address.valid?
        expect(@address.errors.full_messages).to include 'Prefecture Select'
      end
      it "市区町村が空だと購入できない" do
        @address.city = ""
        @address.valid?
        expect(@address.errors.full_messages).to include "City can't be blank"
      end
      it "番地が空だと購入できない" do
        @address.address = ""
        @address.valid?
        expect(@address.errors.full_messages).to include "Address can't be blank"
      end
      it "電話番号が空だと購入できない" do
        @address.phone_number = ""
        @address.valid?
        expect(@address.errors.full_messages).to include "Phone number can't be blank"
      end
      it "電話番号にハイフンがあると購入できない" do
        @address.phone_number = "123-456-7890"
        @address.valid?
        expect(@address.errors.full_messages).to include "Phone number Half-width number"
      end
      it "電話番号が11けた以上だと購入できない" do
        @address.phone_number = "1234567890123"
        @address.valid?
        expect(@address.errors.full_messages).to include "Phone number Over number"
      end
    end
  end
end