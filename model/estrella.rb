require_relative '../model/objeto_espacial'

class Estrella < ObjetoEspacial
  
  def mapa_efectos
    @hash_map = {"estrella" => EfectoDestructivo.new(@vida), "asteroide" => EfectoDestructivo.new(@vida), "bomba" => EfectoDestructivo.new(@vida), "misil" => EfectoNulo.new(0), "nave" => EfectoDestructivo.new(@vida)}
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
    return "estrella"
  end
end