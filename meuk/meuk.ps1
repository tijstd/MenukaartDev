$RawMenu = Get-Content  .\menu.json | ConvertFrom-Json

Write-Output $RawMenu | Out-Host

$TotalOrder = 0
$RightOrder = 1
$MaxOrder = 11

while ( $RightOrder -eq 1){

    $ListOfDishes = @()
    $ListId = @()

    do {

        $WantToEat = Read-Host -Prompt "Give number of the dish you want to order. If done ordering type 'end'?"

        if ($WantToEat -ne '')

        {

            if( $WantToEat -as [int] -lt ( $MaxOrder)){

                $ListOfDishes += $RawMenu[$WantToEat].dish
                $ListId += $WantToEat

            } else {

                Write-Output "not valid number for dish, try again"

            }

        }

    }

    #Loop will stop when user enter 'END' as input

    until ($WantToEat -eq 'end')

    Write-Output "Your shopping basket " $ListOfDishes

    $CorrectOrder = Read-Host -Prompt "Are you satisfied with the order pres 1 if yes, 2 if no and start over"

    if ( $CorrectOrder -eq 2){

        $RightOrder =1

    } else {     

        $RightOrder = 2

    }

}

for ($i= 0; $i -le $ListId.length-1; $i++ ){ 

    $TotalOrder= $TotalOrder  + $RawMenu[$ListId[$i]].price

}

Write-Output " you have paid " $TotalOrder " euro's for you order"












