-- Wait until the game is fully loaded
repeat task.wait() until game:IsLoaded()

-- Table that maps Game IDs or Place IDs to script URLs
local Games = {
    [2753915549] = "https://raw.githubusercontent.com/Red-hubz/Redzhub/refs/heads/main/Redzhub.lua",
    [8737602449] = "https://darkscripts.space/scripts/d08f2638-bbb9-485c-ab73-f069d8e82845_1081923607963389983.lua",
    [16732694052] = "https://darkscripts.space/scripts/7d2d1dd4-5f8d-497d-b0a8-68a8bb1e11c3_1081923607963389983.lua",
}

-- Check if the current game matches any in the Games table
for gameID, scriptURL in pairs(Games) do
    -- Match either by GameId or PlaceId
    if gameID == game.GameId or gameID == game.PlaceId then
        -- Execute the corresponding script
        local success, errorMsg = pcall(function()
            loadstring(game:HttpGet(scriptURL))()
        end)

        -- Handle any errors that occur during script loading
        if not success then
            warn("Failed to load script: " .. errorMsg)
        end

        break -- Stop the loop once a match is found and the script is executed
    end
end