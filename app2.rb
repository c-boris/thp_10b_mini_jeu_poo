require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

# binding.pry

puts "
------------------------------------------------
|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
|Le but du jeu est d'être le dernier survivant !|
-------------------------------------------------"

puts "Quel est ton prénom ?"
print "> "
user_name = gets.chomp
user = HumanPlayer.new(user_name)

player1 = Player.new("Josiane")
player2 = Player.new("José")

enemies = [player1, player2]

while user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
  puts user.show_state
  puts "Quelle action veux-tu effectuer ?"
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner"
  puts ""
  puts "attaquer un joueur en vue :"
  puts "0 - #{player1.show_state}"
  puts "1 - #{player2.show_state}"
  puts ""

  print "> "
  user_choice = gets.chomp

  case user_choice
  when "a"
    user.search_weapon
  when "s"
    user.search_health_pack
  when "0"
    user.attacks(player1)
  when "1"
    user.attacks(player2)
  else
    puts "Je n'ai pas compris ton choix, réessaye."
  end

  puts "Les autres joueurs t'attaquent !"

  enemies.each do |enemy|
    if enemy.life_points > 0
      enemy.attacks(user)
    end
  end

end

puts "La partie est finie"

if user.life_points > 0
  puts "BRAVO ! TU AS GAGNE !"
else
  puts "Loser ! Tu as perdu !"
end