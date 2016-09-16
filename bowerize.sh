#!/bin/sh

bower install

BOWER_DIR=bower-sources/swagger-ui/dist/

WA_DIR=grails2/web-app

rm -rf $WA_DIR/images/images/ $WA_DIR/css/swagger/ $WA_DIR/js/swagger/
mkdir -p $WA_DIR/images/images/
mkdir -p $WA_DIR/css/swagger/
mkdir -p $WA_DIR/js/swagger/swagger-lib/

cp -R $BOWER_DIR/images/*      $WA_DIR/images/images/
cp -R $BOWER_DIR/css/*         $WA_DIR/css/swagger/
cp -R $BOWER_DIR/lib/*         $WA_DIR/js/swagger/swagger-lib/
cp -R $BOWER_DIR/swagger-ui.js $WA_DIR/js/swagger/

ASSETS=swaggydoc-grails3/grails-app/assets
rm -rf $ASSETS/images/images/ $ASSETS/stylesheets/swagger/ $ASSETS/javascripts/swagger/
mkdir -p $ASSETS/images/images/
mkdir -p $ASSETS/stylesheets/swagger/
mkdir -p $ASSETS/javascripts/swagger/swagger-lib/

cp -R $BOWER_DIR/images/*      $ASSETS/images/images/
cp -R $BOWER_DIR/css/*         $ASSETS/stylesheets/swagger/
cp -R $BOWER_DIR/lib/*         $ASSETS/javascripts/swagger/swagger-lib/
cp -R $BOWER_DIR/swagger-ui.js $ASSETS/javascripts/swagger/
