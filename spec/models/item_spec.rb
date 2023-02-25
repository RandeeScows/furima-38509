require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品新規登録' do
    context '新規登録ができる場合' do
      it '全項目あれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '新規登録できない場合' do
      #name
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      
      #price
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが300未満では登録できない' do
        @item.price = Faker::Number.between(from: 0, to:299)
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'priceが9999999超過(8桁以上の数値)では登録できない' do
        @item.price = Faker::Number.number(digits: 8)
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it 'priceが半角数字以外では登録できない' do
        @item.price = '123１２３'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      #description
      it 'descriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      #active hash
      it 'category_idが---では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'condition_idが---では登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'shipping_cost_on_idが---では登録できない' do
        @item.shipping_cost_on_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost on can't be blank")
      end
      it 'origin_idが---では登録できない' do
        @item.origin_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Origin can't be blank")
      end
      it 'lead_time_idが---では登録できない' do
        @item.lead_time_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Lead time can't be blank")
      end

      #image
      it 'imageが無いと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
