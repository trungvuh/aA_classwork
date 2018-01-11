require 'date'

COLOR = %w(white black brown yellow)

class Cat < ApplicationRecord

  validates :birth_date, :color, :name, :sex, presence: true
  validates :color, inclusion: { in: COLOR }
  validates :sex, inclusion: { in: %w(M F) }

  def age
    year = Date.today.year
    birth_year = birth_date.year

    year - birth_year
  end

  has_many :cat_rental_requests, foreign_key: :cat_id, dependent: :destroy

end
