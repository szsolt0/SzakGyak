extends GutTest

const Player = preload("res://scripts/player.gd")
const Family = preload("res://scripts/family.gd")

func test_game():
	var piotr = Player.new("Piotr", 0, 50, 20, 10, 100, 5, 2)
	assert_eq(piotr.get_player_name(), "Piotr")
	assert_eq(piotr.get_hunger(), 50)
	assert_eq(piotr.get_money(), 100)


	var family_members = [
		Family.new("Anna", 30),
		Family.new("Marek", 20),
		Family.new("Kasia", 40),
		Family.new("Tomek", 25)
	]

	# Assert a családtagokra is
	for member in family_members:
		assert(member != null)
