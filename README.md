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

## users　テーブル

| Column            | Type    | Options     |
|-------------------|---------|-------------|
| nickname          | string  | null: false |
| emial             | string  | null: false |
| password          | string  | null: false |
| family_name       | string  | null: false |
| first_name        | string  | null: false |
| family_name_kana  | string  | null: false |
| first_name_kana   | string  | null: false |
| birthday          | data    | null: false |

### Association
- has_many  :items
- has_many  :purchases

## items　テーブル

| column            | type        | Options                        |
|-------------------|-------------|--------------------------------|
| name              | string      | null: false                    |
| text              | text        | null: false                    |
| price             | integer     | null: false                    |
| sold              | boolean     | default: false                 |
| user_id           | references  | null: false, foreign_key: true |
| category_id       | references  | null: false, foreign_key: true |
| condition_id      | references  | null: false, foreign_key: true |
| postage_id        | references  | null: false, foreign_key: true |
| prefecture_id     | references  | null: false, foreign_key: true |
| shipment_deley_id | references  | null: false, foreign_key: true |

### Association
- has_one                 :purchase
- belongs_to              :user
- belongs_to_active_hash  :category
- belongs_to_active_hash  :condition
- belongs_to_active_hash  :postage
- belongs_to_active_hash  :prefecture
- belongs_to_active_hash  :shipment_delay

## purchases　テーブル

| column          | type        | Options                        |
|-----------------|-------------|--------------------------------|
| postal_code     | string      | null: false                     |
| prefecture_id   | references  | null: false, foreign_key: true  |
| town            | string      | null: false                     |
| address         | string      | null: false                     |
| building        | string      | null: false                     |
| tel             | integer     | null: false                     |
| item_id         | references  | null: false, foreign_key: true  |
| user_id         | references  | null: false, foreign_key: true  |

### Association
- belongs_to              :item
- belongs_to              :user
- belongs_to_active_hash  :prefecture

## ActiveHash
| Name            | 内容                |
|-----------------|---------------------|
| categorys       | 商品カテゴリ        |
| conditions      | 商品コンディション  |
| postages        | 送料                |
| prefectures     | 都道府県            |
| shipment_delays | 発送                |

