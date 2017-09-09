class User < ApplicationRecord
  has_many :progresses, dependent: :destroy
end
