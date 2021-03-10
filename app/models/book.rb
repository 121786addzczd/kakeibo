class Book < ApplicationRecord
  with_options presence: true do
    validates:year
    validates:month
    validates:inout
    validates:category
    validates:amount
  end

  enum inout: { "収入": 1, "支出": 2 }

end
