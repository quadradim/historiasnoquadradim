extends Node

var player_src = "user://Player.dat"
var password = "40028922Yudi"
var historiameter = 0

func _load_file(load_type):
	if load_type == File.WRITE or load_type == File.READ:
		var file = File.new()
		var status = file.open_encrypted_with_pass(player_src, load_type, password)
		if status == OK:
			return file
		print('[USER ERROR] Error on load user file...')
		print(status)
	return false
	
func _ready():
	print('Hello!')

func verify():
	return "Player Class was loaded..."

func read():
	var file = _load_file(File.READ)
	if file:
		var content = file.get_var()
		file.close()
		return content
	return false
	
func insert(new_data):
	var file = _load_file(File.WRITE)
	if file:
		print('storing user data..')
		file.store_var(new_data)
		return true
	return false

func set_historiometer():
	pass
	
func set_username():
	pass
	
func set_elements():
	pass
