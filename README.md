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

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|kana|string|null: false|
|profile_img|string|null: false|
|email|string|null: false|
|birth|integer|null: false|
|password|string|null: false|
|send-address|string|null: false, index: true|
|self-introduction|text|null: false, index: true|
### Association
- has_many :bought_items, foreign_key: ”buyer_id”, class_name: “Item”
- has_many :selling_items,->{where(“buyer_id is NULL”)}, foreign_key: ”seller_id”, class_name: “Item”
- has_many :sold_items, ->{where(“buyer_id is not NULL”)},foreign_key: ”seller_id”, class_name: “Item”

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|image|string|null: false|
|description|text|null: false|
|cotegory|string|null: false|
|status|string|null: false|
|postage|string|null: false|
|delivery_fee|integer|null: false|
|ship_from|string|null: false|
|shipping_date|date|null: false|
|price|integer|null: false|
|seller_id|integer|null: false|
|buyer_id|integer|null: false|
### Association
- belongs_to :seller_id, class_name: “User”
- belongs_to :buyer, class_name: “User”

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|seller|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|

### Association
- 
- 

## evaluationsテーブル
|Column|Type|Options|
|------|----|-------|
|seller|text|
|evaluations|string|
### Association
- 
- 

## relationshipsテーブル
|Column|Type|Options|
|------|----|-------|
|seller|string|
|buyer|string|
### Association
- 
- 

## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|content|text|
|image|string|
### Association
- 
- 

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user|integer|
|item|integer|
### Association
- 
- 

## evaluationsテーブル
|Column|Type|Options|
|------|----|-------|
|seller|integer|
|buyer|integer|
|card_id|integer|
### Association
- 
- 
