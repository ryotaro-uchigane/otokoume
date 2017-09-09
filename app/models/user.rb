class User < ApplicationRecord
  has_many :progresses, dependent: :destroy
  enum sex: { male: 0, female: 1 }
  enum univ: {
      University_of_Oxford: 0,
      California_Institute_of_Technology: 1,
      Stanford_University: 2,
      University_of_Cambridge: 3,
      Harvard_University: 4,
  }
end
