#!/bin/bash
scp *.class root@192.168.2.2:.
scp *.so root@192.168.2.2:.
ssh root@192.168.2.2 << EOF
java -Djava.library.path=. HelloNativeTest
EOF
