require_relative 'item'

REGISTER = 1
ALL      = 2
SEARCH   = 3
DELETE   = 4 
EXIT     = 5

def welcome
  'Bem-vindo ao Diário de Estudos, seu companheiro para estudar!'
end

def menu
  puts "[#{REGISTER}] Cadastrar um item para estudar"
  puts "[#{ALL}] Ver todos os itens cadastrados"
  puts "[#{SEARCH}] Buscar um item de estudo"
  puts "[#{DELETE}] Deletar um item"
  puts "[#{EXIT}] Sair"
  print 'Escolha uma opção: '
  gets.to_i
end

def clear
  print 'Aperte enter para continuar'
  gets.chomp
  system('clear')  
end

puts welcome
option = menu

while option != EXIT
  if option == REGISTER
    Item.register
    clear
  elsif option == ALL
    puts Item.all
    puts 'Nenhum item cadastrado' if Item.all.empty?
    clear
  elsif option == SEARCH
    Item.search
    clear
  elsif option == DELETE
    Item.delete
    clear
  else
    puts 'Opção inválida'
  end
  option = menu
end

puts 'Obrigado por usar o Diário de Estudos'  