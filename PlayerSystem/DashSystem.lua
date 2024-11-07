local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

mouse.Button1Down:Connect(function()
    local target = mouse.Target
    if target and target:IsA("Model") and target:FindFirstChild("Humanoid") then
        local humanoid = target:FindFirstChild("Humanoid")
        if humanoid then
            humanoid:TakeDamage(10) --POSSO AJUSTAR O DANO QUE O JOGADOR DA POR AQUI.
        end
    end
end)
