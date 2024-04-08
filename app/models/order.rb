class Order < ApplicationRecord

  include ActiveModel::Model
  attr_accessor :hoge,:fuga...

    
  belongs_to :user
  belongs_to :item
  has_one :addresse

  # ここにバリデーションの処理を書く(不要)

  def save
    # 各テーブルにデータを保存する処理を書く
  end
end




