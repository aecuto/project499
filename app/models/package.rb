class Package < ApplicationRecord
  has_one :nontrainer_package
  accepts_nested_attributes_for :nontrainer_package

  has_one :trainer_package
  accepts_nested_attributes_for :trainer_package

  validates_presence_of :name
  validates_uniqueness_of :name
  validates :price, numericality: { other_than: 0 }


end
