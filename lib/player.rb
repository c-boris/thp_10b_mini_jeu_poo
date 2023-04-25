class Player
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
    if @life_points > 0
    puts "#{@name} a #{@life_points} point(s) de vie"
    else
      puts "le joueur #{@name} est mort !"
    end
  end

  def gets_damage(damage_received)
    @life_points = @life_points - damage_received
    if @life_points <= 0  
      puts "le joueur #{@name} a été tué !"
    end
  end

  def attacks(other_player)
    if @life_points > 0 && other_player.life_points > 0
      puts "Le joueur #{other_player.name} attaque le joueur #{@name}"
      damage_received = compute_damage.to_i
      puts "il lui inflige #{damage_received} points de dommages"
      gets_damage(damage_received)
    end
  end

  def compute_damage
    return rand(1..6)
  end
end
