## usersテーブル

|Column    |Type   |Options    |
|nickname  |strings|null: false|
|email     |strings|null: false|
|password  |strings|null: false|
|name      |strings|null: false|
|first_name|strings|null: false|
|last_name |strings|null: false|
|birthday  |date   |null: false|

## itemsテーブル

|Column               |Type      |Option                  |
|name                 |strings   |null: false             |
|description          |text      |null: false             |
|price                |integer   |null: false             |
|condition_description|integer   |null: false             |
|shipping_description |integer   |null: false             |
|category             |integer   |null: false             |
|shipping_day         |integer   |null: false             |
|shipping_address     |integer   |null: false             |
|shipping_prise       |integer   |null: false             |
|user                 |references|null: false, foreign_key|

## buyテーブル

|Colum|Type      |Option                  |
|user |references|null: false, foreign_key|
|item |references|null: false, foreign_key|

## destinationテーブル

|Colum           |Type      |Option                  |
|postal_code     |strings   |null: false             |
|prefectures     |integer   |null: false             |
|municipalities  |strings   |null: false             |
|street_address  |strings   |null: false             |
|building_name   |strings   |                        |
|telephone_number|strings   |null: false             |
|buy             |references|null: false, foreign_key|