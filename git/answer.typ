#import "../template.typ" : *

#set page(
  paper: "a4",
  header: align(
    right + horizon,
    "Git Review Sheet解答&解説",
  ),
  numbering: "1",
)

#show: rvsheet.with()

= 基本用語
+ ブランチ/コミットを指すポインタ．現在の位置となる．
+ `HEAD`を移動させ，ローカルを移動後のコミットの状態にする．
  - Untracked filesに関しては削除もされず，何も起こらない．Tracked filesの追加や変更に関しては破棄されるが，警告が表示される．
  - 実質的に，`git switch`と`git restore --source=<コミット>`を組み合わせたような挙動となる．checkoutを行う前にコミットを行うか，stashしておくと良いだろう．
+ `HEAD`がブランチではなくコミットを直接指している状態．
  - この状態で新規コミットを行うと，どのブランチにも属さないコミットとなる．そのようなコミットは`git log`では表示されないため，コミットハッシュを持ってきたい場合は`git reflog`を利用すると良い．
  - ちなみに通常の`HEAD`がブランチを指している状態はAttached HEAD状態と呼ぶ．
+ `git switch`
  - `checkout`コマンドの`HEAD`の移動の部分だけを取り出したような挙動となる．

= 表示系
+ `git diff`
+ `git diff --staged`
+ `git log <ブランチA>..<ブランチB>`
+ `git log --oneline`
+ `git reflog`

= 復元・削除系
+ `git restore <path>`
+ `git restore --staged <path>`または`git reset HEAD <path>`
+ `git rm --cached <path>`
+ `git rm <path>`
+ `HEAD`とブランチを指定したコミットへ動かす．
  - `checkout`はブランチを動かさないが，`reset`は一緒に動かす．なのでdetached HEAD状態にはならない．つまりresetと言っても，実態はブランチの移動である．つまり，`HEAD -> main`から`HEAD -> feature`に`reset`することもできるわけで，その場合は未来旅行だ．
  - `git reset`はファイルに対しても使えるが，その場合は`git restore`を使うほうが明確だろう．
+ `--soft`はインデックスとワーキングツリーを保持する．`--mixed`はインデックスを破棄し，ワーキングツリーを保持する．`--hard`はインデックスを破棄し，ワーキングツリーを指定したコミットと同じものにする．
  - ブランチの移動に際してインデックスとワーキングツリーをどうするかを指定するのが`soft,mixed,hard`だと考えれば良い．

= ブランチ
+ `git branch <ブランチ名>`
+ `git switch -c <ブランチ名>`または`git checkout -b <ブランチ名>`
+ `git branch`
+ `git branch -d <ブランチ名>`
+ `git branch -D <ブランチ名>`
+ Orphan Branch（孤児ブランチ）
  - 通常，orphan branchとのマージはエラーになるが，強制的にマージすることもでき，その場合は全てがコンクリフト扱いとなる．
  - GitHub Pagesブランチとか，ドキュメント用ブランチを切るときなどに有効活用されてたり．
+ fast-forwardマージの場合，マージ先ブランチは一直線の履歴となり，マージコミットは作成されない．non-fast-forwardマージは，分岐した履歴をマージする際に新しくマージコミットが作られる．
  - 当然ながら，ffマージはマージ先ブランチがマージ元ブランチの親になっている場合しか使えない．
+ `--no-ff`
+ `git merge --abort`
+ `git rebase <コミット>`
  - これを使えば全部のマージをffにすることもできる．
+ `-i`
  - 例えば，Featureブランチで雑にコミットしていた履歴を整えつつ，mainブランチにrebaseするときなどに使える．

= リモートリポジトリ
+ `git remote add <名前> <URL>`
  - `git clone`した際のリモート名は，デフォルトで`origin`と付けられる．
+ `git remote set-url <名前> <URL>`
+ `git branch -vv`
+ `git branch -r`
+ `git fetch`
+ - `git log main..origin/main`
  - `git log origin/main..main`
+ `git merge origin/main`または`git rebase origin/main`
+ `git pull`

= その他
+ `git stash`
  - いろいろできる．untracked filesにも使えて，一時的な退避領域として便利．
+ `git commit --amend`
+ `git cherry-pick <コミット>`
+ `git revert <コミット>`
