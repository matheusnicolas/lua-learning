function get_distance(coordinates_a, coordinates_b)
    local x_diff = coordinates_a["x"] - coordinates_b["x"]
    local y_diff = coordinates_a["y"] - coordinates_b["y"]
    local distance = math.sqrt(x_diff * x_diff + y_diff * y_diff)
    return distance
end

local entity_a_coordinates = {}
local entity_b_coordinates = {}

entity_a_coordinates["x"] = 10
entity_a_coordinates["y"] = 15

entity_b_coordinates["x"] = 20
entity_b_coordinates["y"] = 25

print(get_distance(entity_a_coordinates, entity_b_coordinates))
