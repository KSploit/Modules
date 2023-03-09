local Util = {}

function Util.get(url)
    if url and url ~= '' then
        local content = game:HttpGet(url)
        return loadstring(content)()
    end
end

return Util
