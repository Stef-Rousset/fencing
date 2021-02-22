#require_relative 'attaque'

class Defense < Combat
  def initialize(combat)
    @combat = combat
    @choice = 0
    @answer = 0
  end

  def first_parade
    puts "Votre adversaire attaque le premier, vous tentez de parer.\nQuelle parade faites-vous?"
    general_parade
  end

  def parade
    puts "Votre adversaire riposte, vous tentez de parer.\nQuelle parade faites-vous?"
    general_parade
  end

  private

  def general_parade
    puts "1 : sixte\n2 : quarte\n3 : octave\n4 : septime"
    print ">"
    @choice = gets.chomp.to_i
    @answer = rand(5)
    if @answer == @choice
      puts "Votre avez trouvé la parade, et vous ripostez."
      # appel de la methode riposte
      @combat.attack.riposte
    else
      puts "Vous n'avez pas pris la bonne parade, votre adversaire touche et marque le point !"
      @@oponent_score += 1
    end
    if @@oponent_score == 5
      @combat.end_game
    else
      puts "Le score est de #{@@score} pour vous à #{@@oponent_score} pour votre adversaire"
       # appel de la methode replay
      @combat.replay
    end
  end
end
