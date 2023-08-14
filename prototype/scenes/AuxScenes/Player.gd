extends Node

const save_dir = "user://saves/"
var player_src = save_dir + "Player.dat"
var password = "40028922Yudi"

func _load_file(load_type):
	if load_type == File.WRITE or load_type == File.READ:
		
		var dir = Directory.new()
		if !dir.dir_exists(save_dir):
			dir.make_dir_recursive(save_dir)
		
		var file = File.new()
		var status = file.open_encrypted_with_pass(player_src, load_type, password)
		if status == OK:
			return file
		print('[USER ERROR] Error on load user file...')
		print(status)
	return false
	
func _ready():
	pass

func read():
	var file = _load_file(File.READ)
	if file:
		var content = file.get_var()
		file.close()
		return content
	return false
	
func player_exists():
	var dir = Directory.new()
	return dir.file_exists(player_src)
	
func insert(new_data):
	var file = _load_file(File.WRITE)
	if file:
		file.store_var(new_data)
		file.close()
		return true
	file.close()
	return false
	
func modifier(key,value):
	var current_data = read()
	current_data[key] = value
	insert(current_data)
	
