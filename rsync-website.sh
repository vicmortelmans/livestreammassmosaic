#!/bin/sh
curl -o Sarasota.html http://livemass.s3.amazonaws.com/sarasota/sarasota-mass-of-the-day.html
curl -o Warrington.html http://livemass.s3.amazonaws.com/warrington/warrington-mass-of-the-day.html
curl -o LA.html http://livemass.s3.amazonaws.com/la/la-mass-of-the-day.html
curl -o Guadalajara.html http://livemass.s3.amazonaws.com/guadalajara/guadalajara-mass-of-the-day/index.html
curl -o Fribourg.html http://livemass.s3.amazonaws.com/fribourg/fribourg-mass-of-the-day.html
gsutil -m rsync -e -x '\.git.*' -R . gs://mosaic.gelovenleren.net

