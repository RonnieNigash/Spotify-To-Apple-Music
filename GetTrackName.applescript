-- Get currently playing track

set currentlyPlayingTrack to getCurrentlyPlayingTrack()

on getCurrentlyPlayingTrack()
	tell application "Spotify"
		set currentTrack to name of current track as string
		set currentArtist to name of current track as string	
		return currentTrack & " " & currentArtist
	end tell
end getCurrentlyPlayingTrack

