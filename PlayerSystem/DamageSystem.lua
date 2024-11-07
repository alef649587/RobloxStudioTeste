local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local dashCooldown = false
local dashDistance = 70 --AQUI EU AJUSTO A DISTÂNCIA DO DASH
local dashDuration = 0.2 --POSSO AJUSTAR A DURAÇÃO DO DASH AQUI


local function dash() --FUNÇÃO DO DASH
    if dashCooldown then return end
    dashCooldown = true

    local rootPart = character:FindFirstChild("HumanoidRootPart")
    if rootPart then
        local dashDirection = rootPart.CFrame.LookVector * dashDistance
        rootPart.CFrame = rootPart.CFrame + dashDirection
    end

    -- TEMPO (COOLDOWN) PRA IMPEDIR O JOGADOR DE DAR VÁRIOS DASH CONTÍNUOS
    wait(dashDuration)
    dashCooldown = false
end

-- EVENTO PRA ATIVAR O DASH QUANDO PRESSIONAR A TECLA SHIFT
local UserInputService = game:GetService("UserInputService")

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.LeftShift then
        dash()
    end
end)
