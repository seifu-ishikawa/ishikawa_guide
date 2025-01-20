# HTML のヘッダー部分を作成
$html_header = @"
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Text Files Content</title>
</head>
<body>
"@

# HTML のフッター部分を作成
$html_footer = @"
</body>
</html>
"@

# ヘッダーを書き込む
$html_header | Out-File -FilePath "index.html" -Encoding utf8

# カレントディレクトリの全ての .txt ファイルを処理
Get-ChildItem -Filter "*.txt" | ForEach-Object {
    # ファイル名を見出しとして追加
    "<h2>$($_.Name)</h2>" | Out-File -FilePath "index.html" -Append -Encoding utf8
    
    # ファイルの内容を取得し、<pre>タグで囲んで追加
    "<pre>" | Out-File -FilePath "index.html" -Append -Encoding utf8
    Get-Content $_.FullName | Out-File -FilePath "index.html" -Append -Encoding utf8
    "</pre>" | Out-File -FilePath "index.html" -Append -Encoding utf8
}

# フッターを追加
$html_footer | Out-File -FilePath "index.html" -Append -Encoding utf8
