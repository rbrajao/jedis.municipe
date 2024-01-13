class Municipe < ApplicationRecord
  require 'countries'
  has_one :address
  accepts_nested_attributes_for :address
  has_one_attached :photo


  ####### validates fields ###########
  validate :validar_cns
  #validates :cns, presence: true, format: { with: /\A\d{15}\z/, message: "Deve ter 15 dígitos numéricos" }
  validates :cpf, presence: true
  validate :valid_cpf_format
  validates :birthday, presence: true
  validate :validate_birthday_before_today
  validates :email, presence: true, uniqueness: true, format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/, message: 'Formato inválido' }

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
  
  def validate_birthday_before_today
    return if birthday.blank?

    if birthday.present? && (birthday < Date.new(1900, 1, 1) || birthday > Date.current)
        errors.add(:birthday, "Data de nascimento inválida")
    end
  end

  def validar_cns
    return unless cns.present?

    cns = self.cns.to_s.gsub(/[^\d]/, '')
    errors.add(:cns, "CNS inválido") unless validar_cns_formato(cns)

  end

  def validar_cns_formato(cns)
  return false unless cns.length == 15

  if cns[0].to_i == 1 || cns[0].to_i == 2


    pis = cns[0, 11]
    soma = (0..10).sum { |i| pis[i].to_i * (15 - i) }
    resto = soma % 11
    dv = 11 - resto

    dv = 0 if dv == 11

    if dv == 10
      soma = (0..10).sum { |i| pis[i].to_i * (15 - i) }
      resto = soma % 11
      dv = 11 - resto
      resultado = "#{pis}001#{dv.to_s}"
    else
      resultado = "#{pis}000#{dv.to_s}"
    end

    return cns == resultado

    
  elsif cns[0].to_i == 7 || cns[0].to_i == 8 || cns[0].to_i == 9
    
    soma = 0
    resto = 0

    (0..14).each do |i|
      peso = 15 - i
      soma += cns[i].to_i * peso
    end

    resto = soma % 11

    puts "resto: #{resto}"

    return resto == 0

  else
    # Números inválidos
    return false
  end
end
  
  
end
