local UiController = {}
UiController.__index = UiController

UiController.Styles = {
    GuiButton = {
        Hover = {

        },
        HoverOut = {

        },
        Click = {
            
        },
    }
}
UiController.Style = UiController.Styles.Default

local Janitor = loadstring(game:HttpGet('https://raw.githubusercontent.com/KSploit/Modules/main/Janitor.lua'))()

function UiController.Styles:new(StyleName)
    local Style = {}

    return Style
end

function UiController.Styles:use(Style)
    UiController.Style = Style
end

function UiController.Button(GuiButton, Callback)
    local HoverConnection = GuiButton.MouseEnter:Connect(function()
        print("Enter")
    end)

    Janitor.add(HoverConnection)

    local HoverOutConnection = GuiButton.MouseLeave:Connect(function()
        print("Leave")
    end)

    Janitor.add(HoverConnection)

    local ClickConnection = GuiButton.MouseButton1Click:Connect(Callback)

    Janitor.add(ClickConnection)
end

return UiController
