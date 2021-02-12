FactoryBot.define do
  factory :order_address do
    delivery_post_number   { '111-1111' }
    delivery_prefecture_id { '2' }
    delivery_municipality  { 'テスト市' }
    delivery_address       { 'テスト1-1-1' }
    delivery_building      { 'テスト' }
    phone_number           { '09000000000' }
    token                  { 'tok_abcdefghijk00000000000000000' }
  end
end
