# = codigo.rb
#
# Autor:: Edgar Figueroa González
# Asignatura::  Lenguajes y paradigmas de programación
# Grado:: Grado en Ingeniería Informática
#
# == Clase Alimento
#
# Definición de la clase Alimento compuesta por
# * modulo Comparable
# * metodo initialize
# * metodo <=>
# * metodo get_valor_kcal
# * metodo to_s
# * metodo impacto_hombre
# * metodo impacto_mujer
#

class Alimento
include Comparable

# Metodo que inicializa los atributos de un alimento
  def initialize(nombre, gei, terreno, hidratos, proteinas, lipidos)
    @nombre, @gei, @terreno, @hidratos, @proteinas, @lipidos = nombre, gei, terreno, hidratos, proteinas, lipidos
  end

	attr_reader :nombre,:gei,:terreno, :hidratos, :proteinas, :lipidos

# Metodo para poder comparar el valor energético entre alimentos
  def <=>(an0ther)
    get_valor_kcal() <=> an0ther.get_valor_kcal()
  end

  def get_nombre()
    @nombre
  end

  def get_gei()
    @gei
  end

  def get_terreno()
    @terreno
  end

  def get_hidratos()
    @hidratos
  end

  def get_proteinas()
    @proteinas
  end

  def get_lipidos()
    @lipidos
  end

# Metodo que calcula el valor energético (kcal) de un alimento
  def get_valor_kcal()
    hidratos_kcal = @hidratos * 4
    proteinas_kcal = @proteinas * 4
    lipidos_kcal = @lipidos * 9

    @valor_kcal = hidratos_kcal + proteinas_kcal + lipidos_kcal
    @valor_kcal.round(1)
  end

# Metodo que devuelve los atributos de un alimento de forma formateada
  def to_s()
    [@nombre, @gei, @terreno, @hidratos, @proteinas, @lipidos]
  end

# Metodo que devuelve el impacto ambiental diario para un hombre
  def impacto_hombre()
    impacto = (@valor_kcal / 3000.0) * 100.0
    impacto.round(2)
  end

# Metodo que devuelve el impacto ambiental diario para una mujer
  def impacto_mujer()
    impacto = (@valor_kcal / 2300.0) * 100.0
    impacto.round(2)
  end

end
