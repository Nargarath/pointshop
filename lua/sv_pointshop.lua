-- net hooks

net.Receive('PS_BuyItem', function(length, ply)
	ply:PS_BuyItem(net.ReadString())
end)

net.Receive('PS_SellItem', function(length, ply)
	ply:PS_SellItem(net.ReadString())
end)

net.Receive('PS_EquipItem', function(length, ply)
	ply:PS_EquipItem(net.ReadString())
end)

net.Receive('PS_HolsterItem', function(length, ply)
	ply:PS_HolsterItem(net.ReadString())
end)

net.Receive('PS_ModifyItem', function(length, ply)
	ply:PS_ModifyItem(net.ReadString(), net.ReadTable())
end)

net.Receive('PS_GivePoints', function(length, ply)
	local other = net.ReadEntity()
	local points = net.ReadInt(32)
	
	if ply:IsAdmin() and other and points and IsValid(other) and other:IsPlayer() then
		other:PS_GivePoints(points)
	end
end)

net.Receive('PS_TakePoints', function(length, ply)
	local other = net.ReadEntity()
	local points = net.ReadInt(32)
	
	if ply:IsAdmin() and other and points and IsValid(other) and other:IsPlayer() then
		other:PS_TakePoints(points)
	end
end)

net.Receive('PS_SetPoints', function(length, ply)
	local other = net.ReadEntity()
	local points = net.ReadInt(32)
	
	if ply:IsAdmin() and other and points and IsValid(other) and other:IsPlayer() then
		other:PS_SetPoints(points)
	end
end)

-- hooks

local KeyToHook = {
	F1 = "ShowHelp",
	F2 = "ShowTeam",
	F3 = "ShowSpare1",
	F4 = "ShowSpare2",
	None = "ThisHookDoesNotExist"
}

hook.Add(KeyToHook[PS.Config.ShopKey], "PS_ShopKey", function(ply)
	ply:PS_ToggleMenu()
end)

hook.Add('PlayerSpawn', 'PS_PlayerSpawn', function(ply) ply:PS_PlayerSpawn() end)
hook.Add('PlayerDeath', 'PS_PlayerDeath', function(ply) ply:PS_PlayerDeath() end)
hook.Add('PlayerInitialSpawn', 'PS_PlayerInitialSpawn', function(ply) ply:PS_Initialize() end)
hook.Add('PlayerDisconnected', 'PS_PlayerDisconnected', function(ply) ply:PS_Save() PS.ClientsideModels[ply] = nil end)

-- ugly networked strings

util.AddNetworkString('PS_Items')
util.AddNetworkString('PS_Points')
util.AddNetworkString('PS_BuyItem')
util.AddNetworkString('PS_SellItem')
util.AddNetworkString('PS_EquipItem')
util.AddNetworkString('PS_HolsterItem')
util.AddNetworkString('PS_ModifyItem')
util.AddNetworkString('PS_GivePoints')
util.AddNetworkString('PS_TakePoints')
util.AddNetworkString('PS_SetPoints')
util.AddNetworkString('PS_AddClientsideModel')
util.AddNetworkString('PS_RemoveClientsideModel')
util.AddNetworkString('PS_SendClientsideModels')
util.AddNetworkString('PS_ToggleMenu')
