# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Matières

matieres = [
    {nom: "MDF"},
    {nom: "CP"},
    {nom: "Valchromat"},
    {nom: "Mélaminé"},
    {nom: "Isorel"},
    {nom: "Strat"},
    {nom: "Dibon"},
    {nom: "Corian"},
    {nom: "Acier"},
    {nom: "Aluminium"},
    {nom: "Laiton"},
    {nom: "Bandoxal"},
    {nom: "Plexiglass"}
]

matieres.each do |m|
    Matiere.find_or_create_by(m)
end

# Ressources

#MDF

m = Matiere.find_by_nom("MDF")
ep = ["3","5","8","12","16","19","25","30","40","50"]
ep.each do |e|
    r = Ressource.find_or_create_by(epaisseur: e, matiere: m)
end

#CP

m = Matiere.find_by_nom("CP")
ep = ["5","10","15","18","22"]
ep.each do |e|
    r = Ressource.find_or_create_by(epaisseur: e, matiere: m)
end

#Valchromat

m = Matiere.find_by_nom("Valchromat")
ep = ["8","16","19","30","40"]
ep.each do |e|
    r = Ressource.find_or_create_by(epaisseur: e, matiere: m)
end

#Mélaminé

m = Matiere.find_by_nom("Mélaminé")
ep = ["8","12","16","19"]
couleurs = ["Blanc", "Noir"]
ep.each do |e|
    couleurs.each do |c|
        r = Ressource.find_or_create_by(epaisseur: e, matiere: m, couleur: c)
    end
end

#Isorel

#Strat

#Dibon

m = Matiere.find_by_nom("Dibon")
ep = ["2","3"]
couleurs = ["Blanc", "Noir", "Miroir Argent", "Miroir Or", "Miroir Or riche", "Alu brossé", "Or brossé"]
ep.each do |e|
    couleurs.each do |c|
        r = Ressource.find_or_create_by(epaisseur: e, matiere: m, couleur: c)
    end
end

#Plexiglass

m = Matiere.find_by_nom("Plexiglass")
ep = ["3","6","8","10","12","15","20"]
couleurs = ["Blanc mat", "Blanc brillant", "Noir mat", "Noir brillant", "Diffusant", "Transparent"]
ep.each do |e|
    couleurs.each do |c|
        r = Ressource.find_or_create_by(epaisseur: e, matiere: m, couleur: c)
    end
end

#Corian

m = Matiere.find_by_nom("Corian")
ep = ["6","9", "12"]
couleurs = ["Blanc", "Noir"]
ep.each do |e|
    couleurs.each do |c|
        r = Ressource.find_or_create_by(epaisseur: e, matiere: m, couleur: c)
    end
end

#Bandoxal

m = Matiere.find_by_nom("Bandoxal")
ep = ["0.6"]
couleurs = ["Miroir Argent", "Miroir Or", "Miroir Or riche"]
ep.each do |e|
    couleurs.each do |c|
        r = Ressource.find_or_create_by(epaisseur: e, matiere: m, couleur: c)
    end
end
