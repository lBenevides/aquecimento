require_relative 'item'
require_relative 'study_diary'

def welcome
  'Bem-vindo ao Diário de Estudos, seu companheiro para estudar!'
end

def clear
  system('clear')
end

clear
puts welcome
diary = StudyDiary.new
option = StudyDiary.menu


loop do 
  if option == 1
    diary.register_item
  elsif option == 2
    diary.items.each_with_index do |item, index|
      puts "##{index + 1} - #{item.title} - #{item.category}"
    end
    puts 'Nenhum item cadastrado' if diary.items.empty?
  elsif option == 3
    
  elsif option == 4
    break
  else
    puts 'Opção inválida'
  end
  option = StudyDiary.menu
end

puts 'Obrigado por usar o Diário de Estudos'  