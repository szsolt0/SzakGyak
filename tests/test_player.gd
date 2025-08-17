extends GutTest

const Player = preload("res://scripts/player.gd")
func test_description():
	var piotr = Player.new("Piotr", 100, 0, 0, 50, 200, 5, 2)
	
	# get_description test
	var desc = piotr.get_description()
	assert_eq(desc, "Player: Piotr | Alcohol: 100 | Hunger: 0 | Stress: 0 | Reputation: 50 | Money: 200 | Bread: 5 | Vodka: 2")

func test_getters():
	var piotr = Player.new("Piotr", 100, 0, 0, 50, 200, 5, 2)

	# Getter tests
	assert_eq(piotr.get_player_name(), "Piotr")
	assert_eq(piotr.get_alcohol(), 100)
	assert_eq(piotr.get_hunger(), 0)
	assert_eq(piotr.get_stress(), 0)
	assert_eq(piotr.get_reputation(), 50)
	assert_eq(piotr.get_money(), 200)
	assert_eq(piotr.get_bread(), 5)
	assert_eq(piotr.get_vodka(), 2)

func test_setters():
	var piotr = Player.new("Piotr", 100, 0, 0, 50, 200, 5, 2)

	# Setter tests
	piotr.set_player_name("Janek")
	piotr.set_alcohol(80)
	piotr.set_hunger(10)
	piotr.set_stress(20)
	piotr.set_reputation(40)
	piotr.set_money(150)
	piotr.set_bread(3)
	piotr.set_vodka(1)

	assert_eq(piotr.get_player_name(), "Janek")
	assert_eq(piotr.get_alcohol(), 80)
	assert_eq(piotr.get_hunger(), 10)
	assert_eq(piotr.get_stress(), 20)
	assert_eq(piotr.get_reputation(), 40)
	assert_eq(piotr.get_money(), 150)
	assert_eq(piotr.get_bread(), 3)
	assert_eq(piotr.get_vodka(), 1)
