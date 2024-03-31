class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :profile_image
  has_many :books, dependent: :destroy

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/default-image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
  
    validates :name, 
      uniqueness: true,
      length: { in: 2..20 }
      
    validates :introduction,
      length: { maximum: 50 }

end

#name：一意性を持たせ、かつ2～20文字の範囲で設定してください。
#introduction：最大50文字までに設定してください。

#以下の処理の失敗時にエラーメッセージを表示させてください。エラーメッセージには、「error」の言葉が含まれるようにしてください。
#ユーザ新規登録→勝手に出るかな？
#ユーザのプロフィール情報更新