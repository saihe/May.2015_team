# みんなでつくろうphp

皆で問題共有をし、wikiみたいにこれを辞書代わりにしていきましょう。

#!/bin/bash
# リポジトリ更新時にメール送信するスクリプト

# ブランチ名を取得
branch=$(git rev-parse --symbolic --abbrev-ref $1)

# 送信先アドレス
mailaddr="saihe@gmail.com"
# 件名
subject="Gitリポジトリ アップデート通知 (${branch} branch)"
# 本文(最新5コミット)
content=$(git log ${branch} --graph -5)

# メール送信
echo "${content}"|mail -s "${subject}" ${mailaddr}
スクリプトに実行権限を付与するのを忘れずに。

$ chmod +x hooks/post-update
