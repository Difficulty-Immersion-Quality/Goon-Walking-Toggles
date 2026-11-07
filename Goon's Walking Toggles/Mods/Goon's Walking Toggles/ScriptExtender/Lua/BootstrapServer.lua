local WALKING_PASSIVES = {
	"Goon_WalkingToggle_Walk",
	"Goon_WalkingToggle_Stroll",
    "Goon_WalkingToggle_Immunity",
}

local function ApplyWalkingPassives(entityID)
	entityID = entityID:sub(-36)

	for _, passive in ipairs(WALKING_PASSIVES) do
		if Osi.HasPassive(entityID, passive) == 0 then
			Osi.AddPassive(entityID, passive)
		end
	end
end

Ext.Osiris.RegisterListener("LevelGameplayStarted", 2, "after", function()
	for _, row in ipairs(Osi.DB_PartyMembers:Get(nil)) do
		ApplyWalkingPassives(row[1])
	end
end)

Ext.Osiris.RegisterListener("CharacterJoinedParty", 1, "after", ApplyWalkingPassives)