#テーブル設計

## users テーブル

| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| name         | string | null: false |
| kananame     | string | null: false |
| nickname     | string | null: false |
| email        | string | null: false |
| password     | string | null: false |
| phone_number | string | null: false |
| birth_date   | string | null: false |



### Association

- has_many :items
- has_one  :street_address

## items テーブル

| Column    | Type      | Options                        |
| --------- | --------- | -------------------------------|
| product   | string    | null: false                    |
| category  | string    | null: false                    |
| state     | string    | null: false                    |
| price     | string    | null: false                    |
| text      | text      | null: false                    |
| user      | references| null: false, foreign_key: true |



### Association

- has_one    :street_address
- belongs_to :user

## street_address テーブル

| Column        | Type    | Options     |
| ------------- | --------| ----------- |
| post_code     | string  | null: false |
| prefectures   | string  | null: false |
| municipality  | string  | null: false |
| address       | string  | null: false |
| building_name | string  | null: false |
| buyer         | string  | null: false |




### Association

- belongs_to :item
- belongs_to :user
