class Progress < ApplicationRecord
  belongs_to :user
  enum business_category: {
      it: 0,
  }
  enum occupation_category: {
      programer: 0,
      comprehensive_work: 1,
  }
  enum status: {
      selection_in: 0,
      passing: 1,
      failure: 2,
  }
end
