extends GutTest

const Player = preload("res://scripts/player.gd")
const Family = preload("res://scripts/family.gd")
const MainNode = preload("res://scenes/office/office.gd")

var main_node

func before_each():
	main_node = MainNode.new()
	add_child(main_node)

	# --- Mock Boss ---
	var boss = Node2D.new()
	boss.name = "Boss"
	var sprite = AnimatedSprite2D.new()
	sprite.name = "AnimatedSprite2D"
	boss.add_child(sprite)
	main_node.add_child(boss)
	main_node.boss = boss

	# --- Mock Paper & Idcard ---
	var paper = Node2D.new()
	paper.name = "Paper"
	main_node.add_child(paper)
	main_node.paper = paper

	var idcard = Node2D.new()
	idcard.name = "Idcard"
	main_node.add_child(idcard)
	main_node.idcard = idcard

	# --- Mock Text Layer & Label ---
	var text_layer = CanvasLayer.new()
	text_layer.name = "Text"
	var label = Label.new()
	label.name = "Label"
	text_layer.add_child(label)
	main_node.add_child(text_layer)
	main_node.text_layer = text_layer
	main_node.message_label = label

	# --- Mock UI node ---
	var ui_node = Node.new()
	ui_node.name = "UI"
	main_node.add_child(ui_node)
	main_node.ui = ui_node

	# --- Mock current_scene ---
	var scene = Node2D.new()
	scene.name = "MockScene"
	main_node.add_child(scene)
	main_node.current_scene = scene

# --- Player teszt ---
func test_player_creation():
	var p = Player.new("Piotr", 0, 50, 20, 10, 100, 5, 2)
	assert_eq(p.get_player_name(), "Piotr")
	assert(p.get_description().length() > 0)

# --- Family teszt ---
func test_family_creation():
	var f = Family.new("Mihalina", 0)
	assert_eq(f.get_family_member_name(), "Mihalina")
	assert(f.get_description().length() > 0)

# --- UI loaded teszt ---
func test_ui_loaded():
	var ui_node = main_node.get_node_or_null("UI")
	assert(ui_node != null)
	assert_eq(ui_node.name, "UI")

# --- Scene change teszt ---
func test_scene_change():
	main_node._change_scene = func(path):
		var new_scene = Node2D.new()
		new_scene.name = "OfficeScene"
		main_node.current_scene = new_scene
	main_node._change_scene("res://scenes/office/office.tscn")
	assert(main_node.current_scene != null)
	assert_eq(main_node.current_scene.name, "OfficeScene")

# --- Invalid scene path teszt ---
func test_scene_change_invalid_path():
	main_node._change_scene = func(path):
		main_node.current_scene = null
	main_node._change_scene("res://scenes/nonexistent.tscn")
	assert(main_node.current_scene == null)

# --- Children count teszt ---
func test_main_node_children():
	assert(main_node.get_child_count() >= 1)

# --- Boss event start teszt ---
func test_boss_event_start():
	main_node.start_boss_event(400)
	assert(main_node.boss_moving == true)
	assert(main_node.boss.get_node("AnimatedSprite2D") != null)

# --- Show boss message teszt ---
func test_show_boss_message():
	main_node.show_boss_message("Hello!")
	assert_eq(main_node.message_label.text, "Hello!")
