class Admin::Site < ApplicationRecord
  has_one_attached :logo
  validate :logo_type_and_size
  validates :title, presence: { message: "não pode ficar em branco" }, uniqueness: { message: "já está em uso" }
  validates :cnpj,  presence: { message: "não pode ficar em branco" }, uniqueness: { message: "já está em uso" }

  validate  :logo_must_be_present

  def logo_must_be_present
    errors.add(:logo, "é obrigatório") unless logo.attached?
  end

  def logo_type_and_size
    return unless logo.attached?

    if !logo.content_type.in?(%w(image/png image/jpeg image/jpg image/svg+xml))
      logo.purge # apaga o arquivo errado
      errors.add(:logo, "deve ser uma imagem PNG, JPG ou SVG")
    end

    if logo.byte_size > 3.megabytes
      logo.purge
      errors.add(:logo, "não pode ter mais que 3 MB")
    end
  end
end
