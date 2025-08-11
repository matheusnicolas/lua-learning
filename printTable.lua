local insert = table.insert
local sort   = table.sort
local concat = table.concat
local unpack = table.unpack

function pairsByKey(t, f)
	local a = {}
	for n in pairs(t) do insert(a, n) end
	sort(a, f or sortAny)
	local i = 0 -- iterator variable
	local iter = function() -- iterator function
		i = i + 1
		if a[i] == nil then return nil
		else return a[i], t[a[i]] end
	end
	return iter
end

local function repeatString(s,t)
	local chars = {}
	for i=1,t do
		chars[i] = s
	end
	return concat(chars)
end

function printTable(...)
	encounteredTables = {}
	local args = {...}
	for i=1,#args do
		local a = args[i]
		if type(a) == 'table' then
			-- encounteredTables[a] = '/'..i
			args[i] = tableToString(a)
		end
	end
	print(unpack(args))
	encounteredTables = nil
end

function tableToString(o,path,t)
	path = path or '/'
	if encounteredTables[o] then
		return 'reference: '..encounteredTables[o]
	end
	encounteredTables[o] = path

	t = t or 1
	local lines = {'{'}
	local tabs = repeatString('\t', t)
	t = t + 1

	local line = #lines + 1
	for k,v in pairsByKey(o) do
		local ktype = type(k)
		local vtype = type(v)

		local key = ''
		if ktype ~= 'number' then
			key = '['..tostring(k)..'] = '
		end

		local value
		if vtype == 'table' then
			value = tableToString(v, path..k..'/', t)
		else
			value = tostring(v)
		end
		lines[line] = tabs..key..value..','
		line = line + 1
	end
	lines[line] = repeatString('\t', t-2)..'}'
	return concat(lines, '\n')
end
