class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   has_many :items
  
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
       validates :nickname, presence: true
       validates_format_of :password, with: PASSWORD_REGEX, message: 'include both letters and numbers'
       with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'Full-width characters' } do
         validates :first_name
         validates :last_name
         end
        with_options presence: true, format: { with: /\A[ァ-ヶ]+\z/, message: 'Full-width katakana characters' } do
         validates :first_name_kana
         validates :last_name_kana
        end
         validates :birth_day, presence: true
        
end
