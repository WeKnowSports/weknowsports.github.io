Add-Type -AssemblyName System.IO.Compression.FileSystem
if (![System.IO.File]::Exists("docfx.zip"))
    {Invoke-WebRequest https://github.com/dotnet/docfx/releases/download/v2.40.10/docfx.zip -OutFile docfx.zip}
if (![System.IO.Directory]::Exists("docfx"))
    {[System.IO.Compression.ZipFile]::ExtractToDirectory("docfx.zip", "docfx")}

$docxf = (Get-Item -Path ".\").FullName + "/docfx/docfx.exe"
Start-Process $docxf -ArgumentList "src/docfx.json --serve"
sleep 5
[Diagnostics.Process]::Start("http://localhost:8080")
