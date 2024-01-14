require 'rails_helper'

RSpec.describe Municipe.rb, type: :model do
  
  it 'nome é obrigatório' do
    municipe = Municipe.new(cpf: '12345678901', data_nascimento: Date.today)
    expect(municipe).not_to be_valid
    expect(municipe.errors[:nome]).to include("não pode ser nulo")
  end

  it 'CPF é obrigatório' do
    municipe = Municipe.new(nome: 'John Doe', data_nascimento: Date.today)
    expect(municipe).not_to be_valid
    expect(municipe.errors[:cpf]).to include("não pode ser nulo")
  end

  it 'data_nascimento é obrigatório' do
    municipe = Municipe.new(nome: 'John Doe', cpf: '12345678901')
    expect(municipe).not_to be_valid
    expect(municipe.errors[:data_nascimento]).to include("não pode ser nulo")
  end

  it 'cns é obrigatório' do
    municipe = Municipe.new(nome: 'John Doe', cpf: '12345678901', data_nascimento: Date.today, telefone: '11987654321')
    expect(municipe).not_to be_valid
    expect(municipe.errors[:cns]).to include("não pode ser nulo")
  end

  it 'telefone é obrigatório' do
    municipe = Municipe.new(nome: 'John Doe', cpf: '12345678901', data_nascimento: Date.today, cns: '123456789012345')
    expect(municipe).not_to be_valid
    expect(municipe.errors[:telefone]).to include("não pode ser nulo")
  end

end
