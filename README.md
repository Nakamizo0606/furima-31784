# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | not null    |
| email            | string | not null    |
| password         | string | not null    |
| last_name        | string | not null    |
| first_name       | string | not null    |
| last_name_kana   | string | not null    |
| first_name_kana  | string | not null    |
| birthday         | date   | not null    |

### Association
- has_many   :  items
- has_many   :  addresses


## items テーブル

| Column                      | Type         | Options           |
| ----------------------------| ------------ | ----------------- |
| image                       | ActiveStorage| not null          |
| item_name                   | string       | not null          |
| item_info                   | text         | not null          |
| item_category_id            | integer      | not null          |
| item_sales_status_id        | integer      | not null          | 
| item_shipping_fee_status_id | integer      | not null          |
| item_prefecture_id          | integer      | not null          |
| item_scheduled_delivery_id  | integer      | not null          |
| item_price                  | integer      | not null          |
| user_id                     | references   | foreign_key: true |

### Association
- belongs_to :  user
- has_one    :  purchase

## addresses テーブル

| Column       | Type         | Options                        |
| ------------ | -------------| ------------------------------ |
| postal_code  | string       | not null                       |
| prefectures  | string       | not null                       |
| municipality | string       | not null                       |
| house_namber | string       | not null                       |
| building_name| string       |                                |
| phone_number | string       | not null                       |

### Association
- belongs_to : purchase

## purchases テーブル

| Column   | Type         | Options           |
| -------- | -------------| ------------------|
| user_id  | references   | foreign_key: true |
| item_id  | references   | foreign_key: true |

### Association
- belongs_to :  item
- has_one    :  address