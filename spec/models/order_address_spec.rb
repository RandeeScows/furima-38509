require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    sleep(1) #内在的なバグにより、読み込み順序を取り違えることでエラー(Failure/Error: _query(sql, @query_options.merge(options))が生じるための回避策　 
  end
  
  describe '商品購入機能' do
    context '商品が購入できる場合' do
      it '全項目が正しく入力されれば購入できる' do
        expect(@order_address).to be_valid
      end
      it '建物名は空でも購入できる' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end  

    context '商品が購入できない場合' do
      #token
      it 'tokenが空では購入できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      #address
      it '郵便番号が空では購入できない' do
        @order_address.zip_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Zip code can't be blank")        
      end
      it '郵便番号が 半角数字3桁ハイフン4桁 の他は購入できない' do
        @order_address.zip_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Zip code is invalid')
      end
      it '都道府県が空(id:0)では購入できない' do
        @order_address.prefecture_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")        
      end
      it '市町村が空では購入できない' do
        @order_address.township = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Township can't be blank")        
      end
      it '番地が空では購入できない' do
        @order_address.block = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Block can't be blank")                
      end
      it '電話番号が空では購入できない' do
        @order_address.tel = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel can't be blank")                        
      end
      it '電話番号が半角10桁以上11桁以内の他は購入できない' do
        @order_address.tel = 123456789
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Tel is invalid')
      end

      #order
      it 'userが紐づいていないと購入できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていないと購入できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
