local Janitor = {}
Janitor.__index = Janitor

Janitor.Garbage = {}

function Janitor.add(Trash)
    local self = Janitor
    table.insert(self.Garbage, Trash)
    return #self.Garbage
end

function Janitor.clean()
    local self = Janitor
    for i,trash in pairs(self.Garbage) do
        trash:Disconnect()
        table.remove(self.Garbage, i)
    end
    return true
end

return Janitor
