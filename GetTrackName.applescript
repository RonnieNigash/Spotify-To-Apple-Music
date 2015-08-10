-- Get currently playing track

set currentlyPlayingTrack to getCurrentlyPlayingTrack()

on getCurrentlyPlayingTrack()
	tell application "Spotify"
		set currentTrack to name of current track as string
		--	set currentArtist to name of current track as string	
		return currentTrack --& " " & currentArtist
	end tell
end getCurrentlyPlayingTrack

-- Open iTunes and play current song from Spotify
tell application "iTunes"
	activate
	set results to (every file track of playlist "Library" whose name contains currentlyPlayingTrack)
	repeat with tune in results
		play tune
	end repeat
end tell
