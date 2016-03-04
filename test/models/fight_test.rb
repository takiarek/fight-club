require 'test_helper'

class FightTest < ActiveSupport::TestCase
  def setup
    @fight = Fight.new(winner_id: 1, loser_id: 2)
  end

  test "should be valid" do
    assert @fight.valid?
  end

  test "should require winner_id" do
    @fight.winner_id = nil
    assert_not @fight.valid?
  end

  test "should require loser_id" do
    @fight.loser_id = nil
    assert_not @fight.valid?
  end
end
