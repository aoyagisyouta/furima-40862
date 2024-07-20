class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  EMAIL_REGEX = /\A[\x20-\x7E]+@[\x20-\x7E]+\.[\x20-\x7E]+\z/
  validates :password, format: { with: PASSWORD_REGEX, message: 'is invalid. Include both letters and numbers' }
  validates :email, format: { with: EMAIL_REGEX, message: 'is invalid. Input valid email address without full-width characters' }
  validates :nickname, presence: true
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters' } do
    validates :kanji_last_name
    validates :kanji_first_name
  end
  with_options presence: true, format: { with: /\A[ァ-ヶ]+\z/, message: 'is invalid. Input full-width katakana characters' } do
    validates :kana_last_name, presence: true
    validates :kana_first_name, presence: true
  end
  validates :birth_date, presence: true
end
