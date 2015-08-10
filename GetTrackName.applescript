-- Get currently playing track

set currentlyPlayingTrack to getCurrentlyPlayingTrack()

on getCurrentlyPlayingTrack()
	tell application "Spotify"
		set currentTrack to name of current track as string
	--	set currentArtist to name of current track as string	
		return currentTrack --& " " & currentArtist
		next track
	end tell
end getCurrentlyPlayingTrack

-- Open iTunes and play current song from Spotify
-- tell application "iTunes"
--	activate
--	set results to (every file track of playlist "Library" whose name contains currentlyPlayingTrack)
--	repeat with tune in results
--		play tune
--	end repeat
--end tell

-- Write current songs from Spotify to .txt file
on writeToFile(track, destFile)
	try
		set the destFile to the destFile as text
		set the openFile to 
			open for access file destFile with write permission
		write track to the openFile starting at eof
		close access to openFile
		return true
	on error
		try
			close access file destFile
		end try
		return false
	end try
end writeToFile
		


