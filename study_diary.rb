require_relative 'item'
class StudyDiary 
  attr_accessor :items 
  
  def initialize
    @items = []    
  end

  def self.menu
    puts "[1] Cadastrar um item para estudar"
    puts "[2] Ver todos os itens cadastrados"
    puts "[3] Buscar um item de estudo"
    puts "[4] Sair"
    print 'Escolha uma opção: '
    gets.to_i
  end
  
  def register_item
    print 'Digite o título do seu item de estudo: '
    title = gets.chomp
    print 'Digite a categoria do seu item de estudo: '
    category = gets.chomp
    puts "Item '#{title}' da categoria '#{category}' cadastrado com sucesso!"
    @items << Item.new(title, category)
  end

  def search_item()
    print 'Digite uma palavra para procurar: '
    term = gets.chomp
    found_items = study_items.filter do |item|
      item[:title].include? term
    end
    puts found_items
    puts 'Nenhum item encontrado' if found_items.empty?
  end

  def delete_item(item)
  end

 

end