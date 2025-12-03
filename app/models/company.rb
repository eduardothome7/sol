class Company < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :cnpj, presence: true, uniqueness: true
end
