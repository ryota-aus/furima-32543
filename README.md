## users テーブル

| Column             | Type       | Options                   |
| ---------          | ------     | ----------------------    |
| nickname           | string     | null: false               |
| email              | string     | null: false, unique: true |
| encrypted_password | string     | null: false               |
| first_name         | string     | null: false               |
| last_name          | string     | null: false               |
| first_name_kana    | string     | null: false               |
| last_name_kana     | string     | null: false               |
| birth_day          | date       | null: false               |



### Association

- has_many :items
- has_many :purchase_records
- 

## items テーブル

| Column              | Type       | Options                        |
| ---------           | ------     | ----------------------         |
| name                | string     | null: false                    |
| description         | string     | null: false                    |
| category_id         | string     | null: false                    |
| condition_id        | string     | null: false                    |
| shipping_charges_id | string     | null: false                    |
| delivery_area_id    | string     | null: false                    |
| delivery_days_id    | string     | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association


- belongs_to :user
- has_one :purchase_record




## buyer_addresses テーブル

| Column           | Type       | Options                        |
| ---------        | ------     | ----------------------         |
| address          | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| house_number     | string     | null: false                    |
| build            | string     |                                |
| phone_number     | string     | null: false                    |
| purchase_record  | references | null: false, foreign_key: true |


### Association

- belongs_to :purchase_record
- 



## purchase_records テーブル

| Column       | Type       | Options                        |
| -------      | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association


- has_one    :buyer_address
- belongs_to :item
- belongs_to :user

