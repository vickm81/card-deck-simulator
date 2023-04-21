    # Defining deck
    $global:card_deck = @(
    @('Ace of Spades', 'King of Spades', 'Queen of Spades', 'Jack of Spades', '10 of Spades', '9 of Spades', '8 of Spades', '7 of Spades', '6 of Spades', '5 of Spades', '4 of Spades', '3 of Spades', '2 of Spades'),
    @('Ace of Diamonds', 'King of Diamonds', 'Queen of Diamonds', 'Jack of Diamonds', '10 of Diamonds', '9 of Diamonds', '8 of Diamonds', '7 of Diamonds', '6 of Diamonds', '5 of Diamonds', '4 of Diamonds', '3 of Diamonds', '2 of Diamonds'),
    @('Ace of Clubs', 'King of Clubs', 'Queen of Clubs', 'Jack of Clubs', '10 of Clubs', '9 of Clubs', '8 of Clubs', '7 of Clubs', '6 of Clubs', '5 of Clubs', '4 of Clubs', '3 of Clubs', '2 of Clubs'),
    @('Ace of Hearts', 'King of Hearts', 'Queen of Hearts', 'Jack of Hearts', '10 of Hearts', '9 of Hearts', '8 of Hearts', '7 of Hearts', '6 of Hearts', '5 of Hearts', '4 of Hearts', '3 of Hearts', '2 of Hearts')
)
$global:deckHearts = @()
$global:deckDiamonds = @()
$global:deckSpades = @()
$global:deckClubs = @()
$global:counterHearts = 0
$global:counterDiamonds = 0
$global:counterSpades = 0
$global:counterClubs = 0
# NEW DECK FUNCTION

function NewDeck {
    # Build four decks using for each statements
foreach($h in $global:card_deck[3]){
    $global:deckHearts+="$h"
}
foreach($d in $global:card_deck[1]){
    $global:deckDiamonds+="$d"
}
foreach($s in $global:card_deck[0]){
    $global:deckSpades+="$s"
}
foreach($c in $global:card_deck[2]){
    $global:deckClubs+="$c"
}

    #initialising the counters
    $global:counterHearts=$deckHearts.Length
    $global:counterDiamonds=$deckDiamonds.Length
    $global:counterSpades=$deckSpades.Length
    $global:counterClubs=$deckClubs.Length
}

# REMOVE CARD FUNCTION

function RemoveCard($array, $index) {
    # temporary array
    $tempArray = @()
    foreach($i in $array) {
        if ($i -ne $index) {
            $tempArray += $array[$i]
        }
    }
    foreach($i in $tempArray){
    $array+=$i
    }
}    

# PICK CARD FUNCTION

function PickCards() {
    # Check if there are enough cards to pick
    $global:totalCards = $global:counterHearts + $global:counterDiamonds + $global:counterSpades + $global:counterClubs
    if ($global:numCards -gt $totalCards) {
        Write-Host ("There are only $global:totalCards left in the deck but you requested $global:numCards.")
        Read-Host "Press the enter key to return to the main menu"
        return
    }
    # Pick cards
    while ($global:numCards -gt 0) {
        # Check if all suits are empty
        if ($global:counterHearts -eq 0 -and $global:counterDiamonds -eq 0 -and $global:counterSpades -eq 0 -and $global:counterClubs -eq 0) {
            Write-Host "All suits are empty."
            break
        }   
        # Get random suit
        $suitIndex = Get-Random -Minimum 0 -Maximum 4
        switch ($suitIndex) {
            0 {
                # Hearts
                if ($global:counterHearts -eq 0) {
                    break
                }else{
                $cardIndex = Get-Random -Minimum 0 -Maximum $global:deckHearts.Length
                if ($global:counterHearts -eq 1) {
                    Write-Host($global:deckHearts[$cardIndex])
                    $global:deckHearts = @()
                    $global:counterHearts -= 1
                    $global:numCards -= 1
                } elseif($global:counterHearts -gt 1) {
                    Write-Host($global:deckHearts[$cardIndex])
                    RemoveCard $global:deckHearts $cardIndex
                    $global:counterHearts -= 1
                    $global:numCards -= 1
                    }
            }
            }
            1 {
                # Diamonds
                if ($global:counterDiamonds -eq 0) {
                    break
                }else{
                $cardIndex = Get-Random -Minimum 0 -Maximum $global:deckDiamonds.Length
                if ($global:counterDiamonds -eq 1) {
                    Write-Host($global:deckDiamonds[$cardIndex])
                    $global:deckDiamonds = @()
                    $global:counterDiamonds -= 1
                    $global:numCards -= 1
                } elseif($global:counterDiamonds -gt 1) {
                    Write-Host($global:deckDiamonds[$cardIndex])
                    RemoveCard $global:deckDiamonds $cardIndex
                    $global:counterDiamonds -= 1
                    $global:numCards -= 1
                }    
            }
            }
            2 {
                # Spades
                if ($global:counterSpades -eq 0) {
                    break
                }else{
                $cardIndex = Get-Random -Minimum 0 -Maximum $global:deckSpades.Length
                if ($global:counterSpades -eq 1) {
                    Write-Host($global:deckSpades[$cardIndex])
                    $global:deckSpades = @() 
                    $global:counterSpades -= 1
                    $global:numCards -= 1 
                } elseif($global:counterSpades -gt 1) {
                    Write-Host($global:deckSpades[$cardIndex])
                    RemoveCard $global:deckSpades $cardIndex
                    $global:counterSpades -= 1
                    $global:numCards -= 1  
                }    
            }
            }
            3 {
                # Clubs
                if ($global:counterClubs -eq 0) {
                    break
                }else{   
                $cardIndex = Get-Random -Minimum 0 -Maximum $global:deckClubs.Length
                if ($global:counterClubs -eq 1) {
                    Write-Host($global:deckClubs[$cardIndex])
                    $global:deckClubs = @()
                    $global:counterClubs -= 1
                    $global:numCards -= 1
                } elseif($global:counterClubs -gt 1) {
                Write-Host($global:deckClubs[$cardIndex])
                RemoveCard $global:deckClubs $cardIndex
                $global:counterClubs -= 1
                $global:numCards -= 1
                }
            }
            } 
        }
    }
}                   

 while ($true) {
    clear
    Write-Host "$global:counterHearts"
    Write-Host "Welcome to the card deck simulator.

    Please select from the following options:

          1. Draw a selected number of cards from the current deck
          2. Get a new deck of cards
          3. Exit
          "
    $option = Read-Host "Option#"

    switch ($option) {
        1 {
            clear
            $global:numCards = Read-Host "Enter number of cards to draw"
            try{
                $null=[convert]::ToInt32($numCards)
            }catch{
                clear
                Read-Host "That is not a valid selection. Press enter to continue "
                break
            }
            PickCards $global:numCards
            Read-Host " "
        }
        2 {
            clear
            NewDeck
            $global:totalCards=0
        }
        3 {
            Write-Host "Exiting script."
            exit
        }
        default {
            clear
            $default=Read-Host "Not a valid selection. Press Enter to continue"
        }
    }
}          