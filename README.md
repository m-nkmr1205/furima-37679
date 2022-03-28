# テーブル設計

## usersテーブル
| Column      | Type      | Options                    | 
|-------------|-----------|----------------------------|
| nickname    | string    | null: false                |
| email       | string    | null: false, unique: true  |
| password    | string    | null: false                | 

### Association 
- has_many :items
- has_many :purchase records


## itemsテーブル
| Column           | Type        | Option                          |
|------------------|-------------|---------------------------------|
| item name        | string      | null: false                     |
| description      | text        | null: false                     |
| category         | string      | null: false                     |
| condition        | string      | null: false                     |
| delivery charge  | string      | null: false                     |
| shipping area    | string      | null: false                     |
| day to ship      | string      | null: false                     |
| price            | integer     | null: false                     |
| commission       | integer     | null: false                     |
| profit           | integer     | null: false                     |
| users_id         | references  | null: false, foreign_key: true  |

### Association
- belongs_to :user
- has_one :purchase record


## purchase recordsテーブル
|Column       | Type         | Option             |
|-------------|--------------|--------------------|
| users_id    | references   | foreign_key: true  |
| items_id    | references   | foreign_key: true  |

### Association
- has_many :users
- belongs_to :items
- has_one :shipping information


##　shipping informationsテーブル
| Column          | Type         | Option             |
|-----------------|--------------|--------------------|
| post code       | integer      | null: false        | 
| prefectures     | text         | null: false        |
| municipulities  | text         | null: false        | 
| block number    | integer      | null: false        |
| building name   | text         |                    |
| phon number     | integer      | null: false        |
| purchase_id     | references   | foreign_key: true  |

### Association
- belongs_to :purchase records
