class Item

  @items = []
  class << self
    attr_accessor :items
  end
  
  attr_accessor :id, :title, :category
  
  @@id_count = 1

  def self.all
    @items
  end

  def self.register
    print 'Digite o título do seu item de estudo: '
    title = gets.chomp
    print 'Digite a categoria do seu item de estudo: '
    category = gets.chomp
    puts "Item '#{title}' da categoria '#{category}' cadastrado com sucesso!"
    new(title: title, category: category)
  end

  def self.search
    print 'Digite o uma palavra para procurar: '
    term = gets.chomp
    found_items = all.filter do |item|
      item.title.downcase.include? term.downcase
    end
    puts found_items
    puts 'Nenhum item encontrado' if found_items.empty?
  end

  def self.delete
    print 'Digite o ID do item: '
    id = gets.to_i
    item = all.find {|item| item.id == id}
    puts 'Item não encontrado' if item.nil? 
    @items.delete(item) 
  end


  def initialize(title:, category:)
    @id = @@id_count 
    @title = title
    @category = category

    @@id_count += 1
    self.class.items << self
  end

  def to_s
    "##{id} - #{title} - #{category} "
  end

end
