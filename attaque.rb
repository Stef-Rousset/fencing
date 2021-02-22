#require_relative 'defense'

class Attaque < Combat
  def initialize(combat)
    @combat = combat
    @choice = 0
    @answer = 0
  end

  def first_attack
    puts "Vous prenez l'initiative en attaquant le premier.\nQuelle ligne visez-vous?"
    puts "1 : dessus\n2 : dedans\n3 : dehors\n4 : dessous"
    print ">"
    @choice = gets.chomp.to_i
    @answer = rand(5)
    if @answer == @choice
      puts "Votre attaque est parée."
      # appel de la methode parade
      @combat.parry.parade
    else
      puts "Votre attaque touche, bravo vous marquez un point !"
      @@score += 1
    end
    if @@score == 5 # match termine
      @combat.end_game
    else
      puts "Le score est de #{@@score} pour vous à #{@@oponent_score} pour votre adversaire"
       # appel de la methode play
       @combat.replay
    end
  end

  def riposte
    puts "Dans quelle ligne ripostez-vous ?"
    puts "1 : dessus\n2 : dedans\n3 : dehors\n4 : dessous"
    print ">"
    @choice = gets.chomp.to_i
    @answer = rand(5)
    if @answer == @choice
      puts "Votre riposte est parée..."
      # appel de la methode parade
      @combat.parry.parade
    else
      puts "Votre riposte touche, bravo vous marquez un point !"
      @@score += 1
    end
    if @@score == 5 # match termine
      @combat.end_game
    else
      puts "Le score est de #{@@score} pour vous à #{@@oponent_score} pour votre adversaire"
       # appel de la methode play
       @combat.replay
    end
  end
end
