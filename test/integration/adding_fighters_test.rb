require 'test_helper'

class AddingFightersTest < ActionDispatch::IntegrationTest
  test "adding fighter with invalid information" do
    get new_fighter_path
    assert_no_difference 'Fighter.count' do
      post fighters_path, fighter: {fname: " "}
    end
    assert_template 'fighters/new'
  end

  test "adding fighter with valid information" do
    get new_fighter_path
    assert_difference 'Fighter.count', 1 do
      post fighters_path, fighter: {fname: "James", lname: "Bond",
                                    description: ""}
    end
    follow_redirect!
    assert_template 'fighters/show'
  end
end
