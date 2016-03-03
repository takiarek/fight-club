require 'test_helper'

class SkillTest < ActiveSupport::TestCase
  def setup
    @fighter = fighters(:foo_fighter)
    @skill = @fighter.skills.build(name: "Smite", level: 3)
  end

  test "should be valid" do
    assert @skill.valid?
  end

  test "should have fighter id" do
    @skill.fighter_id = nil
    assert_not @skill.valid?
  end

  test "name should be present" do
    @skill.name = " "
    assert_not @skill.valid?
  end

  test "level should be present" do
    @skill.level = nil
    assert_not @skill.valid?
  end

  test "name should not be too long" do
    @skill.name = "x" * 21
    assert_not @skill.valid?
  end

  test "non-numeric level should be invalid" do
    @skill.level = "zero"
    assert_not @skill.valid?
  end

  test "level should be greater or equal 0" do
    @skill.level = -1
    assert_not @skill.valid?
  end

  test "level should be less or equal 5" do
    @skill.level = 6
    assert_not @skill.valid?
  end
end
