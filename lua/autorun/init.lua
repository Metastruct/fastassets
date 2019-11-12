AddCSLuaFile()

if SERVER then
	local blacklist = {
		"ztmp",
		"bz2"
	}

	local function IsBadFile(f)
		for _, format in pairs(blacklist) do
			if f:EndsWith(format) then return true end
		end

		return false
	end

	local function AddResourceDir(dir)
		if not file.Exists(dir, "GAME") then return end

		local dirs, files = file.Find(dir .. "/*","GAME")
		for _,f in pairs(files) do
			if not IsBadFile(f) then
				local path = dir .. "/" .. f
				resource.AddFile(path)
			end
		end

		for _, d in pairs(dirs) do
			AddResourceDir(dir .. "/" .. d)
		end
	end

	AddResourceDir("sounds/fastassets")
	AddResourceDir("materials/fastassets")
	AddResourceDir("models/fastassets")
end