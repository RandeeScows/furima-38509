# テーブル設計


## Users テーブル
|Column        |Type    |Options                  |
|--------------|--------|-------------------------|
|nickname      |string  |null: false              |
|email         |string  |null: false, unique: true|
|password      |string  |null: false              |
|name          |string  |null: false              |
|phonetic      |string  |null: false              |
|birthday      |datetime|null: false              |

### Association
has_many :items
has_many :addresses
has_many :orders



## Items テーブル
|Column               |Type       |Options                       |
|---------------------|-----------|------------------------------|
|name                 |string     |null: false                   |
|price                |integer    |null: false                   |
|description          |text       |null: false                   |
|user                 |references |null: false, foreign_key: true|
|category_id          |integer    |null: false                   |
|condition_id         |integer    |null: false                   |
|shipping_cost_on_id  |integer    |null: false                   |
|origin_id            |integer    |null: false                   |
|lead_time_id         |integer    |null: false                   |
|like                 |integer    |                              |
|report_id            |integer    |                              |

### Association
belongs_to :user
has_one :order



## Addresses テーブル
|Column           |Type       |Options                       |
|-----------------|-----------|------------------------------|
|zip_code         |string     |null: false| 
|prefecture_id    |integer    |null: false|
|township         |string     |null: false|
|block            |string     |null: false|
|building         |string     |null: false|
|tel              |integer    |null: false|
|user             |references |null: false, foreign_key: true|

### Association
belongs_to :user
has_many :orders



## Orders テーブル
|Column           |Type       |Options                        |
|-----------------|-----------|-------------------------------|
|item             |references |null: false, foreign_key: true |
|address          |references |null: false, foreign_key: true |
|buyer            |references |null: false, foreign_key: true |
|seller           |references |null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :item
