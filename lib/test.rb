require_relative 'hero.rb'
require_relative 'npc.rb'
require_relative 'analyze.rb'
require_relative 'decide.rb'
require 'colorize'

information_hash = {
  :information => {
    :lighthouse => "It's to the South.",
    :monsters => "There are no such things, just angels.",
    :king => "Asshole, like all the other blue-bloods."
  },
  :greetings => ["Hello", "Good day", "Well met"],
  :curses => ["Bugger off, nuisance!", "You are not worthy of our time", "Begone, you foul slime-ball!"],
  :smalltalk => ["Lovely weather, isn't it?", "Oh really?", "I'm afraid it is going to rain", "Have you tried the autumn apples?"],
  :farewells => ["Take care!", "Goodbye!", "May light shine on your path"]
}

attributes = ["hero_reputation", "npc_personality", "speech_score"]
training_data = [
  ["good", "friendly", "high", 1],
  ["good", "suspicious","high", 1],
  ["good", "hostile", "high", 1],
  ["good", "friendly", "med", 1],
  ["good", "suspicious","med", 1],
  ["good", "hostile", "med", 0],
  ["good", "friendly", "low", 1],
  ["good", "suspicious","low", 0],
  ["good", "hostile", "low", 0],
  ["neutral", "friendly", "high", 1],
  ["neutral", "suspicious","high", 1],
  ["neutral", "hostile", "high", 0],
  ["neutral", "friendly", "low", 1],
  ["neutral", "suspicious","low", 0],
  ["neutral", "hostile", "low", 0],
  ["poor", "friendly", "high", 1],
  ["poor", "suspicious","high", 0],
  ["poor", "hostile", "high", 0],
  ["poor", "friendly", "low", 0],
  ["poor", "suspicious","medium", 0],
  ["poor", "hostile", "medium", 0]]


  hero = Hero.new("Sal")
  npc = NPC.new("Murry Fisherman", "suspicious", information_hash)
  puts "A hero called #{hero.name} approaches a #{npc.personality} #{npc.name} and says:"
  phrase = "Excuse me, sir, could you please tell me where the lighthouse is?"
  # phrase = "Hey babe, tell me where in the fuck the lighthouse is?"
  # phrase = "Hey you jerk! Tell me where that crap of a lighthouse is, you idiot or I'll kill you!"
  puts phrase.colorize(:blue)
  al = Analyze.new(phrase)
  # puts al.sum_score
  decision = Decide.new(attributes, training_data)
  if decision.decision(hero, npc, al) == 1
    #this needs to be abstracted!
    puts "#{npc.name} answers:"
    puts "#{information_hash[:information][:lighthouse]}".colorize(:green)
  else
    index = rand(0...information_hash[:curses].size)
    puts "#{npc.name} says:"
    puts "#{information_hash[:curses][index]}".colorize(:red)
  end
