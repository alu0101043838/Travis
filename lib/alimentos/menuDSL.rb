class MenuDSL
  include Enumerable

  attr_reader :nombre_menu, :platos, :precios, :valor_energetico, :valor_ambiental

  def initialize(name, &block)
    @name = name
    @platos = []
    @precios = []
    @valor_energetico = []
    @valor_ambiental = []

    if block_given?
      if block.arity == 1
        yield self
      else
       instance_eval(&block)
      end
    end
  end

  def to_s
    output = @name
    output << "\n#{'=' * @name.size}\n"
    output << "Platos: #{@platos.join(', ')}\n"
    output << "Precio total del menu: #{@precios.reduce(:+)}\n"
    output << "\nValor calorico total del menu: #{@valor_energetico.reduce(:+).round(1)}"
    output << "\nValor de las emisiones de CO2 del menu: #{@valor_ambiental.reduce(:+).round(1)} \n"
  end

  def platos(options = {})
    plato = options[:nombre]
    nombre_plato = plato.name
    precio_plato = options[:precio]
    @precios << precio_plato
    @valor_energetico << plato.eficiencia_energetica_DSL
    @valor_ambiental << plato.gei_diario_DSL

    plato = "(#{nombre_plato})"
    plato << "(#{precio_plato} €)"
    @platos << plato
  end
end
