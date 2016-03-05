class Fight < ActiveRecord::Base
  belongs_to :winner, class_name: "Fighter", counter_cache: :wins_count
  belongs_to :loser, class_name: "Fighter"
  validates :winner_id, :loser_id, presence: true
end
