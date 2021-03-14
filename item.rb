class Item
  require 'sqlite3'
  
  attr_accessor :id, :title, :category
  
  def self.all
    query = conection.execute " SELECT * FROM test"
    query.map do |item|
      new(id: item["id"], title: item["title"], category: item["category"])
     # "##{item["id"]} - #{item["title"]} - #{item["category"]}"
    end
  end

  def self.register
    print 'Digite o título do seu item de estudo: '
    title = gets.chomp
    print 'Digite a categoria do seu item de +estudo: '
    category = gets.chomp
    puts "Item '#{title}' da categoria '#{category}' cadastrado com sucesso!"
    conection.execute "insert into test (title, category) values (?,?)", title, category
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
    conection.execute "DELETE FROM test WHERE id=?", id     
  end


  def initialize(id:, title:, category:)
    @id = id
    @title = title
    @category = category
  end

  def to_s
    "##{id} - #{title} - #{category} "
  end

  private

  def self.conection
    db = SQLite3::Database.open 'test.db'
    db.results_as_hash = true
    db
  end

end
