FactoryBot.define do 
  factory :user do 
    nickname             {Faker::Name.initials(number: 3)}
    email                {Faker::Internet.email}
    password             {Faker::Internet.password(min_length: 6) + '1a'}
    password_confirmation{password}
    kanji_last_name      {'山田'}
    kanji_first_name     {'太郎'}
    kana_last_name       {'ヤマダ'}
    kana_first_name      {'タロウ'}
    birth_date           {Faker::Date.birthday}
  end 
end