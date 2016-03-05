# Fighters
king = Fighter.create(fname: "The",
               lname: "King",
               description: "The King engages and controlls the strongest of
                             emotions. His aim is to establish your strong
                             position in the world.",
               avatar: File.new("#{Rails.root.join('db','seed_avatars','king.png')}"))
child = Fighter.create(fname: "Inner",
               lname: "Child",
               description: "Lorem ipsum dolor sit amet, consectetur adipisicing
                             elit, sed do eiusmod tempor incididunt ut labore et
                             dolore magna aliqua.",
               avatar: File.new("#{Rails.root.join('db','seed_avatars','child.jpg')}"))
death = Fighter.create(fname: "THE",
               lname: "DEATH",
               description: "Lorem ipsum dolor sit amet, consectetur adipisicing
                             elit, sed do eiusmod tempor incididunt ut labore et
                             dolore magna aliqua.",
               avatar: File.new("#{Rails.root.join('db','seed_avatars','death.jpg')}"))
realist = Fighter.create(fname: "The",
               lname: "Realist",
               description: "Lorem ipsum dolor sit amet, consectetur adipisicing
                             elit, sed do eiusmod tempor incididunt ut labore et
                             dolore magna aliqua.",
               avatar: File.new("#{Rails.root.join('db','seed_avatars','realist.png')}"))
jester = Fighter.create(fname: "The",
               lname: "Jester",
               description: "Lorem ipsum dolor sit amet, consectetur adipisicing
                             elit, sed do eiusmod tempor incididunt ut labore et
                             dolore magna aliqua.",
               avatar: File.new("#{Rails.root.join('db','seed_avatars','jester.jpg')}"))
5.times do |i|
  fname = "Sub"
  lname = "Personality-#{i+5}"
  description = ""
  Fighter.create(fname: fname,
                 lname: lname,
                 description: description,
                 avatar: File.new("#{Rails.root.join('db','seed_avatars','subpersonality.png')}"))
end

#Skills
king.skills.create(name: "Pride", level: 2)
king.skills.create(name: "Shame", level: 3)
king.skills.create(name: "Security", level: 5)

child.skills.create(name: "Trauma", level: 5)
child.skills.create(name: "Curiosity", level: 4)
child.skills.create(name: "Fun", level: 4)

death.skills.create(name: "Memento Mori", level: 3)
death.skills.create(name: "Self-Preservation", level: 5)
death.skills.create(name: "Carpe Diem", level: 3)

realist.skills.create(name: "Regret", level: 5)
realist.skills.create(name: "Calculated Risk", level: 3)
realist.skills.create(name: "Logic", level: 4)

jester.skills.create(name: "Keine Grenzen", level: 4)
jester.skills.create(name: "Inconvenient Truth", level: 4)
jester.skills.create(name: "Ayyy LMAO!", level: 4)

@figters = Fighter.find([6, 10])
@figters.each do |f|
  3.times do |i|
    f.skills.create(name: "Skill #{i}", level: 3)
  end
end

#Fights
Fight.create(winner_id: child.id, loser_id: king.id)
Fight.create(winner_id: jester.id, loser_id: death.id)
Fight.create(winner_id: death.id, loser_id: realist.id)
Fight.create(winner_id: jester.id, loser_id: king.id)
Fight.create(winner_id: realist.id, loser_id: child.id)

king.experience += 20
king.save
child.experience += 30
child.save
death.experience += 30
death.save
realist.experience += 30
realist.save
jester.experience += 40
jester.save
