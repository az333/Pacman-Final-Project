
# Pacman-Final-Project

Development Log:

June 7: Finished maze (grid and image overlay) /n
June 10: Implemented Pacman /n
June 12: Implemented ghost control
June 17: Implemented Lee's algorithm for automatic movement for Pacman
June 19: Implemented score display and automatic restart

Bugs:
- Sometimes Pacman (the green dot) will move in a circle, but you can break out of that funk by choosing a different ghost to move.
- Pacman's goal is to avoid the dot you're controlling, but in doing so, there is chance he might land on another dot.
- Occasionally, there will be no response if you make contact with Pacman, so you'll have to keep finding ways to make contact with him.
- If you're holding down an arrow key for a ghost but there's a barrier in the direction that you're still trying to move, Pacman will still move on his own accord.

Note: Sometimes when you restart a game you'll notice that the points counter will not be set to 0. This isn't a bug, it just means you've moved Pacman already.

Features:
- Ghosts that are user controlled
- Pacman which is directed by Lee's algorithm (finds the shortest path (BFS) between points)
- Dots to be eaten by Pacman
- Points display
- Automatic restart
- You'll know when the game ends if the automatic restart is triggered, but you should check the console to see if you won or lost.

How to Use:
- All files are in the folder named AntiPacman so that's where you should pull.
- The game starts right away once you press the play button on Processing.
- Pacman moves of his own accord, trying to eat of the dots and then reaching the exit. If he does eat all of the dots, then the computer wins.
- The ghosts are operated by you! You switch between them, using 1 = red, 2 = pink, 3 = orange, 4 = blue.
- To win you must eat Pacman!

Credits:
We took a txt file from this website to create our maze.
http://www.pandadeath.com/making-the-pacman-maze.html 
  