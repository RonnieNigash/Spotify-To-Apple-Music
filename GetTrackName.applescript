-- Get currently playing track

--set currentlyPlayingTrack to getCurrentlyPlayingTrack()

on getCurrentlyPlayingTrack()
	tell application "Spotify"
		set currentTrack to name of current track as string
		set currentArtist to artist of current track as string
		return currentTrack & " - " & currentArtist
	end tell
end getCurrentlyPlayingTrack

-- Open iTunes and play current song from Spotify
-- THIS WON'T WORK WITH iTunes 12.2 as we can only search through our current directory of songs on local drive
-- Cannot use Apple Music streaming music
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
set spotifyState to ""
tell application "Spotify" to set spotifyState to (player state as text)
repeat while (spotifyState is equal to "playing")
	set currentlyPlayingTrack to getCurrentlyPlayingTrack()
	delay 0.5
	do shell script "echo  " & quoted form of currentlyPlayingTrack & " >>  " & quoted form of filePath
	delay 0.5
	tell application "Spotify" to next track
	tell application "Spotify" to set spotifyState to (player state as text)
end repeat