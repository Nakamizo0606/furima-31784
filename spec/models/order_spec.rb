require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '#create' do
    before do
    seller = FactoryBot.create(:user)
    buyer = FactoryBot.create(:user)
    item = FactoryBot.build(:item, user_id:seller.id)
    @order = FactoryBot.build(:order_address, user_id:buyer.id, item_id:item.id)
    end

  describe '購入機能' do
    context '購入がうまくいくとき' do

    it "購入できる" do
          expect(@order).to be_valid
    end
    
    it "building_nameは空でも保存できること" do
      @order.building_name = ""
      expect(@order).to be_valid
    end
  end
  
  context '購入機能がうまくいかないとき' do


    it "tokenが空では登録できないこと" do
      @order.token = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end
    
    
    it "配送先の情報として、郵便番号が必須であること" do
      @order.postal_code = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code can't be blank")
    end
    
    it "郵便番号にはハイフンが必要であること（123-4567となる）" do
      @order.postal_code = '1234567'
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    
    
    it "配送先の情報として、都道府県が必須であること" do
      @order.prefecture_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Prefecture can't be blank")
    end
    
    it 'prefectureを選択していないと保存できないこと' do
      @order.prefecture_id = 0
      @order.valid?
      expect(@order.errors.full_messages).to include("Prefecture can't be blank")
    end
    
    it "配送先の情報として、市区町村が必須であること" do
      @order.municipality = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Municipality can't be blank")
    end
    
    
    
    it "配送先の情報として、番地が必須であること" do
      @order.house_number = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("House number can't be blank")
    end
    
    it "配送先の情報として、電話番号が必須であること" do
      @order.phone_number = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number can't be blank")
    end
    
    it "電話番号にはハイフンは不要で、11桁以内であること（09012345678となる）" do
      @order.phone_number = "090-12345-6789"
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number is invalid. Input half-width characters.")
    end
   end
  end

  end
end  