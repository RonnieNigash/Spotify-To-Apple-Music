-- Get currently playing track

set currentlyPlayingTrack to getCurrentlyPlayingTrack()

on getCurrentlyPlayingTrack()
	tell application "Spotify"
		set currentTrack to name of current track as string
		set currentArtist to artist of current track as string
		return currentTrack & " " & currentArtist
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
set userName to (do shell script "whoami") as string
set filePath to "/Users/" & userName & "/Desktop/myTracks.txt"
do shell script "echo  " & quoted form of currentlyPlayingTrack & " >>  " & quoted form of filePath