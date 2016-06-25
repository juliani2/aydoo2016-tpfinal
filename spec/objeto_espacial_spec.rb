require 'rspec'
require_relative '../model/objeto_espacial'

describe 'ObjetoEspacial' do
  it 'deberia retornar 100 cuando hago obtener_vida de un objeto espacial' do
    objEspacial = ObjetoEspacial.new(100, 100)
    expect(objEspacial.obtener_vida).to eq 100
  end
    
  it 'deberia retornar 100 cuando hago obtener_masa de un objeto espacial' do
    objEspacial = ObjetoEspacial.new(100,100)
    expect(objEspacial.obtener_masa).to eq 100
  end
    
  it 'deberia retornar estado construido se crea el objeto espacial' do
    objEspacial = ObjetoEspacial.new(100,100)
    expect(objEspacial.obtener_estado.mostrar).to eq "construido"
  end

end