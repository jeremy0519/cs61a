import random
import sqlite3

# SQL Intro

db = sqlite3.Connection('number.db')
db.execute('CREATE TABLE nums (first INT, second INT);')
db.execute('INSERT INTO nums VALUES (?, ?), (?, ?);', range(6, 10))
print(db.execute('SELECT * FROM nums;').fetchall())
db.commit()

# SQL Injection
def sql_injection():
    db = sqlite3.Connection('users.db')

    id = db.execute("SELECT MAX(id) from users").fetchone()[0]
    current_id = id + 1

    while True:
        first_name = input("First name? ")
        last_name = input("Last name? ")
        email = input("Email? ")
        cmd = f"INSERT INTO users VALUES ({current_id}, '{first_name}', '{last_name}', '{email}', 'Student');"
        print("Executing:", cmd, current_id)
        
        db.executescript(cmd)

        print("Users:", *db.execute("SELECT * from users").fetchall(), sep='\n')
        current_id = current_id + 1

    #    cmd = f"INSERT INTO users VALUES (?, ?, ?, ?, 'Student');"
    #    print("Executing:", cmd)
    #    db.execute(cmd, [current_id, first_name, last_name, email])

# Blackjack

points = {'A': 1, 'J': 10, 'Q': 10, 'K':10}
points.update({n: n for n in range(2, 11)})

def hand_score(hand):
    """Total score for a hand."""
    total = sum([points[card] for card in hand])
    if total <= 11 and 'A' in hand:
        return total + 10
    return total

db = sqlite3.Connection('cards.db')
sql = db.execute
sql('DROP TABLE IF EXISTS cards')
sql('CREATE TABLE cards(card, place);')

def play(card, place):
    """Play a card so that the player can see it."""
    sql('INSERT INTO cards VALUES (?, ?)', (card, place))
    db.commit()

def score(who):
    """Compute the hand score for the player or dealer."""
    cards = sql('SELECT * from cards where place = ?;', [who])
    return hand_score([card for card, place in cards.fetchall()])

def bust(who):
    """Check if the player or dealer went bust."""
    return score(who) > 21

player, dealer = "Player", "Dealer"

def play_hand(deck):
    """Play a hand of Blackjack."""
    play(deck.pop(), player)
    play(deck.pop(), dealer)
    play(deck.pop(), player)
    hidden = deck.pop()

    while 'y' in input("Hit? ").lower():
        play(deck.pop(), player)
        if bust(player):
            print(player, "went bust!")
            return

    play(hidden, dealer)

    while score(dealer) < 17:
        play(deck.pop(), dealer)
        if bust(dealer):
            print(dealer, "went bust!")
            return

    print(player, score(player), "and", dealer, score(dealer))

deck = list(points.keys()) * 4
random.shuffle(deck)
while len(deck) > 10:
    print('\nDealing...')
    play_hand(deck)
    sql('UPDATE cards SET place="Discard";')
