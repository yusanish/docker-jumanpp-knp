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
```fa

## pyKNPを使いたいとき

