# = platos.rb
#
# Autor:: Edgar Figueroa González
# Asignatura::  Lenguajes y paradigmas de programación
# Grado:: Grado en Ingeniería Informática
#
# == Clase Platos
#
# Definición de la clase Platos compuesta por
# * modulo Comparable
# * metodo initialize
# * metodo to_s
# * metodo porc_proteinas
# * metodo porc_lipidos
# * metodo porc_hidratos
# * metodo valor_calorico
# * metodo <=>
#
# == Clase PlatoHijo
#
# Definición de la clase PlatoHijo compuesta por
# * modulo Comparable
# * metodo initialize
# * metodo gei_diario
# * metodo terreno
# * metodo eficiencia_energetica
# * metodo to_s
# * metodo <=>
# * metodo huellacarbono
# * metodo energia
# * metodo huella_nutricional
#


class Platos
include Comparable

  attr_reader :nombre, :alimentos, :gramos

# Metodo que inicializa los atributos que tiene un plato
  def initialize(nombre, alimentos, gramos)
    @nombre, @alimentos, @gramos = nombre, alimentos, gramos
  end

# Metodo que devuelve el nombre de un plato de forma formateada
  def to_s
    "Nombre del plato: #{@nombre}"
  end

# Metodo que calcula el porcentaje de proteinas correspondiente a un plato
  def porc_proteinas
    auxNodo = @alimentos.head
    auxNodo1 = @gramos.head
    porc_proteinas = 0
    while(auxNodo != nil && auxNodo1 != nil)
      porc_proteinas += (auxNodo.value.proteinas * auxNodo1.value) / 100
      auxNodo = auxNodo.next
      auxNodo1 = auxNodo1.next
    end
    return porc_proteinas.round(1)
  end

# Metodo que calcula el porcentaje de lipidos correspondiente a un plato
  def porc_lipidos
    auxNodo = @alimentos.head
    auxNodo1 = @gramos.head
    porc_lipidos = 0
    while(auxNodo != nil && auxNodo1 != nil)
      porc_lipidos += (auxNodo.value.lipidos * auxNodo1.value) / 100
      auxNodo = auxNodo.next
      auxNodo1 = auxNodo1.next
    end
    return porc_lipidos.round(1)
  end

# Metodo que calcula el porcentaje de hidratos correspondiente a un plato
  def porc_hidratos
    auxNodo = @alimentos.head
    auxNodo1 = @gramos.head
    porc_hidratos = 0
    while(auxNodo != nil && auxNodo1 != nil)
      porc_hidratos += (auxNodo.value.hidratos * auxNodo1.value) / 100
      auxNodo = auxNodo.next
      auxNodo1 = auxNodo1.next
    end
    return porc_hidratos.round(1)
  end

# Metodo que calcula el valor calorico correspondiente a un plato
  def valor_calorico
    auxNodo = @alimentos.head
    auxNodo1 = @gramos.head
    valor_calorico = 0
    while(auxNodo != nil && auxNodo1 != nil)
      valor_calorico += auxNodo.value.get_valor_kcal * auxNodo1.value
      auxNodo = auxNodo.next
      auxNodo1 = auxNodo1.next
    end
    return valor_calorico.round(1)
  end

# Metodo que se utiliza para comparar el valor calorico entre dos platos
  def <=>(an0ther)
    valor_calorico() <=> an0ther.valor_calorico()
  end
end

class PlatoHijo < Platos
include Comparable

attr_reader :nombre, :alimentos, :gramos

  def initialize (nombre, alimentos, gramos)
    super(nombre,alimentos,gramos)
  end

# Metodo que calcula el gei diario de un plato
  def gei_diario
   auxNodo = @alimentos.head
   auxNodo1 = @gramos.head
   geidiario = 0
   while(auxNodo != nil && auxNodo1 != nil)
     geidiario += (auxNodo.value.gei * auxNodo1.value)
     auxNodo = auxNodo.next
     auxNodo1 = auxNodo1.next
   end
   return geidiario.round(1)
  end

# Metodo que calcula la cantidad de uso de terreno de un plato
  def terreno
    auxNodo = @alimentos.head
    auxNodo1 = @gramos.head
    terreno = 0
    while(auxNodo != nil && auxNodo1 != nil)
      terreno += (auxNodo.value.terreno * auxNodo1.value)
      auxNodo = auxNodo.next
      auxNodo1 = auxNodo1.next
    end
    return terreno.round(1)
   end

# Metodo que calcula la eficiencia energetica de un plato
   def eficiencia_energetica
     auxNodo = @alimentos.head
     auxNodo1 = @gramos.head
     eficiencia_energetica = 0
     while(auxNodo != nil && auxNodo1 != nil)
       eficiencia_energetica += auxNodo.value.get_valor_kcal * auxNodo1.value
       auxNodo = auxNodo.next
       auxNodo1 = auxNodo1.next
     end
     return eficiencia_energetica.round(1)
   end

# Metodo que devuelve la eficiencia energetica de forma formateada
   def to_s
     "La eficiencia energetica formateada es: #{eficiencia_energetica}"
   end

# Metodo que se utiliza para comparar la eficiencia energetica de dos platos
   def <=>(an0ther)
     eficiencia_energetica() <=> an0ther.eficiencia_energetica()
   end

# Metodo que devuelve un valor (1,2,3) dependiendo de la cantidad gei_diario de un plato
   def huellacarbono
    if gei_diario < 800
      return 1
    end
    if gei_diario > 1200
      return 3
    else
      return 2
    end
   end

# Metodo que devuelve un valor (1,2,3) dependiendo de la cantidad de valor calorico de un plato
   def energia
     if valor_calorico < 670
       return 1
     end
     if valor_calorico > 830
      return 3
     else
       return 2
     end
   end

# Metodo que calcula la huella nutricional de un plato
   def huella_nutricional
     (huellacarbono + energia) / 2.0
   end
end
