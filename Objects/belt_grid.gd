extends Node2D


const BLACK := Color(0, 0, 0, 1)
const WHITE := Color(1, 1, 1, 1)

# The BeltGrid is composed of cells.
# Each cell represents a square of the grid.
# Objects inside a cell will be affected by whatever code is running in that cell.

# Number of horizontal cells
@export var width = 8
# Number of vertical cells
@export var height = 8

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	create_cells()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func create_cells() -> void:
	"""
	Spawns all the cells in this grid
	"""
	# Begin with a black cell
	var color = WHITE
	var last_color = color
	# TODO: This should be computed based on the size of the grid and screen.
	const cell_size = Vector2(100, 100)
	# Each horizontal step makes a column
	for column in range(width):
		# Update color based on last color. This helps enforce the checkerboard
		# pattern no matter what the grid dimensions are.
		color = BLACK if last_color == WHITE else WHITE
		last_color = color
		# Each vertical step makes a row
		for row in range(height):
			# Create the cell
			var cell = GridCell.Create(color, cell_size)
			# Move the cell to the appropriate location in the grid
			var location = get_cell_location(row, column, cell_size)
			print(location)
			cell.translate(location)
			# Add the cell to the scene
			add_child(cell)
			color = BLACK if color == WHITE else WHITE


## Computes the location of the cell based on its location in the grid, and
## the size of each cell
func get_cell_location(row: int, column: int, cell_size: Vector2) -> Vector2:
	return Vector2(column * cell_size.x, row * cell_size.y)
