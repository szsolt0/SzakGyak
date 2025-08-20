extends GutTest

const Family = preload("res://scripts/family.gd")

func test_description():
	var fam = Family.new(50, 20, 30, 40)
	
	# get_description test
	var desc = fam.get_description()
	assert_eq(desc, "Mother Hunger: 50 | Child1 Hunger: 20 | Child2 Hunger: 30 | Child3 Hunger: 40")

func test_getters():
	var fam = Family.new(50, 20, 30, 40)

	# Getter tests
	assert_eq(fam.get_mother_hunger(), 50)
	assert_eq(fam.get_child1_hunger(), 20)
	assert_eq(fam.get_child2_hunger(), 30)
	assert_eq(fam.get_child3_hunger(), 40)

func test_setters():
	var fam = Family.new(50, 20, 30, 40)

	# Setter tests
	fam.set_mother_hunger(60)
	fam.set_child1_hunger(25)
	fam.set_child2_hunger(35)
	fam.set_child3_hunger(45)

	assert_eq(fam.get_mother_hunger(), 60)
	assert_eq(fam.get_child1_hunger(), 25)
	assert_eq(fam.get_child2_hunger(), 35)
	assert_eq(fam.get_child3_hunger(), 45)
