class Book < ApplicationRecord
    belongs_to :user

    validates :title, presence: true
    validates :body,
      presence: true,
      length: { maximum: 200 }
end

#title：空でないように設定してください。
#body：空でない、かつ最大200文字までに設定してください。