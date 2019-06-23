
---------------------------------
-- Settings 
---------------------------------

ClassicLFG.QueueWindow.Settings:SetScript("OnShow", function(self, _, channel)
    ClassicLFG.QueueWindow.Settings.Broadcastchannel:SetItems(ClassicLFG.ChannelManager:GetChannelNames())
    ClassicLFG.QueueWindow.Settings.Broadcastchannel:SetValue(ClassicLFG.ChannelManager:GetChannelName((ClassicLFG.DB.profile.BroadcastDungeonGroupChannel)))
    ClassicLFG.QueueWindow.Settings.BroadcastSlider.Frame:SetValue(ClassicLFG.DB.profile.BroadcastDungeonGroupInterval)	
    ClassicLFG.QueueWindow.Settings.Invitemessage.Frame:SetText(ClassicLFG.DB.profile.InviteText)
end)

ClassicLFG.QueueWindow.Settings.Broadcastchannel = ClassicLFGDropdownMenue(ClassicLFG.Locale["Select Broadcastchannel"], ClassicLFG.QueueWindow.Settings, ClassicLFG.Locale["Broadcastchannel"])
ClassicLFG.QueueWindow.Settings.Broadcastchannel.Frame:SetPoint("TOPLEFT", ClassicLFG.QueueWindow.Settings, "TOPLEFT", 0, -10)
ClassicLFG.QueueWindow.Settings.Broadcastchannel.Frame:SetPoint("BOTTOMRIGHT", ClassicLFG.QueueWindow.Settings, "TOPRIGHT", 0, -32)
ClassicLFG.QueueWindow.Settings.Broadcastchannel.OnValueChanged = function(_, _, channel)
    ClassicLFG.DB.profile.BroadcastDungeonGroupChannel = ClassicLFG.ChannelManager:GetChannelId(channel)
end

ClassicLFG.EventBus:RegisterCallback(ClassicLFG.Config.Events.ChannelListChanged, ClassicLFG.QueueWindow.Settings.Broadcastchannel, function(self, channels)
    ClassicLFG.QueueWindow.Settings.Broadcastchannel:SetItems(ClassicLFG.ChannelManager:GetChannelNames())
    self:SetItems(ClassicLFG.ChannelManager:GetChannelNames())
    ClassicLFG.QueueWindow.Settings.Broadcastchannel:SetValue(ClassicLFG.ChannelManager:GetChannelName(ClassicLFG.DB.profile.BroadcastDungeonGroupChannel))
end)

ClassicLFG.QueueWindow.Settings.BroadcastSlider = ClassicLFGSlider(ClassicLFG.Locale["Broadcastinterval"], nil, ClassicLFG.QueueWindow.Settings)
ClassicLFG.QueueWindow.Settings.BroadcastSlider.Frame:SetPoint("TOPLEFT", ClassicLFG.QueueWindow.Settings.Broadcastchannel.Frame, "BOTTOMLEFT", 0, -25);
ClassicLFG.QueueWindow.Settings.BroadcastSlider.Frame:SetPoint("BOTTOMRIGHT", ClassicLFG.QueueWindow.Settings.Broadcastchannel.Frame, "BOTTOMRIGHT", 0, -47)
ClassicLFG.QueueWindow.Settings.BroadcastSlider:SetSliderValues(60, 180, 1)
ClassicLFG.QueueWindow.Settings.BroadcastSlider.Frame:SetValue(5)
ClassicLFG.QueueWindow.Settings.BroadcastSlider.OnValueChanged = function(_, value)
	ClassicLFG.DB.profile.BroadcastDungeonGroupInterval = value
end

ClassicLFG.QueueWindow.Settings.Invitemessage = ClassicLFGEditBox(nil, ClassicLFG.QueueWindow.Settings, ClassicLFG.Locale["Invitemessage"])
ClassicLFG.QueueWindow.Settings.Invitemessage.Frame:SetPoint("TOPLEFT", ClassicLFG.QueueWindow.Settings.BroadcastSlider.Frame, "BOTTOMLEFT", 0, -38);
ClassicLFG.QueueWindow.Settings.Invitemessage.Frame:SetPoint("BOTTOMRIGHT", ClassicLFG.QueueWindow.Settings.BroadcastSlider.Frame, "BOTTOMRIGHT", 0, -60)
ClassicLFG.QueueWindow.Settings.Invitemessage.Frame:SetMaxLetters(25)
ClassicLFG.QueueWindow.Settings.Invitemessage:SetPlaceholder(ClassicLFG.Locale["Invitemessage"])

ClassicLFG.QueueWindow.Settings.Invitemessage.OnTextChanged = function(self, _, text)
	ClassicLFG.DB.profile.InviteText = text
end