extends Node

# Player és Family classok
const Player = preload("res://scripts/player.gd")
const Family = preload("res://scripts/family.gd")

# UI és HUD scene
var ui = preload("res://scenes/ui/ui.tscn")
var hud_scene = preload("res://scenes/menu/hud.tscn")

# Példányok
var current_scene: Node = null
var hud_instance: CanvasLayer

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

	# UI betöltése
	var ui_scene = ui.instantiate()
	add_child(ui_scene)
	ui_scene.connect("scene_change_requested", Callable(self, "_change_scene"))

	# HUD betöltése
	hud_instance = hud_scene.instantiate() as Hud
	add_child(hud_instance)
	
	piotr.set_hunger(12)
	piotr.set_alcohol(95)
	
	hud_instance.update_player(piotr)
	hud_instance.update_family_member(1, mihalina)
	hud_instance.update_family_member(2, gustav)
	hud_instance.update_family_member(3, matka)
	
	matka.set_hunger(99)
	hud_instance.update_family_member(3, matka)

	# Kezdő scene: Office
	_change_scene("res://scenes/shop/shop.tscn")


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


# Input kezelés HUD-hoz
func _input(event):
	if event.is_action_pressed("ui_up_down"):
		hud_instance._on_up_down_pressed()

	if event.is_action_pressed("ui_f1"):
		hud_instance._on_f_1_pressed()

	if event.is_action_pressed("ui_f2"):
		hud_instance._on_f_2_pressed()

	if event.is_action_pressed("ui_f3"):
		hud_instance._on_f_3_pressed()
