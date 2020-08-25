local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- ARRAY
-----------------------------------------------------------------------------------------------------------------------------------------
local valores = {
	{ item = "isca", quantidade = 10, compra = 500 },
	{ item = "garrafavazia", quantidade = 5, compra = 15 },
	{ item = "militec", quantidade = 1, compra = 2500 },
	{ item = "repairkit", quantidade = 1, compra = 2500 },
	{ item = "ferramenta", quantidade = 1, compra = 20 },
	{ item = "bandagem", quantidade = 3, compra = 3000 },
	{ item = "croquettes", quantidade = 1, compra = 40 },
	{ item = "rastreador", quantidade = 1, compra = 1200 },

	{ item = "mochila", quantidade = 1, compra = 10000 },
	{ item = "alianca", quantidade = 1, compra = 300 },
	{ item = "roupas", quantidade = 1, compra = 3000 },
	{ item = "cerveja", quantidade = 1, compra = 18 },
	{ item = "tequila", quantidade = 1, compra = 30 },
	{ item = "vodka", quantidade = 1, compra = 48 },
	{ item = "whisky", quantidade = 1, compra = 60 },
	{ item = "conhaque", quantidade = 1, compra = 72 },
	{ item = "absinto", quantidade = 1, compra = 90 },
	{ item = "energetico", quantidade = 1, compra = 150 },
	{ item = "agua", quantidade = 1, compra = 80 },
	{ item = "limonada", quantidade = 1, compra = 60 },
	{ item = "refrigerante", quantidade = 1, compra = 40 },
	{ item = "cafe", quantidade = 1, compra = 25 },

	{ item = "chocolate", quantidade = 1, compra = 30 },
	{ item = "salgadinho", quantidade = 1, compra = 50 },
	{ item = "rosquinha", quantidade = 1, compra = 70 },
	{ item = "pizza", quantidade = 1, compra = 120 },
	{ item = "pao", quantidade = 1, compra = 90 },
	{ item = "sanduiche", quantidade = 1, compra = 100 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- COMPRAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("departamento-comprar")
AddEventHandler("departamento-comprar",function(item)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		for k,v in pairs(valores) do
			if item == v.item then
				if vRP.getInventoryWeight(user_id)+vRP.getItemWeight(v.item)*v.quantidade <= vRP.getInventoryMaxWeight(user_id) then
					if vRP.tryPayment(user_id,parseInt(v.compra)) then
						vRP.giveInventoryItem(user_id,v.item,parseInt(v.quantidade))
						TriggerClientEvent("Notify",source,"sucesso","Comprou <b>"..parseInt(v.quantidade).."x "..vRP.getItemName(v.item).."</b> por <b>$"..vRP.format(parseInt(v.compra)).." dólares</b>.")
					else
						TriggerClientEvent("Notify",source,"negado","Dinheiro insuficiente.")
					end
				else
					TriggerClientEvent("Notify",source,"negado","Espaço insuficiente.")
				end
			end
		end
	end
end)