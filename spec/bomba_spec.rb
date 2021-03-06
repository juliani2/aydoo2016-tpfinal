require 'rspec'
require 'spec_helper'
require_relative '../model/dominio/bomba'
require_relative '../model/dominio/objeto_espacial'

describe 'Bomba' do
  it 'deberia retornar 100 cuando hago obtener_vida de una bomba nueva' do
    bomba = Bomba.new
    expect(bomba.obtener_vida).to eq 100
  end
  
  it 'deberia retornar 100 cuando hago obtener_masa de una bomba nueva' do
    bomba = Bomba.new
    expect(bomba.obtener_masa).to eq 100
  end
  
  it 'deberia retornar bomba cuando hago obtener_nombre' do
    bomba = Bomba.new
    expect(bomba.obtener_nombre).to eq Bomba
  end

  it 'deberia retornar 0 cuando hago chocar_con(bomba)' do
    bomba = Bomba.new
    bomba1 = Bomba.new
    bomba.chocar_con(bomba1)
    expect(bomba.obtener_vida).to eq 0
  end
  
  it 'deberia retornar 0 cuando bomba choca_con(nave)' do
    nave = Nave.new
    bomba = Bomba.new
    bomba.chocar_con(nave)
    expect(bomba.obtener_vida).to eq 0
  end

  it 'deberia retornar 50 cuando bomba choca_con(misil)' do
    misil = Misil.new
    bomba = Bomba.new
    bomba.chocar_con(misil)
    expect(bomba.obtener_vida).to eq 50
  end

  it 'deberia retornar 0 cuando bomba choca_con(asteroide)' do
    asteroide = Asteroide.new
    bomba = Bomba.new
    bomba.chocar_con(asteroide)
    expect(bomba.obtener_vida).to eq 0
  end

  it 'deberia retornar 0 cuando bomba choca_con(asteroide) diferencia de vida' do
    asteroide = Asteroide.new
    bomba = Bomba.new
    bomba.chocar_con(asteroide)
    expect(bomba.obtener_vida).to eq 0
  end

  it 'deberia retornar 100 cuando bomba choca_con(estrella)' do
    estrella = Estrella.new
    bomba = Bomba.new
    bomba.modificar_vida(200)
    bomba.chocar_con(estrella)
    expect(bomba.obtener_vida).to eq 100
  end
end