# !/bin/bash

mysql -uroot -p000 <<EOF
CREATE DATABASE $1;
quit
EOF

#mysql -uroot -p000 -e "CREATE DATABASE woo415;"
