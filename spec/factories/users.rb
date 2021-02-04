FactoryBot.define do
  factory :user do
    nickname                { Faker::Name.initials(number: 2) }
    email                   { Faker::Internet.free_email }
    password                { '1a' + Faker::Internet.password(min_length: 4) }
    password_confirmation   { password }
    lname_full_width        { 'てすと' }
    fname_full_width        { 'てすと' }
    lname_kana              { 'テスト' }
    fname_kana              { 'テスト' }
    birth_date              { '1991-01-01' }
  end
end
