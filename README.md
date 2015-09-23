# Express Meshblu Device Authentication Middleware
Express middleware to support all meshblu auth styles for a singular device

## Supported Auth Methods

* cookies: `request.cookies.meshblu_auth_uuid` and `request.cookies.meshblu_auth_token`
* headers: `request.cookies.meshblu_auth_uuid` and `request.cookies.meshblu_auth_token`
* basic: `Authorization: Basic c3VwZXItcGluazpwaW5raXNoLXB1cnBsZWlzaAo=`
* bearer: `Authorization: Bearer c3VwZXItcGluazpwaW5raXNoLXB1cnBsZWlzaAo=`

## Example:
    var express = require('express');
    var meshbluAuthDevice = require('express-meshblu-auth-device');
    var app = express();

    app.use(meshbluAuthDevice(
      uuid: '340d1779-300c-45cd-b133-2f316df8097a'
      server: 'meshblu.octoblu.com',
      port: 443,
      protocol: 'https'
    ));
    app.use(function (request, response) {
      response.json({uuid: request.meshbluAuthDevice.uuid, token: request.meshbluAuthDevice.token});
    });
    app.listen(3333);

[![Build Status](https://travis-ci.org/octoblu/express-meshblu-auth-device.svg?branch=master)](https://travis-ci.org/octoblu/express-meshblu-auth-device)
[![Code Climate](https://codeclimate.com/github/octoblu/express-meshblu-auth-device/badges/gpa.svg)](https://codeclimate.com/github/octoblu/express-meshblu-auth-device)
[![Test Coverage](https://codeclimate.com/github/octoblu/express-meshblu-auth-device/badges/coverage.svg)](https://codeclimate.com/github/octoblu/express-meshblu-auth-device)
[![npm version](https://badge.fury.io/js/express-meshblu-auth-device.svg)](http://badge.fury.io/js/express-meshblu-auth-device)
[![Gitter](https://badges.gitter.im/octoblu/help.svg)](https://gitter.im/octoblu/help)
