class Book < ApplicationRecord
  with_options presence: true do
    validates:year
    validates:month
    validates:inout
    validates:category
    validates:amount
  end
end
