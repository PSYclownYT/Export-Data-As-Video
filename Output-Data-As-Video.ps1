$pathtocompress = Read-Host -Prompt "Enter the Path to Convert"
$downloadsPath = (New-Object -ComObject Shell.Application).Namespace('shell:Downloads').Self.Path
$Result = $downloadsPath + "\videooutput.avi"
ffmpeg -f u8 -ar 45000 -ac 2 -i $pathtocompress -f rawvideo -pix_fmt rgb555 -r 50 -s 30x30 -i $pathtocompress -vf scale=w=32*iw:h=32*ih:sws_flags=neighbor -b:v 50000k $Result -y