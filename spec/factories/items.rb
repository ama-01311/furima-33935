FactoryBot.define do
  factory :item do
    item_name              { 'test' }
    item_description       { 'test' }
    item_category_id       { '2' }
    item_state_id          { '2' }
    delivery_side_id       { '2' }
    delivery_prefecture_id { '2' }
    delivery_days_id       { '2' }
    selling_price          { '500' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/comment.png'), filename: 'comment.png', content_type: 'image/png')
    end
  end
end
