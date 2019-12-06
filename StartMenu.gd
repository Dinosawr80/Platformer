# StartMenu Script
extends Control

# Whenever the button is pressed, the function runs
func _on_StartGameButton_pressed():
	get_tree().change_scene("World.tscn")


func _on_QuitGameButton_pressed():
	get_tree().quit()
