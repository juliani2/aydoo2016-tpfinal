require_relative '../model/objeto_espacial'

class Misil < ObjetoEspacial

  def mapa_efectos
    @hash_map = {"misil" => EfectoDestructivo.new(100), "nave" => EfectoDestructivo.new(100)}
  end

  def chocar_con(objeto_espacial)
  	 @hash_map[objeto_espacial.obtener_nombre].ejecutar_efecto(@vida)
  end

  def obtener_nombre
    return "misil"
  end

end