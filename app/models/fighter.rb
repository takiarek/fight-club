class Fighter < ActiveRecord::Base
  has_many :skills, dependent: :destroy
  has_many :wins, class_name: "Fight", foreign_key: "winner_id"
  has_many :losses, class_name: "Fight", foreign_key: "loser_id"
  validates :fname, :lname, presence: true, length: { maximum: 20 }
  validates :fname, uniqueness: { scope: :lname } # TODO: make validation case insensitive
  validates :description, length: { maximum: 200 }
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end
