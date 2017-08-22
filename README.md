# yusanish/jumanpp_knp
JUMAN++とKNPをDockerで使えるようにする。(pyKNPのために、pythonも使えます。)

## 使い方（Usage）

基本的には、コンテナの標準出力を繋いでコンテナ内のJUMAN++とKNPを利用します。

```
docker run -it --name jumanpp_knp yusanish/jumanpp_knp:latest

root@CONTAINER_ID:~#
root@CONTAINER_ID:~# echo "今日のご飯はカレーです。" | jumanpp | knp
今日の═════╗　　　　　<体言><NE:DATE:今日>
        ご飯は═════╗　<体言>
          カレーです。<体言><用言:判><格解析結果:ガ/ご飯;ガ２/->
EOS
root@CONTAINER_ID:~#
```

## pyKNPを使いたいとき

こちらを参考にしました。[JUMAN++をPythonから使う](http://qiita.com/riverwell/items/7a85ebf95647eaf18a6c)

とても簡単なサンプル

```
>>> import pyknp
>>> knp = pyknp.KNP()
>>> knp = pyknp.KNP(jumanpp=True)
>>> result = knp.parse("今日の晩御飯はカレーだった。")
>>> result.draw_bnst_tree()
```

使用できる関数や変数に関しては、こちらに詳しくまとめてあります。
[pyKNPについてのメモ](https://gist.github.com/pizzacat83/f314d48bfd9c3f69757e40cee4805e9b)

