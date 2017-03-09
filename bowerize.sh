#!/bin/sh

bower install

BOWER_DIR=bower-sources/swagger-ui/dist/

ASSETS_GRAILS_2=grails2/grails-app/assets
rm -rf $ASSETS_GRAILS_2/images/images/ $ASSETS_GRAILS_2/stylesheets/swagger/ $ASSETS_GRAILS_2/javascripts/swagger/
mkdir -p $ASSETS_GRAILS_2/images/images/
mkdir -p $ASSETS_GRAILS_2/stylesheets/swagger/
mkdir -p $ASSETS_GRAILS_2/javascripts/swagger/swagger-lib/

cp -R $BOWER_DIR/images/*      $ASSETS_GRAILS_2/images/images/
cp -R $BOWER_DIR/css/*         $ASSETS_GRAILS_2/stylesheets/swagger/
cp -R $BOWER_DIR/lib/*         $ASSETS_GRAILS_2/javascripts/swagger/swagger-lib/
cp -R $BOWER_DIR/swagger-ui.js $ASSETS_GRAILS_2/javascripts/swagger/

ASSETS_GRAILS_3=swaggydoc-grails3/grails-app/assets
rm -rf $ASSETS_GRAILS_3/images/images/ $ASSETS_GRAILS_3/stylesheets/swagger/ $ASSETS_GRAILS_3/javascripts/swagger/
mkdir -p $ASSETS_GRAILS_3/images/images/
mkdir -p $ASSETS_GRAILS_3/stylesheets/swagger/
mkdir -p $ASSETS_GRAILS_3/javascripts/swagger/swagger-lib/

cp -R $BOWER_DIR/images/*      $ASSETS_GRAILS_3/images/images/
cp -R $BOWER_DIR/css/*         $ASSETS_GRAILS_3/stylesheets/swagger/
cp -R $BOWER_DIR/lib/*         $ASSETS_GRAILS_3/javascripts/swagger/swagger-lib/
cp -R $BOWER_DIR/swagger-ui.js $ASSETS_GRAILS_3/javascripts/swagger/