require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end
    
    it "商品画像を1枚つけることが必須であること" do
    @item.image = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    
    it "商品名が必須であること" do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    
    it "商品の説明が必須であること" do
      @item.info = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Info can't be blank")
    end
    
    it "カテゴリーの情報が(---)のだと保存できない" do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    
    it "商品の状態についての情報が(---)の必須であること" do
      @item.sales_status_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Sales status can't be blank")
    end
    
    it "配送料の負担についての情報が(---)の必須であること" do
      @item.shipping_fee_status_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee status can't be blank")
    end
    
    it "発送元の地域についての情報が(---)の必須であること" do
      @item.prefecture_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end
    
    it "発送までの日数についての情報が(---)の必須であること" do
      @item.scheduled_delivery_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank")
    end
    
    it "価格についての情報が(---)の必須であること" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    
    it "価格の範囲が、¥300~¥9,999,999の間であること" do
      @item.price = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than 300")
    end
    
    it "販売価格は半角数字のみ保存可能であること" do
      @item.price = "あ"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
  end 
end  
