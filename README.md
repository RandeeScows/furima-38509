# テーブル設計


## users テーブル

|Column        |Type    |Options                  |
|--------------|--------|-------------------------|
|name          |string  |null: false              |
|email         |string  |null: false, unique: true|
|nickname      |string  |null: false, unique: true|
|password      |string  |null: false              |
|address       |string  |null: false              |
|birthday      |datetime|null: false              |

### Association

has_many :items
has_many :comments
has_many :favorites
has_many :reports
has_many :comments


## items テーブル

|Column           |Type       |Options                       |
|-----------------|-----------|------------------------------|
|name             |string     |null: false                   |
|price            |integer    |null: false                   |
|shipping_cost_on |string     |null: false                   |
|description      |text       |null: false                   |
|user             |references |null: false, foreign_key: true|
|condition        |string     |null: false                   |
|shipped_from     |string     |null: false                   |
|lead_time        |string     |null: false                   |
|category         |string     |null: false                   |
|sold_out         |boolean    |null: false                   |

### Association

belongs_to :user
has_many :comments
has_many :favorites
has_many :reports
has_many :comments


## comments テーブル

|Column           |Type       |Options                       |
|-----------------|-----------|------------------------------|
|comment          |text       |null: false                   |
|created_at       |datetime   |null: false                   |
|user             |references |null: false, foreign_key: true|
|item             |references |null: false, foreign_key: true|


### Association
belongs_to :user
belongs_to :item



## shipping_addresses テーブル
|Column           |Type       |Options                       |
|-----------------|-----------|------------------------------|
|address          |string     |null: false                   |
|user             |references |null: false, foreign_key: true|


### Association
belongs_to :user



## favorites テーブル
|Column           |Type       |Options                       |
|-----------------|-----------|------------------------------|
|item             |references |null: false, foreign_key: true|
|user             |references |null: false, foreign_key: true|


### Association
belongs_to :user
belongs_to :item



## report_incompliant_items テーブル
|Column           |Type       |Options                       |
|-----------------|-----------|------------------------------|
|category         |string     |null: false                   |
|description      |text       |null: false                   |
|item             |references |null: false, foreign_key: true|
|user             |references |null: false, foreign_key: true|
|created_at       |datetime   |null: false                   |
|resolved_at      |datetime   |                              |

### Association
belongs_to :user
belongs_to :item
