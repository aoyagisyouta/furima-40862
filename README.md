## usersテーブル

| Column            | Type       | Options      |
| ------            | ---------- |--------------|
| email             | string     | null: false, unique: true |
| encrypted_password| string     | null: false  |
| nickname          | string     | null: false  |
| kanji_last_name   | string     | null: false  |
| kanji_first_name  | string     | null: false  |
| kana_last_name    | string     | null: false  |
| kana_first_name   | string     | null: false  |
| birth_date        | date       | null: false  |


### Association 

- has_many   :items 
- has_many   :orders
- has_many   :purchases

## itemsテーブル 

| Column            | Type       | Options      |
| -------           | ---------- | ------------ |
| item_name         | string     | null: false  |
| item_info         | text       | null: false  |
| category_id       | integer    | null: false  |
| item_status_id    | integer    | null: false  |
| shipping_cost_id  | integer    | null: false  |
| prefecture_id     | integer    | null: false  |
| shipping_day_id   | integer    | null: false  |
| price             | integer    | null: false  |
| user              | references | null: false, foreign_key: true |


### Association 

- belongs_to :user
- has_one    :orders 
- has_many   :purchases

## ordersテーブル 

| Column            | Type       | Options      |
| -------           | ---------- | ------------ |
| postal_code       | string     | null: false  |
| prefecture_id     | integer    | null: false  |
| city              | string     | null: false  |
| house_number      | string     | null: false  |
| house_name        | string     |              |
| phone_number      | integer    | null: false  |
| item              | references | null: false, foreign_key: true |
| user              | references | null: false, foreign_key: true |

### Association 

- belongs_to :items
- belongs_to :user

## purchasesテーブル

| Column            | Type       | Options      |
| -------           | ---------- | ------------ |
| item              | references | null: false, foreign_key: true |
| user              | references | null: false, foreign_key: true |

### Association 

- belongs_to :items
- belongs_to :user