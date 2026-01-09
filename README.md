## usersテーブル

|Column    |Type   |Options    |
|nickname  |strings|null: false|
|email     |strings|null: false|
|password  |strings|null: false|
|name      |strings|null: false|
|first_name|strings|null: false|
|last_name |strings|null: false|
|birthday  |integer|null: false|

## itemsテーブル

|Column               |Type      |Option                  |
|name                 |strings   |null: false             |
|description          |text      |null: false             |
|price                |integer   |null: false             |
|condition_description|integer   |null: false             |
|shipping_description |integer   |null: false             |
|user                 |references|null: false, foreign_key|

## comments

|Column |Type      |Option                  |
|content|text      |null: false             |
|user   |references|null: false, foreign_key|
|item   |references|null: false, foreign_key|