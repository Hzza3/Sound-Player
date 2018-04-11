# Sound-Player
offline Sound player  

Libraries used :
_________________

AVFoundation : Aframework handling the media (audio/vedio) work on IOS, used to build the sound player
______________________________________________________________________________________________________________________

- The application starts on a table view lists the offline sound files and when the user selects a file another view
appears containing a player displays the name of the file , the album art and a play, pause, replay buttons.

- User can dismiss the player view back to the sound list by dragging down the view to a specific threshold.

_______________________________________________________________________________________________________________________

- The application follows the MVC design pattern :-

- Model :-
        - Sound.swift : A Class holds sound file informatin (Title, image thumbnail)
- View  :-
	- main.storyboard : Contains 2 view controllers (Sound List View Controller, Player View Controller)
	- SoundCell.swift : A Class holds the the outlets of the table view cell
- Controllers :-
	- SoundListViewController : A Class handling the table view logic (sound files list)
	- PlayerViewController : A Class handling the sound player logic and view drag gesture

 Github link :- https://github.com/Hzza3/Sound-Player
		
 






 
