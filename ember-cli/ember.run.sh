#!/bin/bash

exec node --harmony --debug=0.0.0.0:5858 --expose_debug_as=v8debug /apps/${APP_FOLDER}/node_modules/ember-cli/bin/ember serve
