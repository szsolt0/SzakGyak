extends GutTest

const Family = preload("res://scripts/family.gd")

func test_description():
	var Test1 = Family.new("Smith", 50)
	
	# get_description test
	var desc = Test1.get_description()
	assert_eq(desc, "Family Member: Smith | Hunger: 50")

func test_getters():
	var fam = Family.new("Smith", 50)

	# Getter tests
	assert_eq(fam.get_family_member_name(), "Smith")
	assert_eq(fam.get_hunger(), 50)

func test_setters():
	var fam = Family.new("Smith", 50)

	# Setter tests
	fam.set_family_member_name("Johnson")
	fam.set_hunger(75)

	assert_eq(fam.get_family_member_name(), "Johnson")
	assert_eq(fam.get_hunger(), 75)
