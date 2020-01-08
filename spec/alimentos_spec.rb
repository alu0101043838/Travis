#Alumno: Edgar Figueroa González

require 'spec_helper'

RSpec.describe Alimento do
  before :all do
    @carnevaca = Alimento.new('Vaca', 50.0, 164.0, 0.0, 21.1, 3.1)
    @chocolate = Alimento.new('Chocolate', 2.3, 3.4, 47.0, 5.3, 30.0)
    @tofu = Alimento.new('Tofu', 2.0, 2.2, 1.9, 8.0, 4.8)
    @lentejas = Alimento.new('Lentejas', 0.4, 3.4, 52.0, 23.5, 1.4)
    @nuez = Alimento.new('Nuez', 0.3, 7.9, 21.0, 20.0, 54.0)
  end

  context "Pruebas para alimentos" do
  it "Se almacena correctamente el nombre " do
    expect(@tofu.nombre).to eq('Tofu')
    expect(@chocolate.nombre).to eq('Chocolate')
    expect(@nuez.nombre).to eq('Nuez')
    expect(@carnevaca.nombre).to eq('Vaca')
    expect(@lentejas.nombre).to eq('Lentejas')
   end

  it "Se almacena correctamente la cantidad de GEI" do
    expect(@tofu.gei).to eq(2.0)
    expect(@chocolate.gei).to eq(2.3)
    expect(@nuez.gei).to eq(0.3)
    expect(@carnevaca.gei).to eq(50.0)
    expect(@lentejas.gei).to eq(0.4)
  end

  it "Se almacena correctamente la cantidad de terreno" do
    expect(@tofu.terreno).to eq(2.2)
    expect(@chocolate.terreno).to eq(3.4)
    expect(@nuez.terreno).to eq(7.9)
    expect(@carnevaca.terreno).to eq(164.0)
    expect(@lentejas.terreno).to eq(3.4)
  end

  it "Se almacena correctamente la cantidad de hidratos" do
    expect(@tofu.get_hidratos).to eq(1.9)
    expect(@chocolate.get_hidratos).to eq(47.0)
    expect(@nuez.get_hidratos).to eq(21.0)
    expect(@carnevaca.get_hidratos).to eq(0.0)
    expect(@lentejas.get_hidratos).to eq(52.0)
  end

  it "Se almacena correctamente la cantidad de proteinas" do
    expect(@tofu.get_proteinas).to eq(8.0)
    expect(@chocolate.get_proteinas).to eq(5.3)
    expect(@nuez.get_proteinas).to eq(20.0)
    expect(@carnevaca.get_proteinas).to eq(21.1)
    expect(@lentejas.get_proteinas).to eq(23.5)
  end

  it "Se almacena correctamente la cantidad de lipidos" do
    expect(@tofu.get_lipidos).to eq(4.8)
    expect(@chocolate.get_lipidos).to eq(30.0)
    expect(@nuez.get_lipidos).to eq(54.0)
    expect(@carnevaca.get_lipidos).to eq(3.1)
    expect(@lentejas.get_lipidos).to eq(1.4)
  end

  it "Valor energetico en kcal" do
    expect(@tofu.get_valor_kcal).to eq(82.8)
    expect(@chocolate.get_valor_kcal).to eq(479.2)
    expect(@nuez.get_valor_kcal).to eq(650.0)
    expect(@carnevaca.get_valor_kcal).to eq(112.3)
    expect(@lentejas.get_valor_kcal).to eq(314.6)
  end

  it "Alimento formateado" do
    expect(@tofu.to_s).to eq(['Tofu', 2.0, 2.2, 1.9, 8.0, 4.8])
    expect(@chocolate.to_s).to eq(['Chocolate', 2.3, 3.4, 47.0, 5.3, 30.0])
    expect(@nuez.to_s).to eq(['Nuez', 0.3, 7.9, 21.0, 20.0, 54.0])
    expect(@carnevaca.to_s).to eq(['Vaca', 50.0, 164.0, 0.0, 21.1, 3.1])
    expect(@lentejas.to_s).to eq(['Lentejas', 0.4, 3.4, 52.0, 23.5, 1.4])
  end

  it "Porcentaje del Impacto ambiental de un hombre" do
    expect(@tofu.impacto_hombre).to eq(2.76)
    expect(@chocolate.impacto_hombre).to eq(15.97)
    expect(@nuez.impacto_hombre).to eq(21.67)
    expect(@carnevaca.impacto_hombre).to eq(3.74)
    expect(@lentejas.impacto_hombre).to eq(10.49)
  end

  it "Porcentaje del Impacto ambiental de una mujer" do
    expect(@tofu.impacto_mujer).to eq(3.6)
    expect(@chocolate.impacto_mujer).to eq(20.83)
    expect(@nuez.impacto_mujer).to eq(28.26)
    expect(@carnevaca.impacto_mujer).to eq(4.88)
    expect(@lentejas.impacto_mujer).to eq(13.68)
  end
  end

context "Pruebas de comparacion <=> between" do
  it "Prueba de comparacion de dos alimentos <" do
    expect(@carnevaca < @chocolate).to eq(true)
  end

  it "Prueba de comparacion de dos alimentos >" do
    expect(@carnevaca > @chocolate).to eq(false)
  end

  it "Prueba de comparacion de dos alimentos ==" do
    expect(@carnevaca == @carnevaca).to eq(true)
  end

  it "Prueba de comparacion de dos alimentos <=" do
    expect(@carnevaca <= @chocolate).to eq(true)
  end

  it "Prueba de comparacion de dos alimentos >=" do
    expect(@carnevaca >= @chocolate).to eq(false)
  end

  it "Prueba de alimentos between" do
    expect(@lentejas.between?(@tofu, @nuez)).to eq(true)
  end

  it "Prueba de comparacion de dos alimentos <=>" do
    expect(@chocolate <=> @carnevaca).to eq(1)
    expect(@carnevaca <=> @chocolate).to eq(-1)
    expect(@carnevaca <=> @carnevaca).to eq(0)
  end
  end
end

RSpec.describe Listas do
  before :all do
    @lista = Listas.new()
    @node = Node.new(1,nil,nil)
    @dieta_espanola = Listas.new()
    @dieta_vasca = Listas.new()
    @dieta_vegetaria = Listas.new()
    @dieta_vegetaliana = Listas.new()
    @dieta_carne = Listas.new()
  end

  context "Metodos de la lista inicial de prueba " do
  it "Existe un nodo de la lista con su valor, su siguiente y su previo" do
    expect(@node).to have_attributes(:value => 1, :next => nil, :prev => nil)
  end

  it "Existe una lista con su cabeza y su cola" do
    expect(@lista).to have_attributes(:head => nil, :tail => nil)
  end

  it "Se puede insertar un elemento por la cabeza" do
    @lista.insert_head(1)
    expect(@lista.head.value).to eq(1)
  end

  it "Se puede insertar un elemento por la cola" do
    @lista.insert_tail(2)
    expect(@lista.tail.value).to eq(2)
  end

  it "Se pueden insertar varios elementos en la lista" do
    @lista.insert_elements([1,2])
    expect(@lista.head.value).to eq(1)
    expect(@lista.head.next.value).to eq(2)
  end

  it "Se puede extraer el nodo de la cabeza" do
    expect(@lista.extract_head).to eq(1)
  end

  it "Se puede extraer el nodo de la cola" do
    expect(@lista.extract_tail).to eq(2)
  end
  end

  context "Pruebas relacionadas con las dietas" do
  it "Introduciendo los alimentos en las diferentes listas" do
    @dieta_espanola.insert_head(Alimento.new('Chocolate', 2.3, 3.4, 47.0, 5.3, 30.0))
    @dieta_espanola.insert_head(Alimento.new('Nuez', 0.3, 7.9, 21.0, 20.0, 54.0))
    @dieta_vasca.insert_head(Alimento.new('Chocolate', 2.3, 3.4, 47.0, 5.3, 30.0))
    @dieta_vasca.insert_head(Alimento.new('Lentejas', 0.4, 3.4, 52.0, 23.5, 1.4))
    @dieta_vegetaria.insert_head(Alimento.new('Leche', 3.2, 8.9, 4.8, 3.3, 3.2))
    @dieta_vegetaria.insert_head(Alimento.new('Huevos', 4.2, 5.7, 1.1, 13.0, 11.0))
    @dieta_vegetaliana.insert_head(Alimento.new('Chocolate', 2.3, 3.4, 47.0, 5.3, 30.0))
    @dieta_vegetaliana.insert_head(Alimento.new('Nuez', 0.3, 7.9, 21.0, 20.0, 54.0))
    @dieta_vegetaliana.insert_head(Alimento.new('Lentejas', 0.4, 3.4, 52.0, 23.5, 1.4))
    @dieta_vegetaliana.insert_head(Alimento.new('Cafe', 0.4, 0.3, 0.0, 0.1, 0.0))
    @dieta_vegetaliana.insert_head(Alimento.new('Tofu', 2.0, 2.2, 1.9, 8.0, 4.8))
    @dieta_vegetaliana.insert_head(Alimento.new('Cerveza', 0.24, 0.22, 3.6, 0.5, 0.0))
    @dieta_carne.insert_head(Alimento.new('Pollo', 5.7, 7.1, 0.0, 20.6, 5.6))
    @dieta_carne.insert_head(Alimento.new('Cerdo', 7.6, 11.0, 0.0, 21.5, 6.3))
    @dieta_carne.insert_head(Alimento.new('Huevos', 4.2, 5.7, 1.1, 13.0, 11.0))
    @dieta_carne.insert_head(Alimento.new('Cafe', 0.4, 0.3, 0.0, 0.1, 0.0))
  end

  it "Emisiones diarias de GEI para cada dieta" do
    expect(@dieta_espanola.gei_diario).to eq(2.6)
    expect(@dieta_vasca.gei_diario).to eq(2.7)
    expect(@dieta_vegetaria.gei_diario).to eq(7.4)
    expect(@dieta_vegetaliana.gei_diario).to eq(5.6)
    expect(@dieta_carne.gei_diario).to eq(17.9)
  end

  it "Emisiones anuales de GEI para cada dieta" do
    expect(@dieta_espanola.gei_anual).to eq(949.0)
    expect(@dieta_vasca.gei_anual).to eq(985.5)
    expect(@dieta_vegetaria.gei_anual).to eq(2701.0)
    expect(@dieta_vegetaliana.gei_anual).to eq(2058.6)
    expect(@dieta_carne.gei_anual).to eq(6533.5)
  end

  it "Cantidad de terreno usado para cada dieta" do
    expect(@dieta_espanola.get_terreno).to eq(11.3)
    expect(@dieta_vasca.get_terreno).to eq(6.8)
    expect(@dieta_vegetaria.get_terreno).to eq(14.6)
    expect(@dieta_vegetaliana.get_terreno).to eq(17.4)
    expect(@dieta_carne.get_terreno).to eq(24.1)
  end
  end

  context "Pruebas para enumerar listas de alimentos utilizando collect,select,max,min,sort" do

    before :each do
      @lista_enumerable = Listas.new()
      @alimento1 = Alimento.new('Chocolate', 2.3, 3.4, 47.0, 5.3, 30.0)
      @alimento2 = Alimento.new('Nuez', 0.3, 7.9, 21.0, 20.0, 54.0)
      @lista_enumerable.insert_head(@alimento1)
      @lista_enumerable.insert_head(@alimento2)
    end

    it "Prueba para el método collect" do
      expect(@lista_enumerable.collect{|i| i.nombre}).to eq(['Nuez', 'Chocolate'])
    end

    it "Prueba para el método select" do
      expect(@lista_enumerable.select{|i| i.get_hidratos > 25.0}).to eq([@alimento1])
    end

    it "Prueba para el método max" do
      expect(@lista_enumerable.max).to eq(@alimento2)
    end

    it "Prueba para el método min" do
      expect(@lista_enumerable.min).to eq(@alimento1)
    end

    it "Prueba para el método sort" do
      expect(@lista_enumerable.sort).to eq([@alimento1,@alimento2])
    end
  end
end

RSpec.describe Platos do
  before :all do
    @conj_alimentos = Listas.new()
    @gramos = Listas.new
    @conj_alimentos.insert_head(Alimento.new('Vaca', 50.0, 164.0, 0.0, 21.1, 3.1))
    @conj_alimentos.insert_head(Alimento.new('Lentejas', 0.4, 3.4, 52.0, 23.5, 1.4))
    @conj_alimentos.insert_head(Alimento.new('Nuez', 0.3, 7.9, 21.0, 20.0, 54.0))
    @gramos.insert_head(100.0)
    @gramos.insert_head(50.0)
    @gramos.insert_head(15.0)
    @plato1 = Platos.new("PrimerPlato",@conj_alimentos,@gramos)
  end

context "Información nutricional de los platos de un menú de una dieta" do

  it "Obteniendo el nombre de un plato" do
    expect(@plato1.nombre).to eq('PrimerPlato')
  end

  it "Existe un conjunto de alimentos" do
    expect(@plato1.alimentos).not_to eq(nil)
  end

  it "Existe un conjunto de cantidades de alimentos en gramos" do
    expect(@plato1.gramos).not_to eq(nil)
  end

  it "Porcentaje de proteinas" do
    expect(@plato1.porc_proteinas).to eq(35.9)
  end

  it "Porcentaje de lipidos" do
    expect(@plato1.porc_lipidos).to eq(11.9)
  end

  it "Porcentaje de hidratos" do
    expect(@plato1.porc_hidratos).to eq(29.2)
  end

  it "Valor Calorico total" do
    expect(@plato1.valor_calorico).to eq(36710.0)
  end

  it "Plato formateado" do
    expect(@plato1.to_s).to eq("Nombre del plato: PrimerPlato")
  end
 end
end

RSpec.describe PlatoHijo do
  before :all do
    @conj_alimentos = Listas.new()
    @gramos = Listas.new()
    @conj_alimentos.insert_head(Alimento.new('Pollo', 5.7, 7.1, 0.0, 20.6, 5.6))
    @conj_alimentos.insert_head(Alimento.new('Cerdo', 7.6, 11.0, 0.0, 21.5, 6.3))
    @conj_alimentos.insert_head(Alimento.new('Cerveza', 0.24, 0.22, 3.6, 0.5, 0.0))
    @gramos.insert_head(100.0)
    @gramos.insert_head(50.0)
    @gramos.insert_head(5.0)
    @plato2 = PlatoHijo.new("SegundoPlato",@conj_alimentos,@gramos)
  end

  context "Pruebas para la clase Hijo" do

    it "Valor total de las emisiones diarias de gei" do
      expect(@plato2.gei_diario).to eq(951.2)
    end

    it "Estimacion de los metros cuadrados de terreno" do
      expect(@plato2.terreno).to eq(1261.1)
    end

    it "Eficiencia energética formateada" do
      expect(@plato2.to_s).to eq("La eficiencia energetica formateada es: 20497.0")
    end

    it "Comprobar la clase de un objeto, el tipo de un objeto y su pertenecia a una jerarquı́a" do
      expect(@plato2.class == PlatoHijo).to eq(true)
      expect(@plato2.class == Platos).to eq(false)
      expect(@plato2.class == Object).to eq(false)
      expect(@plato2.class == BasicObject).to eq(false)
      expect(@plato2.is_a?PlatoHijo).to eq(true)
      expect(@plato2.is_a?Platos).to eq(true)
      expect(@plato2.is_a?Object).to eq(true)
      expect(@plato2.is_a?BasicObject).to eq(true)
      expect(@plato2.instance_of?PlatoHijo).to eq(true)
      expect(@plato2.instance_of?Platos).to eq(false)
      expect(@plato2.instance_of?Object).to eq(false)
      expect(@plato2.instance_of?BasicObject).to eq(false)
  end
  end

  context "Pruebas de comparacion clase PlatoHijo" do
    before :all do
      @dietaespañola = Listas.new()
      @gramos1 = Listas.new()
      @dietavasca = Listas.new()
      @gramos2 = Listas.new()
      @dietavegetaria = Listas.new()
      @gramos3 = Listas.new()
      @dietavegetaliana = Listas.new()
      @gramos4 = Listas.new()
      @dietacarne = Listas.new()
      @gramos5 = Listas.new()

      @dietaespañola.insert_head(Alimento.new('Chocolate', 2.3, 3.4, 47.0, 5.3, 30.0))
      @dietaespañola.insert_head(Alimento.new('Nuez', 0.3, 7.9, 21.0, 20.0, 54.0))
      @gramos1.insert_head(100.0)
      @gramos1.insert_head(50.0)
      @espanola = PlatoHijo.new("DietaEsp", @dietaespañola, @gramos1)

      @dietavasca.insert_head(Alimento.new('Chocolate', 2.3, 3.4, 47.0, 5.3, 30.0))
      @dietavasca.insert_head(Alimento.new('Lentejas', 0.4, 3.4, 52.0, 23.5, 1.4))
      @gramos2.insert_head(100.0)
      @gramos2.insert_head(50.0)
      @vasca = PlatoHijo.new("DietaVasc", @dietavasca, @gramos2)

      @dietavegetaria.insert_head(Alimento.new('Leche', 3.2, 8.9, 4.8, 3.3, 3.2))
      @dietavegetaria.insert_head(Alimento.new('Huevos', 4.2, 5.7, 1.1, 13.0, 11.0))
      @gramos3.insert_head(10.0)
      @gramos3.insert_head(5.0)
      @vegetaria = PlatoHijo.new("DietaVegetaria", @dietavegetaria, @gramos3)

      @dietavegetaliana.insert_head(Alimento.new('Chocolate', 2.3, 3.4, 47.0, 5.3, 30.0))
      @dietavegetaliana.insert_head(Alimento.new('Nuez', 0.3, 7.9, 21.0, 20.0, 54.0))
      @dietavegetaliana.insert_head(Alimento.new('Lentejas', 0.4, 3.4, 52.0, 23.5, 1.4))
      @dietavegetaliana.insert_head(Alimento.new('Cafe', 0.4, 0.3, 0.0, 0.1, 0.0))
      @dietavegetaliana.insert_head(Alimento.new('Tofu', 2.0, 2.2, 1.9, 8.0, 4.8))
      @dietavegetaliana.insert_head(Alimento.new('Cerveza', 0.24, 0.22, 3.6, 0.5, 0.0))
      @gramos4.insert_head(10.0)
      @gramos4.insert_head(10.0)
      @gramos4.insert_head(20.0)
      @gramos4.insert_head(3.0)
      @gramos4.insert_head(5.0)
      @gramos4.insert_head(2.0)
      @vegetaliana = PlatoHijo.new("DietaVegetaliana", @dietavegetaliana, @gramos4)

      @dietacarne.insert_head(Alimento.new('Pollo', 5.7, 7.1, 0.0, 20.6, 5.6))
      @dietacarne.insert_head(Alimento.new('Cerdo', 7.6, 11.0, 0.0, 21.5, 6.3))
      @dietacarne.insert_head(Alimento.new('Huevos', 4.2, 5.7, 1.1, 13.0, 11.0))
      @dietacarne.insert_head(Alimento.new('Cafe', 0.4, 0.3, 0.0, 0.1, 0.0))
      @gramos5.insert_head(50.0)
      @gramos5.insert_head(50.0)
      @gramos5.insert_head(10.0)
      @gramos5.insert_head(3.0)
      @carne = PlatoHijo.new("DietaCarne", @dietacarne, @gramos5)
   end

   it "Comparacion de dietas <" do
     expect(@espanola < @vasca).to eq(false)
   end

   it "Comparacion de dietas >" do
     expect(@vegetaliana > @carne).to eq(true)
   end

   it "Comparacion de dietas == " do
     expect(@vegetaria == @vegetaria).to eq(true)
   end

   it "Comparacion de dietas <=" do
     expect(@vasca <= @carne).to eq(false)
   end

   it "Comparacion de dietas >=" do
     expect(@vegetaliana >= @carne).to eq(true)
   end

   it "Comparacion de dietas between" do
     expect(@vasca.eficiencia_energetica.between?(63000.0,64000.0)).to eq(true)
   end

   it "Comparacion de dietas <=>" do
     expect(@espanola <=> @vasca).to eq(1)
     expect(@vasca <=> @espanola).to eq(-1)
     expect(@vasca <=> @vasca).to eq(0)
   end
  end

  context "Pruebas de enumeracion para la clase PlatoHijo" do
    before :each do
      @dietaespanola = Listas.new()
      @espanola1 = Alimento.new('Chocolate', 2.3, 3.4, 47.0, 5.3, 30.0)
      @espanola2 = Alimento.new('Nuez', 0.3, 7.9, 21.0, 20.0, 54.0)
      @dietaespanola.insert_head(@espanola1)
      @dietaespanola.insert_head(@espanola2)

      @dietavasca = Listas.new()
      @vasca1 = Alimento.new('Chocolate', 2.3, 3.4, 47.0, 5.3, 30.0)
      @vasca2 = Alimento.new('Lentejas', 0.4, 3.4, 52.0, 23.5, 1.4)
      @dietavasca.insert_head(@vasca1)
      @dietavasca.insert_head(@vasca2)

      @dietavegetaria = Listas.new()
      @vegetaria1 = Alimento.new('Leche', 3.2, 8.9, 4.8, 3.3, 3.2)
      @vegetaria2 = Alimento.new('Huevos', 4.2, 5.7, 1.1, 13.0, 11.0)
      @dietavegetaria.insert_head(@vegetaria1)
      @dietavegetaria.insert_head(@vegetaria2)

      @dietavegetaliana = Listas.new()
      @vegetaliana1 = Alimento.new('Chocolate', 2.3, 3.4, 47.0, 5.3, 30.0)
      @vegetaliana2 = Alimento.new('Nuez', 0.3, 7.9, 21.0, 20.0, 54.0)
      @vegetaliana3 = Alimento.new('Lentejas', 0.4, 3.4, 52.0, 23.5, 1.4)
      @vegetaliana4 = Alimento.new('Cafe', 0.4, 0.3, 0.0, 0.1, 0.0)
      @vegetaliana5 = Alimento.new('Tofu', 2.0, 2.2, 1.9, 8.0, 4.8)
      @vegetaliana6 = Alimento.new('Cerveza', 0.24, 0.22, 3.6, 0.5, 0.0)
      @dietavegetaliana.insert_head(@vegetaliana1)
      @dietavegetaliana.insert_head(@vegetaliana2)
      @dietavegetaliana.insert_head(@vegetaliana3)
      @dietavegetaliana.insert_head(@vegetaliana4)
      @dietavegetaliana.insert_head(@vegetaliana5)
      @dietavegetaliana.insert_head(@vegetaliana6)

      @dietacarne = Listas.new()
      @carne1 = Alimento.new('Pollo', 5.7, 7.1, 0.0, 20.6, 5.6)
      @carne2 = Alimento.new('Cerdo', 7.6, 11.0, 0.0, 21.5, 6.3)
      @carne3 = Alimento.new('Huevos', 4.2, 5.7, 1.1, 13.0, 11.0)
      @carne4 = Alimento.new('Cafe', 0.4, 0.3, 0.0, 0.1, 0.0)
      @dietacarne.insert_head(@carne1)
      @dietacarne.insert_head(@carne2)
      @dietacarne.insert_head(@carne3)
      @dietacarne.insert_head(@carne4)
  end

  it "Prueba para el método collect" do
    expect(@dietaespanola.collect{|i| i.nombre}).to eq(['Nuez', 'Chocolate'])
  end

  it "Prueba para el método select" do
    expect(@dietavasca.select{|i| i.lipidos > 25}).to eq([@vasca1])
  end

  it "Prueba para el método max" do
    expect(@dietavegetaria.max.gei).to eq(4.2)
  end

  it "Prueba para el método min" do
    expect(@dietavegetaliana.min.terreno).to eq(0.3)
  end

  it "Prueba para el método sort" do
    expect(@dietacarne.sort).to eq([@carne4,@carne1,@carne2,@carne3])
  end
  end

  context "Menú dietético y huella nutricional" do
    before :all do
      @dietaespañola = Listas.new()
      @gramos1 = Listas.new()
      @dietavasca = Listas.new()
      @gramos2 = Listas.new()
      @dietavegetaria = Listas.new()
      @gramos3 = Listas.new()
      @dietavegetaliana = Listas.new()
      @gramos4 = Listas.new()
      @dietacarne = Listas.new()
      @gramos5 = Listas.new()

      @dietaespañola.insert_head(Alimento.new('Chocolate', 2.3, 3.4, 47.0, 5.3, 30.0))
      @dietaespañola.insert_head(Alimento.new('Nuez', 0.3, 7.9, 21.0, 20.0, 54.0))
      @gramos1.insert_head(100.0)
      @gramos1.insert_head(50.0)
      @espanola = PlatoHijo.new("DietaEsp", @dietaespañola, @gramos1)

      @dietavasca.insert_head(Alimento.new('Chocolate', 2.3, 3.4, 47.0, 5.3, 30.0))
      @dietavasca.insert_head(Alimento.new('Lentejas', 0.4, 3.4, 52.0, 23.5, 1.4))
      @gramos2.insert_head(100.0)
      @gramos2.insert_head(50.0)
      @vasca = PlatoHijo.new("DietaVasc", @dietavasca, @gramos2)

      @dietavegetaria.insert_head(Alimento.new('Leche', 3.2, 8.9, 4.8, 3.3, 3.2))
      @dietavegetaria.insert_head(Alimento.new('Huevos', 4.2, 5.7, 1.1, 13.0, 11.0))
      @gramos3.insert_head(10.0)
      @gramos3.insert_head(5.0)
      @vegetaria = PlatoHijo.new("DietaVegetaria", @dietavegetaria, @gramos3)

      @dietavegetaliana.insert_head(Alimento.new('Chocolate', 2.3, 3.4, 47.0, 5.3, 30.0))
      @dietavegetaliana.insert_head(Alimento.new('Nuez', 0.3, 7.9, 21.0, 20.0, 54.0))
      @dietavegetaliana.insert_head(Alimento.new('Lentejas', 0.4, 3.4, 52.0, 23.5, 1.4))
      @dietavegetaliana.insert_head(Alimento.new('Cafe', 0.4, 0.3, 0.0, 0.1, 0.0))
      @dietavegetaliana.insert_head(Alimento.new('Tofu', 2.0, 2.2, 1.9, 8.0, 4.8))
      @dietavegetaliana.insert_head(Alimento.new('Cerveza', 0.24, 0.22, 3.6, 0.5, 0.0))
      @gramos4.insert_head(10.0)
      @gramos4.insert_head(10.0)
      @gramos4.insert_head(20.0)
      @gramos4.insert_head(3.0)
      @gramos4.insert_head(5.0)
      @gramos4.insert_head(2.0)
      @vegetaliana = PlatoHijo.new("DietaVegetaliana", @dietavegetaliana, @gramos4)

      @dietacarne.insert_head(Alimento.new('Pollo', 5.7, 7.1, 0.0, 20.6, 5.6))
      @dietacarne.insert_head(Alimento.new('Cerdo', 7.6, 11.0, 0.0, 21.5, 6.3))
      @dietacarne.insert_head(Alimento.new('Huevos', 4.2, 5.7, 1.1, 13.0, 11.0))
      @dietacarne.insert_head(Alimento.new('Cafe', 0.4, 0.3, 0.0, 0.1, 0.0))
      @gramos5.insert_head(50.0)
      @gramos5.insert_head(50.0)
      @gramos5.insert_head(10.0)
      @gramos5.insert_head(3.0)
      @carne = PlatoHijo.new("DietaCarne", @dietacarne, @gramos5)

      @arrayplatos = [@espanola,@vasca,@vegetaria,@vegetaliana,@carne]
      @arrayprecios = [25.0,20.0,35.0,30.0,50.0]
   end

   it "Huella nutricional plato española" do
     expect(@espanola.huella_nutricional).to eq(2.0)
   end

   it "Huella nutricional plato vasca" do
     expect(@vasca.huella_nutricional).to eq(2.0)
   end

   it "Huella nutricional plato vegetaria" do
     expect(@vegetaria.huella_nutricional).to eq(2.0)
   end

   it "Huella nutricional plato vegetaliana" do
     expect(@vegetaliana.huella_nutricional).to eq(2.0)
   end

   it "Huella nutricional plato carne" do
     expect(@carne.huella_nutricional).to eq(2.0)
   end

   it "Máxima huella nutricional" do
     expect(@arrayplatos.max.huella_nutricional).to eq(2.0)
   end

   it "Plato con la mayor huella nutricional" do
     expect(@arrayplatos.select{|i| i.huella_nutricional}).to eq([@espanola,@vasca,@vegetaria,@vegetaliana,@carne])
   end

   it "Incremento de precios de los platos" do
     expect(@arrayprecios.collect{|i| i * @arrayplatos.max.huella_nutricional}).to eq([50.0, 40.0, 70.0, 60.0, 100.0])
   end
  end
end

RSpec.describe PlatoDSL do
  before :each do
    chocolate = Alimento.new('Chocolate', 2.3, 3.4, 47.0, 5.3, 30.0)
    nuez = Alimento.new('Nuez', 0.3, 7.9, 21.0, 20.0, 54.0)

  @platodsl = PlatoDSL.new("Chocolate con nueces") do
    alimento :descripcion => chocolate, :gramos => 100
    alimento :descripcion => nuez, :gramos => 50
  end
end

  it "Pruebas para comprobar que el plato pertenece a la clase PlatoDSL" do
    expect(@platodsl.is_a?PlatoDSL).to eq(true)
  end

  it "Prueba para comprobar el formato del plato" do
    expect(@platodsl.to_s).to eq("Chocolate con nueces\n====================\n\nAlimentos: (Chocolate)(100 g), (Nuez)(50 g)\n\n")
  end
end

RSpec.describe MenuDSL do
  before :each do
    lentejas = Alimento.new('Lentejas', 0.4, 3.4, 52.0, 23.5, 1.4)
    nuez = Alimento.new('Nuez', 0.3, 7.9, 21.0, 20.0, 54.0)
    pollo = Alimento.new('Pollo', 5.7, 7.1, 0.0, 20.6, 5.6)
    cafe = Alimento.new('Cafe', 0.4, 0.3, 0.0, 0.1, 0.0)
    leche = Alimento.new('Leche', 3.2, 8.9, 4.8, 3.3, 3.2)

    plato1 = PlatoDSL.new("Lentejas") do
      alimento :descripcion => lentejas, :gramos => 100
    end

    plato2 = PlatoDSL.new("Pollo con nueces") do
      alimento :descripcion => pollo, :gramos => 100
      alimento :descripcion => nuez, :gramos => 50
    end

    plato3 = PlatoDSL.new("Café con Leche") do
      alimento :descripcion => cafe, :gramos => 5
      alimento :descripcion => nuez, :gramos => 5
    end

    @menu = MenuDSL.new("Menu del dia") do
      platos :nombre => plato1, :precio => 3
      platos :nombre => plato2, :precio => 5
      platos :nombre => plato3, :precio => 1.2
    end
  end

  it "Prueba para comprobar que el menu pertenece a la clase MenuDSL" do
    expect(@menu.is_a?MenuDSL).to eq(true)
  end

  it "Prueba para comprobar el to_s del menu" do
    expect(@menu.to_s).to eq("Menu del dia\n============\nPlatos: (Lentejas)(3 €), (Pollo con nueces)(5 €), (Café con Leche)(1.2 €)\nPrecio total del menu: 9.2\n\nValor calorico total del menu: 80492.0\nValor de las emisiones de CO2 del menu: 628.5 \n")
  end

  it "Salida del menú" do
  end

  it " " do
    puts @menu
  end
end
