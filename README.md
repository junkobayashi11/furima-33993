#テーブル設計

## users テーブル

| Column       | Type   | Options                   |
| ------------ | ------ | ------------------------- |
| name         | string | null: false, unique: true |
| kananame     | string | null: false, unique: true |
| nickname     | string | null: false, unique: true |
| email        | string | null: false, unique: true |
| password     | string | null: false, unique: true |
| phone_number | string | null: false, unique: true |
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

| Column        | Type    | Options                   |
| ------------- | --------| ------------------------- |
| post_code     | string  | null: false, unique: true |
| prefectures   | string  | null: false, unique: true |
| municipality  | string  | null: false, unique: true |
| address       | string  | null: false, unique: true |
| building_name | string  | null: false, unique: true |
| buyer         | string  | null: false |




### Association

- belongs_to :item
- belongs_to :user
