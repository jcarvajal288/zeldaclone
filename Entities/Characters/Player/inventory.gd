class_name Inventory extends Node

var contents = {}

func add_item(item: Global.Item):
	if contents.has(item):
		contents[item] += 1
	else:
		contents[item] = 1
	print_contents()
	

func remove_item(item: Global.Item):
	if contents[item] > 0:
		contents[item] -= 1
	print_contents()
	
func contains(item: Global.Item):
	return contents.has(item)
	
func print_contents():
	print("BEGIN INVENTORY")
	for key in contents.keys():
		print("\t%s: %d" % [Global.Item.keys()[key], contents[key]])
	print("END INVENTORY")
