# テーブル設計

## users テーブル

| Column               | Type   | Options     |
| -------------------- | ------ | ----------- |
| nickname             | string | not null    |
| email                | string | not null    |
| encrypted_password   | string | not null    |
| last_name            | string | not null    |
| first_name           | string | not null    |
| last_name_kana       | string | not null    |
| first_name_kana      | string | not null    |
| birthday             | date   | not null    |

### Association
- has_many   :  items
- has_many    :  purchase

## items テーブル

| Column                 | Type         | Options           |
| -----------------------| ------------ | ----------------- |
| name                   | string       | not null          |
| info                   | text         | not null          |
| category_id            | integer      | not null          |
| sales_status_id        | integer      | not null          | 
| shipping_fee_status_id | integer      | not null          |
| prefecture_id          | integer      | not null          |
| scheduled_delivery_id  | integer      | not null          |
| price                  | integer      | not null          |
| user                   | references   | foreign_key: true |

### Association
- belongs_to :  user
- has_one    :  purchase

## addresses テーブル

| Column          | Type         | Options                        |
| --------------- | -------------| ------------------------------ |
| postal_code     | string       | not null                       |
| prefectures_id  | integer      | not null                       |
| municipality    | string       | not null                       |
| house_namber    | string       | not null                       |
| building_name   | string       |                                |
| phone_number    | string       | not null                       |
| purchase        | references   | foreign_key: true              |


### Association
- belongs_to : purchase

## purchases テーブル

| Column   | Type         | Options           |
| -------- | -------------| ------------------|
| user     | references   | foreign_key: true |
| item     | references   | foreign_key: true |

### Association
- belongs_to :  item
- has_one    :  address
- belongs_to :  user