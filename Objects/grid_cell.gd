extends Node2D

# I guess this gives my scene a type?
class_name GridCell

# Reference to the actual scene/object that this script is attached to.
static var _GridCell: PackedScene = preload("res://Objects/grid_cell.tscn")

# Spawn a new GridCell
static func Create(color: Color, rect: Vector2) -> GridCell:
	# Create an instance of the GridScell object
	var cell = _GridCell.instantiate()
	# Get the background node
	var background: Sprite2D = cell.get_node("Background")
	# Set the size of the background to the given size
	# This works because the background sprite is a 1x1 pixel
	background.scale = rect
	# Set the background color of the cell.
	# This works because when you "modulate" a color with a 1x1 white pixel,
	# it just becomes that color.
	background.modulate = color
	return cell


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
