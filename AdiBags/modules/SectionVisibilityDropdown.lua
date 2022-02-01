--[[
AdiBags - Adirelle's bag addon.
Copyright 2010-2021 Adirelle (adirelle@gmail.com)
All rights reserved.

This file is part of AdiBags.

AdiBags is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

AdiBags is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with AdiBags.  If not, see <http://www.gnu.org/licenses/>.
--]]

local addonName, addon = ...
local L = addon.L

--<GLOBALS
local _G = _G
local CLOSE = _G.CLOSE
local CreateFrame = _G.CreateFrame
local format = _G.format
local ipairs = _G.ipairs
local pairs = _G.pairs
local tinsert = _G.tinsert
local ToggleDropDownMenu = _G.ToggleDropDownMenu
local tsort = _G.table.sort
local UIDropDownMenu_AddButton = _G.UIDropDownMenu_AddButton
local wipe = _G.wipe
--GLOBALS>

local SplitSectionKey = addon.SplitSectionKey

local mod = addon:NewModule('SectionVisibilityDropdown', 'ABEvent-1.0')
mod.uiName = L['Toggle Stuff']
mod.uiDesc = L['Add a button to toggle the Stuff section.']

local buttons = {}
local frame
local Button_OnClick

function mod:OnEnable()
	addon:HookBagFrameCreation(self, 'OnBagFrameCreated')
	for button in pairs(buttons) do
		button:Show()
	end
end

function mod:OnDisable()
	for button in pairs(buttons) do
		button:Hide()
	end
end

function mod:OnBagFrameCreated(bag)
	if tostring(bag) == "AdiBags_Bank" then return end
	local container = bag:GetFrame()
	local button = container:CreateModuleButton("transmog-icon-hidden", 5, Button_OnClick, {
		L["|cffffd100Show or hide your Stuff|r"]
	})
	button.container = container
	buttons[button] = true
end

function Button_OnClick(button)
	local key1 = "Junk#Stuff"
	local section1 = button.container.sections[key1]
	local key2 = "Junk#Bank Stuff"
	local section2 = button.container.sections[key2]
	if section1 then
		if section2 then
			section2:SetCollapsed(not section1:IsCollapsed())
		else
			addon.db.char.collapsedSections[key2] = not addon.db.char.collapsedSections[key1]
		end
		section1:SetCollapsed(not section1:IsCollapsed())
	else
		addon.db.char.collapsedSections[key2] = not addon.db.char.collapsedSections[key1]
		addon.db.char.collapsedSections[key1] = not addon.db.char.collapsedSections[key1]
		mod:SendMessage('AdiBags_LayoutChanged')
	end
end
