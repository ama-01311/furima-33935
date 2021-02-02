# テーブル設計

## usersテーブル

| Column                     | Type    | Options                   |
| -------------------------- | ------- | ------------------------- |
| nickname                   | string  | null: false               |
| email                      | string  | null: false, unique: true |
| encrypted_password         | string  | null: false               |
| lname_full_width           | string  | null: false               |
| fname_full_width           | string  | null: false               |
| lname_kana                 | string  | null: false               |
| fname_kana                 | string  | null: false               |
| birth_date                 | date    | null: false               |


### Association

- has_many :items
- has_many :orders

## itemsテーブル

| Column                    | Type        | Options           |
| ------------------------- | ----------- | ----------------- |
| item_name                 | string      | null: false       |
| item_description          | text        | null: false       |
| item_category_id          | integer     | null: false       |
| item_state_id             | integer     | null: false       |
| delivery_side_id          | integer     | null: false       |
| delivery_prefecture_id    | integer     | null: false       |
| delivery_days_id          | integer     | null: false       |
| selling_price             | integer     | null: false       |
| user                      | references  | foreign_key: true |

### Association

- has_one :order
- belongs_to :user

## ordersテーブル

| Column                | Type       | Options           |
| --------------------- | ---------- | ----------------- |
| user                  | references | foreign_key: true |
| item                  | references | foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address

## addressesテーブル

| Column                   | Type        | Options           |
| ------------------------ | ----------- | ----------------- |
| delivery_post_number     | string      | null: false       |
| delivery_prefecture_id   | integer     | null: false       |
| delivery_municipality    | string      | null: false       |
| delivery_address         | string      | null: false       |
| delivery_building        | string      |                   |
| phone_number             | string      | null: false       |
| order                    | references  | foreign_key :true |

### Association
- belongs_to :order