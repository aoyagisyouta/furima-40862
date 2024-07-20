class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX

  validates :nickname, presence: true
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/} do 
    validates :kanji_last_name
    validates :kanji_first_name
  end
  with_options presence: true, format: {with: /\A[ァ-ヶ]+\z/} do 
    validates :kana_last_name, presence: true
    validates :kana_first_name, presence: true
  end 
  validates :birth_date, presence: true
end
