require 'rspec'
require_relative '../model/asteroide'
require_relative '../model/objeto_espacial'

describe 'Asteroide' do

  it 'deberia retornar 100 cuando hago obtener_vida de un asteoroide nuevo' do
    asteroide = Asteroide.new(100, 0)
    expect(asteroide.obtener_vida).to eq 100
  end

  it 'deberia retornar 100 cuando hago obtener_masa de un asteroide nuevo' do
    asteroide = Asteroide.new(100,100)
    expect(asteroide.obtener_masa).to eq 100
  end

  it 'deberia retornar asteroide cuando hago obtener_nombre' do
    asteroide = Asteroide.new(10,10)
    expect(asteroide.obtener_nombre).to eq "asteroide"
  end
  
  it 'deberia retornar 100 cuando hago chocar_con(asteroide)' do
    asteroide = Asteroide.new(100,100)
    asteroide1 = Asteroide.new(100,100)
    asteroide.mapa_efectos
    expect(asteroide.chocar_con(asteroide1)).to eq 100
  end

  it 'deberia retornar 100 cuando hago chocar_con(bomba)' do
    asteroide = Asteroide.new(100,100)
    bomba = Bomba.new(100,100)
    asteroide.mapa_efectos
    expect(asteroide.chocar_con(bomba)).to eq 100
  end
end