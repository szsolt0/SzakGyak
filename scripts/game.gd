extends Node

const Player = preload("res://scripts/player.gd")
const Family = preload("res://scripts/family.gd")

func _ready():
	# Piotr létrehozása
	var piotr = Player.new("Piotr", 0, 50, 20, 10, 100, 5, 2)
	print(piotr.get_description())
	
	# Fix 4 családtag létrehozása
	var mihalina = Family.new("Mihalina", 0)
	mihalina.get_description()
	var gustav = Family.new("Gustav", 0)
	gustav.get_description()
	var matka = Family.new("Matka", 0)
	matka.get_description()
	var vilen = Family.new("Vilen", 0)
	vilen.get_description()
