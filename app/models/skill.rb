class Skill < ActiveRecord::Base
  belongs_to :fighter
  validates :fighter_id, presence: true
  validates :name, :level, presence: true, length: { maximum: 20 }
  validates :level, numericality: { only_integer: true,
                                    greater_than_or_equal_to: 0,
                                    less_than_or_equal_to: 5 }
  #validates :skills_quantity TODO: validate skills quantity (uncomment test)

  private
    def skills_quantity
      fighter = Fighter.find(fighter_id)
      skills_quantity = fighter.skills.count
      if skills_quantity >= 9
        errors.add(:skills_quantity, "can't be more than 9")
      end
    end
end
