require 'test_helper'

class FighterTest < ActiveSupport::TestCase
  def setup
    @fighter = Fighter.new(fname: "Foo", lname: "Fighter",
                           description: "Mysterious aerial phenomena.")
  end

  test "valid fighter should be valid" do
    assert @fighter.valid?
  end

  test "fighter should have a first name" do
    @fighter.fname = " "
    assert_not @fighter.valid?
  end

  test "fighter should have a last name" do
    @fighter.lname = " "
    assert_not @fighter.valid?
  end

  test "description should not be required" do
    @fighter.description = " "
    assert @fighter.valid?
  end

  test "first name shoud not be too long" do
    @fighter.fname = "x" * 21
    assert_not @fighter.valid?
  end

  test "last name shoud not be too long" do
    @fighter.lname = "x" * 21
    assert_not @fighter.valid?
  end

  test "description shoud not be too long" do
    @fighter.lname = "x" * 201
    assert_not @fighter.valid?
  end

  # TODO: test case sensitivity
  test "no two fighters should have identical first and last name" do
    agent1 = Fighter.new(fname: "Agent", lname: "Smith")
    agent2 = agent1.dup
    agent1.save
    assert_not agent2.valid?
  end
end
