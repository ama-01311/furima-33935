# テーブル設計

## usersテーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| nickname         | string  | null: false |
| email            | string  | null: false |
| password         | string  | null: false |
| lname_full_width | string  | null: false |
| fname_full_width | string  | null: false |
| lname_kana       | string  | null: false |
| fname_kana       | string  | null: false |
| birth_year       | integer | null: false |
| birth_month      | integer | null: false |
| birth_day        | integer | null: false |

### Association

- has_many :items

## itemsテーブル

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| item_name        | string     | null: false       |
| item_description | text       | null: false       |
| item_category    | string     | null: false       |
| item_state       | string     | null: false       |
| delivery_side    | string     | null: false       |
| delivery_area    | string     | null: false       |
| delivery_days    | integer    | null: false       |
| selling_price    | integer    | null: false       |
| user             | references | foreign_key: true |

### Association

- has_one :order
- belongs_to :user

## ordersテーブル

| Column                | Type       | Options           |
| --------------------- | ---------- | ----------------- |
| credit_information    | integer    | null: false       |
| credit_month          | integer    | null: false       |
| credit_code           | integer    | null: false       |
| delivery_post_number  | integer    | null: false       |
| delivery_prefecture   | string     | null: false       |
| delivery_municipality | string     | null: false       |
| delivery_address      | string     | null: false       |
| delivery_building     | string     |                   |
| phone_number          | integer    | null: false       |
| item                  | references | foreign_key: true |

### Association

- belongs_to :item