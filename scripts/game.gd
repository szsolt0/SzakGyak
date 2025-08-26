extends Node

# Player és Family classok
const Player = preload("res://scripts/player.gd")
const Family = preload("res://scripts/family.gd")

# Aktuális scene
var current_scene: Node = null

func _ready():
	# Karakterek létrehozása
	var piotr = Player.new("Piotr", 0, 50, 20, 10, 100, 5, 2)
	print(piotr.get_description())

	var mihalina = Family.new("Mihalina", 0)
	print(mihalina.get_description())
	var gustav = Family.new("Gustav", 0)
	print(gustav.get_description())
	var matka = Family.new("Matka", 0)
	print(matka.get_description())
	var vilen = Family.new("Vilen", 0)
	print(vilen.get_description())

	# Kezdő scene: Shop
	_change_scene("res://scenes/shop/Shop.tscn")

# Scene váltó függvény
func _change_scene(path: String) -> void:
	# Régi scene törlése
	if current_scene:
		current_scene.queue_free()

	# Betöltés
	var res = load(path)
	if res:
		current_scene = res.instantiate()
		add_child(current_scene)
	else:
		push_error("Nem található a scene: %s" % path)
