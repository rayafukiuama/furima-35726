## usersテーブル

| Column           |  Type      | Options                        |
| ------           | ---------- | ------------------------------ |
| nickname         | string     | null: false                    |
| email            | string     | null: false,unique: true       |
| password         | string     | null: false                    |
| last_name_kanji  | string     | null: false                    |
| first_name_kanji | string     | null: false                    |
| last_name_kana   | string     | null: false                    |
| first_name_kana  | string     | null: false                    |
| birthday         | date       | null: false                    |

### Association
* has_many :items
* has_many :purchase_users


## items テーブル

| Column        | Type       | Options                        |
| ------        | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| catch_copy    | text       | null: false                    |
| category_id   | integer    | null: false                    |
| condition_id  | integer    | null: false                    |
| burden_id     | integer    | null: false                    |
| area_id       | integer    | null: false                    |
| date_id       | integer    | null: false                    |
| price         | integer    | null: false                    |
| user          | references | foreign_key: true              |

### Association
- belongs_to :user
- has_one :purchase_user

## purchase_users テーブル

| Column       | Type       | Options                        |
| ------       | ---------- | ------------------------------ |
| user         | references | foreign_key: true              |
| item         | references | foreign_key: true              |

### Association
- belongs_to :user
- has_one :address
- has_one :item

## addresses テーブル

| Column        | Type       | Options                        |
| ------        | ---------- | ------------------------------ |
| purchase_user | references | foreign_key: true              |
| postcode      | string     | null: false                    |
| area_id       | integer    | null: false                    |
| city          | string     | null: false                    |
| block         | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |

### Association
- has_one :purchase_user