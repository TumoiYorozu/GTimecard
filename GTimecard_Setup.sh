#!/bin/bash
bundle install --path vendor/bundle

bundle exec google-api oauth-2-login --client-id="785375802976-svic92uqburdun23ba9c067ndg33u5er.apps.googleusercontent.com" --client-secret="oMyjj58YZGPcjM_Mgzx_yeoZ" --scope="https://www.googleapis.com/auth/calendar"

mv ~/.google-api.yaml .
