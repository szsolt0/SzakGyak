# This script manages the HUD.

extends CanvasLayer
class_name Hud

const Player := preload("res://scripts/player.gd")
const Family := preload("res://scripts/family.gd")

@onready var hud := $Root
@onready var hud_tabs := $Root/Tabs
@onready var player_entry: HudEntryPlayer = null
@onready var player_node := $Root/ColorRect/Player

@onready var tab_nodes: Array[Node] = [
	$Root/ColorRect/Player,
	$Root/ColorRect/F1,
	$Root/ColorRect/F2,
	$Root/ColorRect/F3,
]

@onready var family_entries: Array[HudEntryFamily] = [
	null,
	null,
	null,
]

var hud_visible := false

func switch_tab(id: int) -> void:
	# hide all tabs
	for tab in tab_nodes:
		tab.hide()
	
	# show the one we want
	tab_nodes[id].show()

func _load_translation() -> void:
	pass

func _ready() -> void:
	_load_translation()
	hide_hud()
	switch_tab(0)
	
	player_entry = preload("res://scenes/menu/hud_entry_player.tscn").instantiate()
	player_node.add_child(player_entry)
	
	for i in range(family_entries.size()):
		var entry := preload("res://scenes/menu/hud_entry_family.tscn").instantiate() as HudEntryFamily
		family_entries[i] = entry
		tab_nodes[i + 1].add_child(entry)

func update_player(p: Player) -> void:
	player_entry.set_player_name(p.get_player_name())
	player_entry.set_hunger(p.get_hunger())
	player_entry.set_stress(p.get_stress())
	player_entry.set_alcohol(p.get_alcohol())
	player_entry.set_reputation(p.get_reputation())
	player_entry.set_money(p.get_money())
	player_entry.set_bread(p.get_bread())
	player_entry.set_vodka(p.get_vodka())

func update_family_member(id: int, family_member: Family) -> void:
	var f := family_entries[id - 1]
	f.set_family_name(family_member.get_family_member_name())
	f.set_hunger(family_member.get_hunger())

func show_hud() -> void:
	hud_visible = true
	hud.position.y = 0

func hide_hud() -> void:
	var screen_height := get_viewport().size.y as int
	
	hud_visible = false
	hud.position.y = screen_height - hud_tabs.size.y

func _on_up_down_pressed() -> void:
	if hud_visible:
		hide_hud()
	else:
		show_hud()

func _on_f_1_pressed() -> void:
	show_hud()
	switch_tab(1)


func _on_f_2_pressed() -> void:
	show_hud()
	switch_tab(2)


func _on_f_3_pressed() -> void:
	show_hud()
	switch_tab(3)

func _on_player_pressed() -> void:
	show_hud()
	# the player is the 0th family member
	switch_tab(0)
