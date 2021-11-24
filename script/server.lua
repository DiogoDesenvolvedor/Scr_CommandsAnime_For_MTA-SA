--[[
    
.........................................................................
.........................................................................
.........................................................................
.........   ____    ___    ___     ____   _   _   ___   _   _   .........
.........  |  _ \  |_ _|  / _ \   / ___| | | | | |_ _| | \ | |  .........
.........  | | | |  | |  | | | | | |  _  | | | |  | |  |  \| |  .........
.........  | |_| |  | |  | |_| | | |_| | | |_| |  | |  | |\  |  .........
.........  |____/  |___|  \___/   \____|  \___/  |___| |_| \_|  .........
.........................................................................
.........................................................................
.........................................................................

--]]

local resource = {}
resource["functions"] = {}
resource["variaveis"] = {}
resource["variaveis"]["timer"] = {}

resource["functions"]["start"] = function (res)
    if (res == getThisResource()) then 
        outputDebugString("Script iniciado com sucesso Dioguin Resources", 3, 255,255,255)
        if config["home"]["prefix"] then 
            addCommandHandler(config["home"]["prefix"], function (player, cmd, ...)
                if player and cmd and ... then 
                    local arg = table.concat({...})
                    if config["animes"][arg] then
                        if not resource["variaveis"]["timer"][player] then
                            local conf = config["animes"][arg]
                            local anime = setPedAnimation (player, conf[1],conf[2],conf[3],conf[4],conf[5],conf[6])   
                            resource["variaveis"]["timer"][player] = setTimer(function(player)
                                resource["variaveis"]["timer"][player] = nil
                            end, config["home"]["timer"], 1, player)
                        end
                    end
                end
            end)
        end
    end
end
addEventHandler("onResourceStart", getRootElement(), resource["functions"]["start"])

