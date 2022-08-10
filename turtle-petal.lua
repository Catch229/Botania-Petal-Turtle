-- Computercraft + Mechnical User to automate growing of botania petals
-- requires a mechnical user with shears above to harvest
-- Inputs: Petal goes in slot 1, bone meal goes in slot 2.
-- Outputs: Tall plant to slot 15.

slot_one = {}
slot_two = {}

function shear_plant()
	rs.setOutput("top", true)
	while turtle.detect() ~= false do
		sleep(0.1)
	end
	rs.setOutput("top", false)
	sleep(0.75)							-- Wait for item to drop.
end


if turtle.detect() then					-- Check for a plant already placed (can fail if only the petal was placed with no bone meal mining turtle might be a fix)
	shear_plant()
	turtle.select(15)
	turtle.suck()
end

while true do
	slot_one = turtle.getItemDetail(1)
	slot_two = turtle.getItemDetail(2)
	sleep(0.5)
	
	if slot_one and slot_two then
		if slot_two["name"] == "minecraft:dye" and slot_one["name"] == "botania:petal" then
			turtle.select(1)
			turtle.place()
			turtle.select(2)
			turtle.place()
			shear_plant()
			turtle.select(15)
			turtle.suck()
		end
	end
end

