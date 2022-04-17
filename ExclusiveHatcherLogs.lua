local OSTime = os.time()
    		local Time = os.date('!*t', OSTime)
    		local Webhook = "https://discord.com/api/webhooks/960377772084191272/FPLbhMK8p5qnUWPyjCvlZelmNQFaB86ExcC7Unq6j-Pojk_pw1ZDJbXYbg1e8MQ84ij0"
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
    						["text"] = "Pet Simulator X Hatcher Logs | " .. FooterRarity,
    					},
    					['timestamp'] = string.format('%d-%d-%dT%02d:%02d:%02dZ', Time.year, Time.month, Time.day, Time.hour, Time.min, Time.sec),
    				}
    			}
    		}
    		request = http_request or request or HttpPost or syn.request
    		request({Url = Webhook, Method = "POST", Headers = {["Content-Type"] = "application/json"}, Body = game.HttpService:JSONEncode(msg)})
