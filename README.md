## users テーブル

| Column           | Type       | Options                   |
| ---------        | ------     | ----------------------    |
| nickname         | string     | null: false               |
| email            | string     | null: false, unique: true |
| password         | string     | null: false               |
| first_name       | string     | null: false               |
| last_name        | string     | null: false               |
| first_name_kana  | string     | null: false               |
| last_name_kana   | string     | null: false               |
| birth_day        | date       | null: false               |



### Association

- has_many :items
- has_many :purchase_records
- belongs_to :buyer_addresses

## items テーブル

| Column           | Type       | Options                        |
| ---------        | ------     | ----------------------         |
| image            |            |                                |
| name             | string     | null: false                    |
| description      | text       | null: false                    |
| category         | string     | null: false                    |
| condition        | string     | null: false                    |
| shipping_charges | string     | null: false                    |
| delivery_area    | string     | null: false                    |
| delivery_days    | string     | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association


- belongs_to :users
- has_one :purchase_records



## buyer_addresses テーブル

| Column           | Type       | Options                        |
| ---------        | ------     | ----------------------         |
| address          | string     |                                |
| prefectures      | integer    | null: false                    |
| city             | string     | null: false                    |
| house_number     | string     | null: false                    |
| build            | string     | null: false                    |
| phone_number     | string     | null: false                    |
| purchase_record  | references | null: false, foreign_key: true |


### Association

- belongs_to :purchase_records
- belongs_to :users



## purchase_records テーブル

| Column       | Type       | Options                        |
| -------      | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association

- has_one    :buyer_addresses
- belongs_to :items