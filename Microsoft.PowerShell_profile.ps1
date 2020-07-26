function global:prompt
{
    $user = $env:username
    $computer = hostname.exe

    $usercomp = $user + "@" + $computer
    $padstuff = " : "
    $userpath = $executionContext.SessionState.Path.CurrentLocation

    if($env:PIPENV_ACTIVE -eq 1)
    {
        $venv = ($env:VIRTUAL_ENV -split "\\")[-1]
        Write-Host "[pipenv:$venv] " -ForegroundColor White -NoNewline
    }

    Write-Host -Object $usercomp -ForegroundColor Green -NoNewline
    Write-Host -Object $padstuff -ForegroundColor White -NoNewline
    Write-Host -Object $userpath -ForegroundColor Blue  -NoNewline

    # Making sure this is always on its own line
    Write-Host "" 
    return "> "
}