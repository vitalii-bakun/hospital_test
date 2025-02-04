class Patient < ApplicationRecord
  belongs_to :user

  has_many :doctor_patients
  has_many :doctors, through: :doctor_patients

  validates_with UserExistsValidator, on: :create

  extend SelectData

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at id id_value updated_at user_id]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[doctor_patients doctors user]
  end
end
