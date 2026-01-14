## usersテーブル

|Column         |Type   |Options    |
|nickname       |strings|null: false|
|email          |strings|null: false|
|password       |strings|null: false|
|name           |strings|null: false|
|first_name     |strings|null: false|
|last_name      |strings|null: false|
|first_name_kana|strings|null: false|
|last_name_kana |strings|null: false|
|birthday       |date   |null: false|

### Association

has_many :items
has_many :buy

## itemsテーブル

|Column                  |Type      |Option                  |
|name                    |strings   |null: false             |
|description             |text      |null: false             |
|price                   |integer   |null: false             |
|condition_description_id|integer   |null: false             |
|category_id             |integer   |null: false             |
|shipping_day_id         |integer   |null: false             |
|prefectures_id          |integer   |null: false             |
|shipping_prise_id       |integer   |null: false             |
|user                    |references|null: false, foreign_key|

### Association
belongs_to :user
has_one :buy


## buysテーブル

|Colum|Type      |Option                  |
|user |references|null: false, foreign_key|
|item |references|null: false, foreign_key|

### Association
belongs_to :user
belongs_to :item
has_one :destination

## destinationsテーブル

|Colum           |Type      |Option                  |
|postal_code     |strings   |null: false             |
|prefectures_id  |integer   |null: false             |
|municipalities  |strings   |null: false             |
|street_address  |strings   |null: false             |
|building_name   |strings   |                        |
|telephone_number|strings   |null: false             |
|buy             |references|null: false, foreign_key|

### Association
belongs_to :buy