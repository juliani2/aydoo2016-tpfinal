require_relative '../model/objeto_espacial'

class Bomba < ObjetoEspacial

  def mapa_efectos
  	@hash_map = { "bomba" => EfectoDestructivo.new(100), "nave" => EfectoDestructivo.new(100), "misil" => EfectoDestructivo.new(@vida/2), "asteroide" => EfectoDestructivo.new(@vida), "estrella" => EfectoDestructivo.new(100)}
  end
  
  def chocar_con(objeto_espacial)
  	mapa_efectos
  	objeto_espacial.mapa_efectos
  	objeto_espacial.recibe_choque_de(self)
    self.recibe_choque_de(objeto_espacial)
  end

  def recibe_choque_de(objeto_espacial)
    @hash_map[objeto_espacial.obtener_nombre].ejecutar_efecto(self,objeto_espacial)
  end
  
  def obtener_nombre
    return "bomba"
  end
end