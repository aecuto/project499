class NontrainerPackage < ApplicationRecord
	has_many :receipts
	has_many :staffs, through: :receipts
	has_many :trainer_packages, through: :receipts
	has_many :members

	validates_presence_of :name

end
