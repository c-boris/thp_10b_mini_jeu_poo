require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

# binding.pry

player1 = Player.new("Josiane")
player2 = Player.new("José")



puts "Voici l'état de chaque joueur au début du combat :"
print player1.show_state
print player2.show_state
puts "---------------------------------------------------"

while player1.life_points > 0 && player2.life_points > 0
  puts "Passons à la phase d'attaque :"
  player2.attacks(player1)
  player1.attacks(player2)
  puts "---------------------------------------------------"
  puts "Voici l'état de chaque joueur apres cette attaque :"
  print player1.show_state
  print player2.show_state
  puts "---------------------------------------------------"
end

