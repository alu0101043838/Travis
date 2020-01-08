class PlatoDSL

  attr_accessor :name, :alimentos, :nombre_plato, :gramos, :lista_alimentos

  def initialize(name, &block)
    @name = name
    @alimentos = []
    @gramos = Listas.new()
    @lista_alimentos = Listas.new()

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
    output << "\n#{'=' * @name.size}\n\n"
    output << "Alimentos: #{@alimentos.join(', ')}\n\n"
  end

  def nombreplato(nombre)
    @nombre_plato = nombre
  end

  def alimento(options = {})
    alimento = options[:descripcion]
    nombre_alimento = alimento.nombre
    @lista_alimentos.insert_head(alimento)
    alimento = "(#{nombre_alimento})"
    alimento << "(#{options[:gramos]} g)"
    @gramos.insert_head(options[:gramos])
    @alimentos << alimento
  end

  def eficiencia_energetica_DSL
    auxplato = PlatoHijo.new(@nombre_alimento, @lista_alimentos, @gramos)
    auxplato.eficiencia_energetica
  end

  def gei_diario_DSL
    auxplato = PlatoHijo.new(@nombre_alimento, @lista_alimentos, @gramos)
    auxplato.gei_diario
  end
end
