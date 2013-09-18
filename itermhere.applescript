tell application "Finder"
	set thisFolder to (target of front window) as Unicode text
	set posixPath to quoted form of POSIX path of thisFolder
end tell

tell application "System Events" to set allprocesses to get name of every process

tell application "iTerm"
	if not (allprocesses contains "iTerm") then
		make new terminal
	end if
	tell the current terminal
		launch session "Default Session"
		activate current session
		tell the last session
			write text "cd " & posixPath & "; clear; pwd"
		end tell
	end tell
end tell