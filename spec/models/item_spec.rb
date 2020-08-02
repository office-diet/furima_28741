require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
    # @item.image = fixture_file_upload('app/assets/images/test_image.png')

  end

  describe 'ユーザー新規登録' do
    context '消費登録がうまくいくとき' do
      it '全ての項目が揃っていれば登録できる' do
      end
      it 'passwordが英数混合・6文字以上であれば登録できる' do
      end
    end
    context '新規登録がうまくいくとき' do
      it '全ての項目が揃っていれば登録できる' do
      end
      it 'passwordが英数混合・6文字以上であれば登録できる' do
      end
    end
  end
end
