class BannerIntroduce < ApplicationRecord
  validates :title, :little_title, :description, presence: true

end
