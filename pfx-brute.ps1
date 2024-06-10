# Path to your .pfx file
$PfxPath = "C:\path\to\your.pfx"

# Load the dictionary of potential passwords (modify as needed)
$PotentialPasswords = Get-Content "C:\path\to\your\passwords.txt"

foreach ($Password in $PotentialPasswords) {
    try {
        # Attempt to load the certificate without specifying a password
        $Certificate = Get-PfxCertificate -FilePath $PfxPath -Password (ConvertTo-SecureString -String $Password -AsPlainText -Force)
        Write-Host "Password successfully found: $Password"
        break  # Exit the loop if successful
    } catch {
        # Password incorrect, continue to the next one
    }
}

# If no valid password was found
if (-not $Certificate) {
    Write-Host "No valid password found in the dictionary."
}