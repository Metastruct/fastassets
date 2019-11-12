AddCSLuaFile()

if SERVER then
	local function AddResourceDir(dir)
		if not file.Exists(dir, "GAME") then return end

		local dirs, files = file.Find(dir .. "/*","GAME")
        for _,f in pairs(files) do
            local path = dir .. "/" .. f
            resource.AddFile(path)
		end

		for _, d in pairs(dirs) do
			AddResourceDir(dir .. "/" .. d)
		end
	end

	AddResourceDir("sounds/fastassets")
	AddResourceDir("materials/fastassets")
	AddResourceDir("models/fastassets")
end