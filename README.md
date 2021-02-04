#テーブル設計

## users テーブル

| Column       | Type   | Options                   |
| ------------ | ------ | ------------------------- |
| name         | string | null: false               |
| kananame     | string | null: false               |
| nickname     | string | null: false               |
| email        | string | null: false, unique: true |
| password     | string | null: false               |
| phone_number | string | null: false               |
| birth_date   | date   | null: false               |



### Association

- has_many :items
- has_one  :street_address
- has_many :buyers

## items テーブル

| Column      | Type      | Options                        |
| ----------- | --------- | -------------------------------|
| product     | string    | null: false                    |
| category_id | integer   | null: false                    |
| state_id    | integer   | null: false                    |
| price       | integer   | null: false                    |
| text        | text      | null: false                    |
| user_id     | references| null: false, foreign_key: true |



### Association

- has_one    :buyer
- belongs_to :user



## street_address テーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| post_code      | string  | null: false |
| prefectures_id | integer | null: false |
| municipality   | string  | null: false |
| address        | string  | null: false |
| building_name  | string  | null: false |




### Association

- belongs_to :buyer
- belongs_to :user



## buyers テーブル

| column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user_id        | references | null: false, foreign_key: true |
| items_id       | references | null: false, foreign_key: true |
| street_address | references | null: false, foreign_key: true |



### Association

- has_one    :street_address
- belongs_to :item
- belongs_to :user