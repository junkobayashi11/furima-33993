#テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| frigana_first_name | string | null: false               |
| frigana_last_name  | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| birth_date         | date   | null: false               |



### Association

- has_many :items
- has_many :buyers

## items テーブル

| Column                 | Type      | Options                        |
| ---------------------- | --------- | -------------------------------|
| name                   | string    | null: false                    |
| category_id            | integer   | null: false                    |
| state_id               | integer   | null: false                    |
| prefecture_id          | integer   | null: false                    |
| shipping_charge_id     | integer   | null: false                    |
| date_shipment_id       | integer   | null: false                    |
| price                  | integer   | null: false                    |
| text                   | text      | null: false                    |
| shipment_prefecture_id | integer   | null: false                    |
| user                   | references| null: false, foreign_key: true |




### Association

- has_one    :buyer
- belongs_to :user



## street_addresses テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| post_code      | string     | null: false                    |
| municipality   | string     | null: false                    |
| address        | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| buyer          | references | null: false, foreign_key: true |




### Association

- belongs_to :buyer



## buyers テーブル

| column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |



### Association

- has_one    :street_address
- belongs_to :item
- belongs_to :user
