extends Node
class_name PlayerTest

const Player = preload("res://scripts/player.gd")

@test
func test_getters_and_description():
	var piotr = Player.new("Piotr", 100, 0, 0, 50, 200, 5, 2)

	# Getter tesztek
	assert(piotr.get_player_name() == "Piotr")
	assert(piotr.get_alcohol() == 100)
	assert(piotr.get_hunger() == 0)
	assert(piotr.get_stress() == 0)
	assert(piotr.get_reputation() == 50)
	assert(piotr.get_money() == 200)
	assert(piotr.get_bread() == 5)
	assert(piotr.get_vodka() == 2)

	# get_description teszt
	var desc = piotr.get_description()
	assert(desc == "Player: Piotr | Alcohol: 100 | Hunger: 0 | Stress: 0 | Reputation: 50 | Money: 200 | Bread: 5 | Vodka: 2")

@test
func test_setters():
	var piotr = Player.new("Piotr", 100, 0, 0, 50, 200, 5, 2)

	# Setter tesztek
	piotr.set_player_name("Janek")
	piotr.set_alcohol(80)
	piotr.set_hunger(10)
	piotr.set_stress(20)
	piotr.set_reputation(40)
	piotr.set_money(150)
	piotr.set_bread(3)
	piotr.set_vodka(1)

	assert(piotr.get_player_name() == "Janek")
	assert(piotr.get_alcohol() == 80)
	assert(piotr.get_hunger() == 10)
	assert(piotr.get_stress() == 20)
	assert(piotr.get_reputation() == 40)
	assert(piotr.get_money() == 150)
	assert(piotr.get_bread() == 3)
	assert(piotr.get_vodka() == 1)
