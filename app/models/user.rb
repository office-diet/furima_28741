class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
         
  validates :nickname, presence: true
  validates :birthday, presence: true
  with_options presence: true do
    validates :email, uniqueness: { case_sensitive: true, message: "has already been taken"}
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i, message: "input half-width numbers and characters."}
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "input full-width japanese characters."}
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "input full-width japanese characters."}
    validates :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "input full-width katakana characters."}
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "input full-width katakana characters."}
    validates :birthday_valid?
  end

  private
  def birthday_valid?
    date = birthday.to_s
    if date != "" && date.count("-") > 2
      errors.add(:birthday, "invalid")
    else
      return true
    end
  end
end
