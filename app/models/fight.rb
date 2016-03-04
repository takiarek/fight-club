class Fight < ActiveRecord::Base
  belongs_to :winner, class_name: "Fighter"
  belongs_to :loser, class_name: "Fighter"
  validates :winner_id, :loser_id, presence: true
end
