require_relative 'attaque'
require_relative 'defense'

class Combat
  @@score = 0
  @@oponent_score = 0
  attr_reader :parry, :attack

  def initialize
    @action = 0
    @new_game = nil
    @attack = Attaque.new(self)
    @parry = Defense.new(self)
  end

  def play
    puts "1 : attaquer\n2 : défendre"
    print ">"
    @action = gets.chomp.to_i
    @action == 1 ? @attack.first_attack : @parry.first_parade
  end

  def begin_game
    puts "Vous commencez votre match en 5 touches.\nVotre adversaire est prêt.\nL'arbitre donne le \"allez\".\nQuelle action allez-vous faire ?"
    play
  end

  def replay
    puts "Quel est votre prochain coup ?"
    play
  end

  def end_game
    if @@score == 5
      puts "Le combat est terminé. Bravo, vous avez gagné sur le score de #{@@score} à #{@@oponent_score}."
    elsif @@oponent_score == 5
      puts "Le combat est terminé. Malheureusement, vous avez perdu, le score est de #{@@oponent_score} à #{@@score} pour votre adversaire."
    end

    puts "Voulez-vous faire un nouveau match ? O/N"
    print ">"
    @new_game = gets.chomp
    if @new_game == "O"
      @@score = 0
      @@oponent_score = 0
      Combat.new.begin_game
    else
      exit
    end
  end
end

#my_match = Combat.new
#my_match.begin_game
