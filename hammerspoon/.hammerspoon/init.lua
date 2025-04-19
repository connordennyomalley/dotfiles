local function hotkeyForApp(key, app)
	hs.hotkey.bind({}, key, function()
		hs.application.launchOrFocus(app)
	end)
end

hotkeyForApp("F13", "kitty")
hotkeyForApp("F14", "Neovide")
hotkeyForApp("F15", "Firefox")
hotkeyForApp("F16", "Emacs")
