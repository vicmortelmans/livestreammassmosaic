#!/bin/sh
cd `dirname "$0"`
curl -o sarasota-d.html http://www.livemass.net/locations/sarasota-d.html
curl -o warrington-d.html http://www.livemass.net/locations/warrington-d.html
curl -o la-d.html http://livemass.s3.amazonaws.com/la/la-mass-of-the-day.html
curl -o guadalajara-d.html http://www.livemass.net/locations/la-d.html
curl -o fribourg-d.html http://www.livemass.net/locations/fribourg-d.html
git pull
git commit -am "update of livemass pages"
git push origin master
gsutil -m rsync -e -x '\.git.*' -R . gs://mosaic.gelovenleren.net
echo "livestreammassmosaic updated @ `date`" >> ~/livestreammassmosaic.log
