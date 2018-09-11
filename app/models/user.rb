class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  	
  	# Rails Devise で DB カラムに依存しない項目を追加する acceptance
  	validates :registration_check, acceptance: true, on: :create
  	
	has_many :fishing_reports	
	has_many :favorites,	dependent: :destroy
	has_many :reviews,	dependent: :destroy
	has_many :tackle_reports

	# ユーザーAがfollowすること(following)のみを考える。（１対多）
	# has_many :active_relationships,class_name:  "Relationship", foreign_key: "follower_id", dependent: :destroy
	# 次に、フォローされることのみを考える。(１対多)
	# has_many :active_relationships,class_name:  "Relationship", foreign_key: "following_id", dependent: :destroy
	# フォローしているユーザーの集団を取り出す
	# has_many :following, through: :active_relationships, source: :following
	# あるユーザーをフォローしている集団（フォロワー）を取り出す
	# has_many :followers, through: :passive_relationships, source: :follower

# フォロー、あんフォローボタンの作成
	  # ユーザーをフォローする
	  # def follow(other_user)
	    # active_relationships.create(following_id: other_user.id)
	  # end

	  # ユーザーをアンフォローする
	  # def unfollow(other_user)
	    # active_relationships.find_by(following_id: other_user.id).destroy
	  # end

	  # 現在のユーザーがフォローしてたらtrueを返す
	  # def following?(other_user)
	    # following.include?(other_user)
	  # end


	has_many :relationships, foreign_key: "follower_id", dependent: :destroy
	has_many :reverse_relationships, foreign_key: "followed_id", class_name: "Relationship", dependent: :destroy
	has_many :followed_users, through: :relationships, source: :followed
	has_many :followers, through: :reverse_relationships, source: :follower

  	# def email_required?
  	# 	false
  	# end
  	# def email_changed?
  	# 	false
  	# end

	# 現在のユーザーがフォローしてたらtrueを返す
  	def following?(other_user)
   		followed_users.include?(other_user)
  	end
	# ユーザーをフォローする
  	def follow!(other_user)
    	relationships.create!(followed_id: other_user.id)
  	end
 	# ユーザーをアンフォローする
  	def unfollow!(other_user)
    	relationships.find_by(followed_id: other_user.id).destroy
  	end

end


