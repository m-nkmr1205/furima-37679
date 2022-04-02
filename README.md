# テーブル設計

## usersテーブル
| Column                 | Type      | Options                    | 
|------------------------|-----------|----------------------------|
| nickname               | string    | null: false                |
| email                  | string    | null: false, unique: true  |
| encrypted_password     | string    | null: false                |
| last_name              | string    | null: false                |
| first_name             | string    |  null: false                |
| last_name_kana         | string    | null: false                |
| first_name_kana        | string    | null: false                |
| birth                  | date      | null: false,               |

### Association 
- has_many :items
- has_many :purchase_records


## itemsテーブル
| Column              | Type        | Option                          |
|---------------------|-------------|---------------------------------|
| item_name           | string      | null: false                     |
| description         | text        | null: false                     |
| category_id         | integer     | null: false, Activehash         |
| condition_id        | integer     | null: false, Activehash         |
| postage_type_id     | integer     | null: false, Activehash         |
| prefecture_id       | integer     | null: false, Activehash         |
| preparation_day_id  | integer     | null: false, Activehash         |
| price               | integer     | null: false                     |
| user                | references  | null: false, foreign_key: true  |

### Association
- belongs_to :user
- has_one :purchase_record
- has_one_attached :image


## purchase_recordsテーブル
|Column   | Type         | Option                          |
|---------|--------------|---------------------------------|
| user    | references   | null: false, foreign_key: true  |
| item    | references   | null: false, foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping_information


##　shipping_informationsテーブル
| Column          | Type         | Option                          |
|-----------------|--------------|---------------------------------|
| post_code       | string       | null: false                     | 
| prefecture_id   | integer      | null: false, Activehash         | 
| municipulities  | string       | null: false                     | 
| block_number    | string       | null: false                     |
| building_name   | string       |                                 |
| phone_number    | string       | null: false                     |
| purchase_record | references   | null: false, foreign_key: true  |

### Association
- belongs_to :purchase_record
