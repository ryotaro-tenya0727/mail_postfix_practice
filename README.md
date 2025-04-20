# 動作確認方法

準備

```
docker-compose build

docker-compose up

docker-compose exec postfix-reception bash

useradd -m goro
```

telnetで送信してみる

```
$ telnet localhost 25
Trying ::1...
Connected to localhost.
Escape character is '^]'.
220 mail.example.com ESMTP Postfix (Ubuntu)
HELO example.com
250 mail.example.com
MAIL FROM: info@example.com
250 2.1.0 Ok
RCPT TO: goro@example.com
250 2.1.5 Ok
DATA
354 End data with <CR><LF>.<CR><LF>
From: info@example.com
To: goro@example.com
Subject: test!!!
this is legend!! 
.
250 2.0.0 Ok: queued as 7910CAD609F
```

送信できているのを確認

```
root@a1f42e679741:/# cd home
root@a1f42e679741:/home# ls
goro  ubuntu
root@a1f42e679741:/home# cd goro
root@a1f42e679741:/home/goro# ls 
Maildir
root@a1f42e679741:/home/goro# cd Maildir
root@a1f42e679741:/home/goro/Maildir# ls
cur  new  tmp
root@a1f42e679741:/home/goro/Maildir# cd new
root@a1f42e679741:/home/goro/Maildir/new# ls
1745150455.VfeIad60a6M246836.a1f42e679741
root@a1f42e679741:/home/goro/Maildir/new# cat 1745150455.VfeIad60a6M246836.a1f42e679741
Return-Path: <info@example.com>
X-Original-To: goro@example.com
Delivered-To: goro@example.com
Received: from example.com (unknown [192.168.148.1])
        by mail.example.com (Postfix) with SMTP id 7910CAD609F
        for <goro@example.com>; Sun, 20 Apr 2025 12:00:33 +0000 (UTC)
From: info@example.com
To: goro@example.com
Subject: test!!!

this is legend!! 
```
