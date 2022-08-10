slot_one = {}
slot_two = {}

function shear_plant()
	rs.setOutput("top", true)
	while turtle.detect ~= false
	sleep(0.1)
	end
	rs.setOutput("top", false)
end

while true do
	slot_one = turtle.getItemDetail(1)
	slot_two = turtle.getItemDetail(2)
	
	if slot_two["name"] == "minecraft:bone" and slot_one["name"] == "botania:petal" then
		turtle.select(1)
		turtle.place()
		turtle.select(2)
		turtle.place()
		shear_plant()
		turtle.select(15)
		turtle.suck()
	end
end

