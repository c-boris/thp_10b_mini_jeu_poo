class Player
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state # Affiche l'état de vie du joueur en fonction de ses points de vie
    if @life_points > 0
    puts "#{@name} a #{@life_points} point(s) de vie"
    else
      puts "le joueur #{@name} est mort !"
    end
  end

  def gets_damage(damage_received) # Déduit les dommages reçus aux points de vie du joueur
    @life_points = @life_points - damage_received
    if @life_points <= 0
      puts "le joueur #{@name} a été tué !"
    end
  end
  
  def attacks(other_player) # Calcule les dommages infligés par le joueur attaquant
    if @life_points > 0 && other_player.life_points > 0
      puts "Le joueur #{other_player.name} attaque le joueur #{@name}"
      damage_received = compute_damage.to_i
      puts "il lui inflige #{damage_received} points de dommages"
      gets_damage(damage_received) 
    end
  end

  def compute_damage # Calcule les dommages infligés par le joueur attaquant
    return rand(1..6)
  end
end

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name) # Initialise un joueur humain avec des points de vie et une arme
    @name = name
    @life_points = 100
    @weapon_level = 1
  end

  def show_state # Affiche l'état de vie du joueur humain et le niveau de son arme
    if @life_points > 0
      puts "#{@name} a #{@life_points} point(s) de vie et une arme de niveau #{@weapon_level}"
    else
      puts "le joueur #{@name} est mort !"
    end
  end

  def compute_damage # Calcule les dommages infligés par le joueur humain
    rand(1..6) * @weapon_level
  end

  def search_weapon # Recherche une arme aléatoire et affiche un message en fonction de sa puissance
    new_weapon_level = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{new_weapon_level}."
    if new_weapon_level > @weapon_level
      @weapon_level = new_weapon_level
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
    else
      puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end
  end
  
  def search_health_pack # Recherche un pack de points de vie aléatoire et affiche un message en fonction de sa valeur
    dice = rand(1..6)
    if dice == 1
      puts "Tu n'as rien trouvé... "
    elsif dice >= 2 && dice <= 5
      @life_points += 50
      @life_points = 100 if @life_points > 100
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
    else
      @life_points += 80
      @life_points = 100 if @life_points > 100
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
    end
  end
end
