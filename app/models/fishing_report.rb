class FishingReport < ApplicationRecord

	belongs_to :user	
	# has_many :favorite,	dependent: :destroy
	has_many :favorites
	has_many	:reviews,	dependent: :destroy
	# has_many	:photos,	dependent: :destroy
	belongs_to	:lure_type	
	belongs_to	:fishing_spot	
  	# accepts_attachments_for :photos, attachment: :photo_image
  	attachment :f_photo
  	attachment :a_photo
		

	# 絞り込み検索時に使用するデータ（seedに入っているIDと内容を同じにすると使えるっぽい）
	# enum time: { JｰPOP: 1, 洋楽: 2, レゲエ: 3, ロック: 4, トランス: 5, アニメソング: 6, EDM: 7, 演歌: 8 }
	enum weather: { 快晴: 1, 晴れ: 2, 曇り: 3, 小雨: 4, 大雨: 5 } 
	enum lure_type: { トップウォーター: 1, バズベイト: 2, ミノー: 3, シャッド: 4, クランクベイト: 5, バイブレーション: 6, スピナーベイト: 7, ビックベイト: 8, メタル系: 9, "ラバージグ・スモラバ": 10, "ワーム（ソフトルアー）": 11, その他: 12 } 
	# enum range: { :低層: 1, 中層: 2, 表層: 3 } 
	# enum retrieve: { 早い: 1, 普通: 2, ゆっくり: 3, とてもゆっくり: 4, 放置: 5, その他: 6 } 

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end
end

