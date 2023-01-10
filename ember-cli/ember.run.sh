#!/bin/bash

exec node --harmony --inspect=0.0.0.0:9229 --expose_debug_as=v8debug /apps/${APP_FOLDER}/node_modules/ember-cli/bin/ember serve
