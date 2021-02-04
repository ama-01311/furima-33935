FactoryBot.define do
  factory :user do
    nickname                { Faker::Name.initials(number: 2) }
    email                   { Faker::Internet.free_email }
    password                { Faker::Internet.password(min_length: 6) }
    password_confirmation   { password }
    lname_full_width        { 'てすと' }
    fname_full_width        { 'てすと' }
    lname_kana              { 'テスト' }
    fname_kana              { 'テスト' }
    birth_date              { '1991-01-01' }
  end
end
