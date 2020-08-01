class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
         
  validates :nickname, presence: true
  with_options presence: true do
    validates :email, format: { with: /\A.+@.+\z/, message: "@を含むメールアドレスを入力してください。"}
    validates :email, uniqueness: { case_sensitive: true, message: "登録済みのメールアドレスです。"}
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i, message: "半角英数混合、６文字以上としてください。"}
    
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "全角漢字・ひらがな・カタカナで入力してください。"}
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "全角漢字・ひらがな・カタカナで入力してください。"}
    validates :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "全角カタカナで入力してください。"}
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "全角カタカナで入力してください。"}
    validates :date_valid?
  end

  private
  def date_valid?
    date = birthday.to_s
    if date.count("-") > 3
      errors.add(:birthday, "日付の値が不正です")  
    else
      return true
    end
  end
end
