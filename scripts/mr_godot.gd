extends Sprite2D


@onready var interaction_area = $Interaction_Area




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interaction_area.interact = Callable(self,"onInteract")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func onInteract():
	print('Helloooo')
