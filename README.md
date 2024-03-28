# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...



# テーブル設計

## users テーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| name                | string | null: false |                     
| email               | string | null: false , unique: true |
| encrypted_password  | string | null: false |
| first_name_kanji    | string | null: false |
| family_name_kanji   | string | null: false |
| first_name_kana     | string | null: false |
| family_name_kana    | string | null: false |
| birth_days          | date   | null: false |

### Association

* has_many :items
* has_many :orders



## items テーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| image               | string     | null: false |
| name                | string     | null: false |
| description         | text       | null: false |
| category            | string     | null: false |
| condition           | string     | null: false |
| shipping_charge     | string     | null: false |
| shipment_source     | string     | null: false |
| shipping_day        | string     | null: false |
| price               | integer    | null: false |
| user                | references | null: false , foreign_key:true |

### Association

* belongs_to:users
* has_one:orders



## orders テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| postal_code   | string     | null: false |
| prefecture    | string     | null: false |
| city          | string     | null: false |
| address       | string     | null: false |
| building      | string     | null: false |
| phone_number  | string     | null: false |
| comment       | text       | null: false | 
| user          | references | null: false , foreign_key:true |
| item          | references | null: false , foreign_key:true |

### Association

* belongs_to:users
* belongs_to:items




