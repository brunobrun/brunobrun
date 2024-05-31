# Richiede il nome utente dell'AD
$username = Read-Host "Inserisci il nome utente dell'AD"

# Ottiene l'utente dall'Active Directory
$user = Get-ADUser -Identity $username -Properties MemberOf

if ($user -ne $null) {
    # Ottiene i gruppi a cui l'utente appartiene
    $groups = $user.MemberOf

    if ($groups.Count -gt 0) {
        Write-Host "`nGruppi a cui appartiene $username:`n"
        
        # Elenca i gruppi con i loro nomi
        foreach ($group in $groups) {
            $groupName = (Get-ADGroup -Identity $group).Name
            Write-Host $groupName
        }
    } else {
        Write-Host "`nL'utente $username non appartiene a nessun gruppo."
    }
} else {
    Write-Host "`nUtente $username non trovato nell'Active Directory."
}