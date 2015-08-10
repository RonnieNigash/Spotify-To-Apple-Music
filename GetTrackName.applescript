-- Get currently playing track

set currentlyPlayingTrack to getCurrentlyPlayingTrack()

on getCurrentlyPlayingTrack()
	tell application "Spotify"
		set currentTrack to name of current track as string
		
		return currentTrack
	end tell
end getCurrentlyPlayingTrack

