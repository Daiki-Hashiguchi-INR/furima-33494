# README

## usersテーブル

| Column         | Type   | Options      |
| -------------- | ------ | -----------  |
| nickname       | string | null: false  |
| email          | string | null: false, unique: true, index: true |
| password       | string | null: false  |
| last_name      | string | null: false  |
| first_name     | string | null: false  |
| last_kana_name | string | null: false  |
| first_kane_name| string | null: false  |
| birthday_year  | date   | null: false  |
| birthday_month | date   | null: false  |
| birthday_day   | date   | null: false  |

### Association

- has_many :items
- has_many :orders

- belongs_to_active_hash :birthday_year
- belongs_to_active_hash :birthday_month
- belongs_to_active_hash :birthday_day

## itemsテーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| name             | string     | null: false |
| explain          | text       | null: false |
| category         | integer    | null: false |
| condition        | integer    | null: false |
| post_type        | integer    | null: false |
| prefecture       | integer    | null: false |
| preparation_day  | integer    | null: false |
| price            | integer    | null: false |
| user             | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :order

- has_one_attached :image

- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :post_type
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :preparation_day

## addressesテーブル

| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| post_number  | string     | null: false |
| prefecture   | integer    | null: false |
| city         | string     | null: false |
| address      | string     | null: false |
| building     | string     |             |
| phone_number | integer    | null: false |

### Association

- belongs_to :order
- belongs_to_active_hash :prefecture

## ordersテーブル

| Column   | Type       | Options           |
| -------- | ---------- | ----------------- |
| user     | references | foreign_key: true |
| item     | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :address
