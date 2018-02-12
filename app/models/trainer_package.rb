class TrainerPackage < ApplicationRecord
  has_many :package_occupiedby
	has_many :members, through: :package_occupiedby
	
	belongs_to :package, optional: true, dependent: :destroy

  validates :session, numericality: { other_than: 0 }

	def name
		if self.package.name
			self.package.name
		end
	end


end
