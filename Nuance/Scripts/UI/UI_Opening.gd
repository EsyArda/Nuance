extends Control

signal run_game

func _on_Button_pressed():
	emit_signal("run_game")
