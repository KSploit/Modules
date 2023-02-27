local Player = game.Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")
local ChatGui = PlayerGui:WaitForChild("Chat")
local ChatBar = ChatGui:FindFirstChild("ChatBar", true)

local StarterGui = game:GetService("StarterGui")

function SendClientMessage(Message, Color, Font)
	return pcall(function()
		StarterGui:SetCore("ChatMakeSystemMessage", 
			{
				["Text"] = Message, 
				["Color"] = Color or Color3.fromRGB(255, 255, 255), 
				["Font"] = Font or Enum.Font.SourceSansBold
			}
		)
	end)
end

_G.Prefix = ";"
_G.ChatCommands = {
	help = function(name)
		local Message = "Here's a list of commands:"
		for Command,Func in pairs(_G.ChatCommands) do
			Message=Message.."\n	".._G.Prefix..Command
		end
		SendClientMessage(Message,Color3.new(0.521569, 1, 0.466667))
	end,
}

ChatBar.FocusLost:Connect(function(EnterPressed)
	if EnterPressed then
		local Message = ChatBar.Text
		local UsingPrefix = Message:sub(1,1):lower() == _G.Prefix
		
		if UsingPrefix then
			ChatBar.Text = ""
			local SplitMessage = Message:sub(2,#Message):split(" ")
			local CommandUsed = SplitMessage[1]

			for Command, Func in pairs(_G.ChatCommands) do
				if Command:lower() == CommandUsed:lower() then
					table.remove(SplitMessage, 1)
					Func(unpack(SplitMessage))
					
					return
				end
			end
			
			SendClientMessage(_G.Prefix..CommandUsed.." is not a valid command", Color3.new(1, 0.376471, 0.376471))
		end
	end
end)