class Municipe < ApplicationRecord
  require 'countries'
  has_one :address
  accepts_nested_attributes_for :address
  has_one_attached :photo


  ####### validates fields ###########
  validates :cns, presence: true, format: { with: /\A\d{15}\z/, message: "Deve ter 15 dígitos numéricos" }
  validates :cpf, presence: true
  validate :valid_cpf_format
  validates :birthday, presence: true
  validate :validate_birthday_before_today
  validates :email, presence: true, uniqueness: true, format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/, message: 'Formato inválido' }
    
  def valid_cns
      errors.add(:cns, "não é válido") unless cns_valido?(cns)
  end

  def valid_cpf_format
      return if cpf.blank?
  
      cpf_obj = CPF.new(cpf)
  
      unless cpf_obj.valid?
        errors.add(:cpf, "CPF digitado é inválido")
      end
  end

  def flag_emoji
      ISO3166::Country[country_code].emoji_flag
  end

  private
  def cns_valido?(cns)
    true
  end
  
  def validate_birthday_before_today
    return if birthday.blank?

    if birthday.present? && (birthday < Date.new(1900, 1, 1) || birthday > Date.current)
        errors.add(:birthday, "Data de nascimento inválida")
    end
  end
end
