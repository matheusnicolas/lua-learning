function dump(o)
    if type(o) == 'table' then
        local s = '{ '
        for k, v in pairs(o) do
            if type(k) ~= 'number' then k = '"' .. k .. '"' end
            s = s .. '[' .. k .. '] = ' .. dump(v) .. ','
        end
        return s .. '} '
    else
        return tostring(o)
    end
end

local enemies = {
    {
        id = "MESMS",
        x = 200.0,
        y = 100.0,
    },
    {
        id = "9fwrv",
        x = 200.0,
        y = 30.0,
    },
}

-- for key, value in pairs(items) do
--     print(key)
-- end

for _, enemy in ipairs(enemies) do
    print(string.format("id: %s, x: %s and y: %s", enemy.id, enemy.x, enemy.y))
end
-- print(dump(items))
