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
|email|string|null: false|
|encrypted_password|string|null: false|
|reset_password_token|string|null: false|
|reset_password_sent_at|string|null: false|
|remember_created_at|string|null: false|
|created_at|string|null: false|
|updated_at|string|null: false|
|nickname|string|null: false|
|profile_img|string|null: false|
|lastname|string|null: false|
|firstname|string|null: false|
|lastname_kana|string|null: false|
|firstname_kana|string|null: false|
|birthday|string|null: false|
|postal_code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building_name|string|null: false|
|phone_number|string|null: false|
### Association
- has_many :bought_items, foreign_key: ”buyer_id”, class_name: “Item”
- has_many :selling_items,->{where(“buyer_id is NULL”)}, foreign_key: ”seller_id”, class_name: “Item”
- has_many :sold_items, ->{where(“buyer_id is not NULL”)},foreign_key: ”seller_id”, class_name: “Item”

## postsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|image|string|null: false|
|description|text|null: false|
|cotegory|string|null: false|
|status|string|null: false|
|postage|string|null: false|
|ship_from|string|null: false|
|shipping_date|string|null: false|
|price|integer|null: false|
|delivery_fee|integer|null: false|
|saller_id|integer|null: false|
|buyer_id|integer|null: false|
### Association
- belongs_to :saler_id, class_name: “User”
- belongs_to :buyer, class_name: “User”

## buy_ordersテーブル
|Column|Type|Options|
|------|----|-------|
|saler|references|null: false, foreign_key: true|
|buyer|references|null: false, foreign_key: true|
|fee|references|null: false, foreign_key: true|
|sub_total|references|null: false, foreign_key: true|
|total_amount|references|null: false, foreign_key: true|
|created_at|references|null: false, foreign_key: true|
|update_at|references|null: false, foreign_key: true|
### Association
- 
- 


## sns_credentialsテーブル
|Column|Type|Options|
|------|----|-------|
|provider|references|null: false, foreign_key: true|
|uid|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|
### Association
- 
- 

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|saler|integer|
|buyer|integer|
|card_id|integer|
### Association
- 
- 


<!-- ## likesテーブル
|Column|Type|Options|
|------|----|-------|
|seller|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|

### Association
- 
-  -->

<!-- ## evaluationsテーブル
|Column|Type|Options|
|------|----|-------|
|seller|text|
|evaluations|string|
### Association
- 
-  -->

<!-- ## relationshipsテーブル
|Column|Type|Options|
|------|----|-------|
|seller|string|
|buyer|string|
### Association
- 
-  -->

<!-- ## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|content|text|
|image|string|
### Association
- 
-  -->

<!-- ## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user|integer|
|item|integer|
### Association
- 
-  -->

