docker build -t pylink_checker .
p_path=`pwd`
c_dir=`basename $p_path`
docker run -it -d --name pylink_checker -p 80:80 -p 8080:8080 -v `pwd`:/var/deploy/$c_dir pylink_checker /bin/bash

