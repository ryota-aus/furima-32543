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
- has_many :purcheses
- 

## items テーブル

| Column              | Type       | Options                        |
| ---------           | ------     | ----------------------         |
| name                | string     | null: false                    |
| description         | text       | null: false                    |
| category_id         | integer    | null: false                    |
| condition_id        | integer    | null: false                    |
| shipping_charges_id | integer    | null: false                    |
| prefecture_id       | integer    | null: false                    |
| delivery_days_id    | integer    | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association


- belongs_to :user
- has_one :purchese




## orders テーブル 住所情報保存テーブル

| Column           | Type       | Options                        |
| ---------        | ------     | ----------------------         |
| address          | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| house_number     | string     | null: false                    |
| build            | string     |                                |
| phone_number     | string     | null: false                    |
| purchese           | references | null: false, foreign_key: true |


### Association

- belongs_to :purchese
- 



## purchese テーブル  購入情報を保存するテーブル

| Column       | Type       | Options                        |
| -------      | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association


- has_one    :order
- belongs_to :item
- belongs_to :user



