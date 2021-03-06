local player = ...

if SL[ ToEnumShortString(player) ].ActiveModifiers.HideScore then
	return false
else

	return Def.BitmapText{
		Font="_wendy monospace numbers",
		Text="0.00",

		Name=ToEnumShortString(player).."Score",
		InitCommand=function(self)
			self:valign(1):halign(1)

			if SL.Global.GameMode == "StomperZ" or SL.Global.GameMode == "ECFA" then
				self:zoom(0.4):x( WideScale(160, 214) ):y(20)
				if player == PLAYER_2 then
					self:x( _screen.w - WideScale(50, 104) )
				end
			else
				self:zoom(0.5):x( _screen.cx - _screen.w/4.3 ):y(56)
				if player == PLAYER_2 then
					self:x( _screen.cx + _screen.w/2.75 )
				end
			end
		end,
		JudgmentMessageCommand=function(self) self:queuecommand("RedrawScore") end,
		RedrawScoreCommand=function(self)
			local dp = STATSMAN:GetCurStageStats():GetPlayerStageStats(player):GetPercentDancePoints()
			local percent = FormatPercentScore( dp ):sub(1,-2)
			self:settext(percent)
		end
	}
end