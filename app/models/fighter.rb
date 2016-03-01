class Fighter < ActiveRecord::Base
  validates :fname, :lname, presence: true, length: {maximum: 20}
  validates :fname, uniqueness: {scope: :lname} # TODO: make validation case insensitive
  validates :description, length: {maximum: 200}
end
