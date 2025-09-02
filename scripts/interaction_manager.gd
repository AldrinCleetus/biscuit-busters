extends Node2D

@onready var player = get_tree().get_first_node_in_group('player')
@onready var label = $Label

const base_text = "[E] to "


var active_areas = []
var can_interact = true

func register_area(area: InteractionArea):
	active_areas.push_back(area)


func unregister_area(area: InteractionArea):
	var index_of_this_area = active_areas.find(area)
	if(index_of_this_area != -1):
		active_areas.remove_at(index_of_this_area)



func _process(_delta: float) -> void:
	print(active_areas.size())
	if(active_areas.size() > 0 && can_interact):
		# write a custom function to check which area to take
		label.text = base_text + active_areas[0].action_name
		label.global_position = active_areas[0].global_position
		label.show()
	else:
		label.hide()


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") && can_interact:
		if active_areas.size() > 0:
			can_interact = false
			label.hide()

			await active_areas[0].interact.call()

			can_interact = true
