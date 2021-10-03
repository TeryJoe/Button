extends Label

func _ready():
	pass
	
func _process(delta):
	text = str(get_parent().CurrencyDisplay) + " Smile Tiles"
