require 'rspec'
require 'spec_helper'
require_relative '../model/nave'
require_relative '../model/misil'
require_relative '../model/objeto_espacial'

describe 'Nave' do
  it 'deberia retornar 100 cuando hago obtener_vida de una nave nueva' do
    nave = Nave.new(100, 0)
    expect(nave.obtener_vida).to eq 100
  end

  it 'deberia retornar 100 cuando hago obtener_masa de una nave nueva' do
    nave = Nave.new(100,100)
    expect(nave.obtener_masa).to eq 100
  end

  it 'deberia retornar nave cuando hago obtener_nombre' do
    nave = Nave.new(10,10)
    expect(nave.obtener_nombre).to eq Nave
  end

  it 'deberia retornar 0 cuando hago chocar_con(nave)' do
    nave = Nave.new(100,100)
    nave1 = Nave.new(100,100)
    nave.chocar_con(nave1)
    expect(nave.obtener_vida).to eq 0
  end

  it 'deberia retornar 20 cuando nave choca_con(misil)' do
    nave = Nave.new(100,100)
    misil = Misil.new(100,80)
    nave.chocar_con(misil)
    expect(nave.obtener_vida).to eq 20
  end

  it 'deberia retornar 30 cuando nave choca_con(bomba)' do
    nave = Nave.new(80,100)
    bomba = Bomba.new(100,80)
    nave.chocar_con(bomba)
    expect(nave.obtener_vida).to eq 30
  end

  it 'deberia retornar 0 cuando nave choca_con(bomba) y la nave tiene menos de 50 de vida' do
    nave = Nave.new(40,100)
    bomba = Bomba.new(100,80)
    nave.chocar_con(bomba)
    expect(nave.obtener_vida).to eq 0
  end
  
  it 'deberia retornar 50 cuando nave choca_con(asteroide)' do
    nave = Nave.new(100,100)
    asteroide = Asteroide.new(100,100)
    nave.chocar_con(asteroide)
    expect(nave.obtener_masa).to eq 50
  end
  
  it 'deberia retornar 280 cuando nave choca_con(estrella)' do
    nave = Nave.new(100,180)
    estrella = Estrella.new(100,100)
    nave.chocar_con(estrella)
    expect(nave.obtener_masa).to eq 280
  end

  it 'deberia retornar 0 cuando nave choca_con(nave1) nave1 pierde 100 unidades' do
    nave = Nave.new(100,80)
    nave1 = Nave.new(200,50)
    nave.chocar_con(nave1)
    expect(nave1.obtener_vida).to eq 100
  end

  it 'deberia retornar 200 cuando nave choca_con(misil) misil pierde 100 unidades' do
    nave = Nave.new(100,80)
    misil = Misil.new(300,50)
    nave.chocar_con(misil)
    expect(misil.obtener_vida).to eq 200
  end

  it 'deberia retornar 150 cuando nave choca_con(bomba) bomba pierde 100 unidades' do
    nave = Nave.new(100,80)
    bomba = Bomba.new(150,50)
    nave.chocar_con(bomba)
    expect(bomba.obtener_vida).to eq 50
  end
  
  it 'deberia retornar 150 cuando nave choca_con(asteroide) asteroide gana 10porc masa' do
    nave = Nave.new(100,100)
    asteroide = Asteroide.new(150,100)
    nave.chocar_con(asteroide)
    expect(asteroide.obtener_masa).to eq 110
  end

  it 'deberia retornar 0 cuando nave choca_con(estrella) estrella pierde 100porc de vida' do
    nave = Nave.new(100,100)
    estrella = Estrella.new(150,100)
    nave.chocar_con(estrella)
    expect(estrella.obtener_vida).to eq 0
  end

  it 'deberia retornar estado destruido si la vida de la nave llega a cero al chocar con otro objeto espacial' do
    nave = Nave.new(100,100)
    nave1 = Nave.new(100,100)
    nave.chocar_con(nave1)
    expect(nave.obtener_estado.mostrar).to eq "destruido"
  end
  
  it 'deberia retornar 120 cuando nave choca con un objeto espacial destruido' do
    nave = Nave.new(120,100)
    nave1 = Nave.new(0,100)
    nave.chocar_con(nave1)
    expect(nave.obtener_vida).to eq 120
  end
end