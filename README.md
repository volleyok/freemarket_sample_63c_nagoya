## データベース

### postsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|size_id|references|foreign_key: true|
|price|integer|null: false|
|status|integer|null: false|
|category_id|references|null: false, foreign_key: true|
|seller_id|references|null: false, foreign_key: { to_table: :users }|
|buyer_id|references|foreign_key: { to_table: :users }|
|brand_id|references|foreign_key: true|
|shipments|references|null: false, foreign_key: true|

#### Association
- has_many :images, dependent: :destroy
- accepts_nested_attributes_for :images, allow_destroy: true
- belongs_to :user
- belongs_to :category
- belongs_to :brand, optional: true
- belongs_to :area
- belongs_to :condition
- belongs_to :shipment

### shipmentsテーブル

|Column|Type|Options|
|------|----|-------|
|delivery_fee|integer|null: false|
|ship_from|references|null: false, foreign_key: true|
|ship_days|integer|null: false|
|shipping_method|integer|null: false|

#### Association
- has_many :posts

### brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

#### Association
- has_many :posts

### categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string||

#### Association
- has_many :posts
- has_many :brands

#### add_index
- add_index :ancestry

### areasテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

#### Association
- has_many :posts
- has_many :addresses

#### add_index
- add_index :areas, unique: true, length: 10

### usersテーブル

|Column|Type|Options|
|------|----|-------|
|email|string|null: false, default: ""|
|encrypted_password|string|null: false, default: ""|
|reset_password_token|string|null: false|
|reset_password_sent_at|datetime|null: false|
|remember_created_at|datetime|null: false|
|nickname|string|null: false,limit: 15|
|first_name|string|null: false,limit: 50|
|last_name|string|null: false,limit: 50|
|first_name_kana|string|null: false,limit: 50|
|last_name_kana|string|null: false,limit: 50|
|phone_number|integer|null: false,limit: 50, unique: true|
|birthday|date|null: false|
|icon|text||
|introduction|text||


#### Association
- has_many :posts
- has_many :comments
- has_one :address
- has_one :credit_card
- accepts_nested_attributes_for :user_address


#### add_index
- add_index :email, unique: true
- add_index :reset_password_token, unique: true

### sns_credentialsテーブル

|Column|Type|Options|
|------|----|-------|
|provider|string|null: false|
|uid|string|null: false, foreign_key: true|
|user_id|integer|null: false|

#### Association


### credit_cardsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|

#### Association
- belongs_to :user

### addressesテーブル

|Column|Type|Options|
|------|----|-------|
|first_name|string|null: false, limit: 50|
|last_name|string|null: false, limit: 50|
|first_name_kana|string|null: false, limit: 50|
|last_name_kana|string|null: false, limit: 50|
|postal_code|integer|null: false|
|area_id|references|foreign_key: true|
|city|string|null: false, limit: 20|
|address|string|null: false, limit: 20|
|building|string|limit: 50|
|phone_number|string|limit: 11|

#### Association
- belongs_to :user, inverse_of: :address
- belongs_to :area


### imagesテーブル

|Column|Type|Options|
|------|----|-------|
|post_id|references|null: false, foreign_key: true|
|image_url|text|null: false|

#### Association
- belongs_to :post

