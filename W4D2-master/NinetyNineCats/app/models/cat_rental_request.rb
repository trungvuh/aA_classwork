STATUS = %w(APPROVED DENIED PENDING)

class CatRentalRequest < ApplicationRecord
  validates :status, inclusion: { in: STATUS }
  validates :cat_id, :start_date, :end_date, :status, presence: true

  belongs_to :cat, foreign_key: :cat_id

end
