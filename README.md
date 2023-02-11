# テーブル設計

## Users テーブル
|Column             |Type    |Options                  |
|-------------------|--------|-------------------------|
|nickname           |string  |null: false              |
|email              |string  |null: false, unique: true|
|encrypted_password |string  |null: false              |
|family_name        |string  |null: false              |
|given_name         |string  |null: false              |
|phonetic_fn        |string  |null: false              |
|phonetic_gn        |string  |null: false              |
|birthday           |date    |null: false              |

### Association
has_many :items
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

### Association
belongs_to :user
has_one :order



## Addresses テーブル
|Column           |Type       |Options                       |
|-----------------|-----------|------------------------------|
|zip_code         |string     |null: false                   | 
|prefecture_id    |integer    |null: false                   |
|township         |string     |null: false                   |
|block            |string     |null: false                   |
|building         |string     |                              |
|tel              |string     |null: false                   |
|order            |references |null: false, foreign_key: true|

### Association
belongs_to :order



## Orders テーブル
|Column           |Type       |Options                        |
|-----------------|-----------|-------------------------------|
|item             |references |null: false, foreign_key: true |
|user             |references |null: false, foreign_key: true |
|address          |references |null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :item
has_one :address