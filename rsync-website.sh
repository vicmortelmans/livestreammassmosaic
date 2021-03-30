#!/bin/sh
cd `dirname "$0"`
curl -o sarasota-d.html http://livemass.s3.amazonaws.com/sarasota/sarasota-mass-of-the-day.html
curl -o warrington-d.html http://livemass.s3.amazonaws.com/warrington/warrington-mass-of-the-day.html
curl -o la-d.html http://livemass.s3.amazonaws.com/la/la-mass-of-the-day.html
curl -o guadalajara-d.html http://livemass.s3.amazonaws.com/guadalajara/guadalajara-mass-of-the-day/index.html
curl -o fribourg-d.html http://livemass.s3.amazonaws.com/fribourg/fribourg-mass-of-the-day.html
git pull
git commit -am "update of livemass pages"
git push origin master
gsutil -m rsync -e -x '\.git.*' -R . gs://mosaic.gelovenleren.net
echo "livestreammassmosaic updated @ `date`" >> ~/livestreammassmosaic.log
