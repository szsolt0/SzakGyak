extends GutTest

@onready var save_dir := DirAccess.open(SaveManager.SAVE_DIR)

func test_save_create() -> void:
	SaveManager.create_save_file("john_doe_save", "John Doe's Save")
	SaveManager.create_save_file("asdf", "ASDF's Save")
	
	assert_true(save_dir.file_exists("john_doe_save.save"))
	assert_true(save_dir.file_exists("asdf.save"))

func test_save_meta_exists() -> void:
	var doe_save := false
	var asdf_save := false
	
	var saves := SaveManager.get_list_of_save_files()
	
	assert_not_null(saves)
	
	for save in saves:
		if save.name == "John Doe's Save" and save.file == "john_doe_save":
			doe_save = true
			continue
		
		if save.name == "ASDF's Save" and save.file == "asdf":
			asdf_save = true
			continue
	
	assert_true(doe_save and asdf_save)

func test_save_load_file() -> void:
	var err := SaveManager.load_save_file("john_doe_save")
	assert_eq(err, OK)

func test_store_and_load_data() -> void:
	# dummy data
	const stats: Dictionary[StringName, Variant] = {&"health": 42, &"xp": 999999999}
	const inventory: Dictionary[StringName, Variant] = {&"items": ["apple", "banana"]}
	
	# save data
	SaveManager.save_state(&"stats", stats)
	SaveManager.save_state(&"inventory", inventory)
	
	# load data
	
	var stats_saved := SaveManager.load_state(&"stats")
	assert_eq_deep(stats, stats_saved)
	
	var inventory_saved := SaveManager.load_state(&"inventory")
	assert_eq_deep(inventory, inventory_saved)
	
	assert_true(true)

func test_save_erase() -> void:
	SaveManager.remove_save_file("john_doe_save")
	SaveManager.remove_save_file("asdf")
	
	assert_true(not save_dir.file_exists("john_doe_save.save"))
	assert_true(not save_dir.file_exists("asdf.save"))
