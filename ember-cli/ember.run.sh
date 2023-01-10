#!/bin/bash

exec node --harmony --inspect=0.0.0.0:9229 /apps/${APP_FOLDER}/node_modules/ember-cli/bin/ember serve
