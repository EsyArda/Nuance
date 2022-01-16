extends Control

class_name PlayingUI

var time_start


func change_level(num:int):
	$Level/Num.text = str(num)

func increase_death_cmpt():
	$NbDeath/Num.text = str(int($NbDeath/Num.text) + 1)

func _process(_delta):
	if time_start:
		var v = (OS.get_ticks_msec() - time_start)/1000
		$Time/Num.text = str(v/60) + "m " + str(v%60) + "s"
