extends Control

func _on_UIOpening_run_game():
	owner.get_node("StateMachine").current_state.emit_signal("finished","Playing")
	$UIOpening.hide()

func display_Opening():
	$UIOpening.show()

func display_Ending():
	$UIEnding.show()
	
func hide_Ending():
	$UIEnding.hide()
