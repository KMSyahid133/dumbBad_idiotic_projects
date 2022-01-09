import random
#This is a rock paper scissor game
choices = ("scissor", "paper", "rock")
#---------------------------------------------------------------------------------------------
def menu():
    again = input("\nPlay again?\n0: No\n1: Yes\n")
    if int(again) == 1:
        main_play( )
    else:
        return

#---------------------------------------------------------------------------------------------

#TODO: There must be a more efficient way of doing this, but who cares?
def check_winner(player1, player2, ai):
    winner = ""
    p1 = "Player 1"
    p2 = "Player 2"
    drw = "Draw"
    if player1 == "scissor":
        if player2 == "paper":
            winner += p1
        elif player2 == "rock":
            winner += "Player 2"
        else:
            winner = "Draw"

    elif player1 == "paper":
        if player2 == "rock":
            winner += p1
        elif player2 == "scissor":
            winner += "Player 2"

        else:
            winner = "Draw"

    elif player1 == "rock":
        if player2 == "scissor":
            winner += p1
        elif player2 == "paper":
            winner += "Player 2"
        else:
            winner = "Draw"

    if ai:
        if winner == p1:
            winner = "Bot"
    return winner
    

#---------------------------------------------------------------------------------------------
#Call this function to start playing
def main_play():
    #Player V. Bot (it's just rng)
    def pvb():
        bot_choice = random.randrange(0, len(choices))
        bot_choice_string = choices[bot_choice]

        player_choice = input("\nEnter Scissor, Paper, or Rock: ")
        player_choice = player_choice.lower()

        winner = check_winner(bot_choice_string, player_choice, True)

        print("\nBot chose: " + bot_choice_string)
        print("Player chose: " + player_choice)
        return winner

    #Player(1) V. Player(2)
    """def pvp():
        player1_choice = input("\nEnter Scissor, Paper, or Rock: ")
        player2_choice = input("\nEnter Scissor, Paper, or Rock: ")

        p1 = player1_choice.lower()
        p2 = player2_choice.lower()
        winner = check_winner(p1, p2, False)

        print(f"\nP1 chose: {p1}")
        print(f"P2 chose: {p2}")
        return winner"""


    result = pvb()
    if result == "Draw":
        print(f"{result}!")
    else:
        print(f"{result} Won!")
    """else: idk why did i implement this, it's the dumbest thing ever
        result = pvp()
        if result == "Draw":
            print(f"{result}!")
        else:
            print(f"{result} Won!")"""
    
    menu()
