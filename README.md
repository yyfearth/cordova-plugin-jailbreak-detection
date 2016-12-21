## Cordova Jailbreak Detection Plugin [![npm version](https://badge.fury.io/js/cordova-plugin-jailbreak-detection.svg)](http://badge.fury.io/js/cordova-plugin-jailbreak-detection)

Use this plugin to add an extra layer of security for your app, by detecting if the device running the app is jailbroken.

Unfortunately, there are 10s of millions of jailbroken iOS devices, so preventing your app from running on a jailbroken device could lead to a limited userbase and/or bad App Store reviews.

**I recommend you use this plugin to block certain features in your app rather than prevent it from running entirely.**

*This plugin is forked from [leecrossley/cordova-plugin-jailbreak-detection](https://github.com/leecrossley/cordova-plugin-jailbreak-detection).*
*Add detectJailbroken method which will return a promise with a reason to replace the original isJailbroken method.*
*Original isJailbroken method is still available for backward compatibility.*

## Install

### Cordova

```
cordova plugin add https://github.com/yyfearth/cordova-plugin-jailbreak-detection.git
```

You **do not** need to reference any JavaScript, the Cordova plugin architecture will add a `jailbreakdetection` object to your root automatically when you build.

## Usage

### detectJailbroken

```js
jailbreakdetection.detectJailbroken().then(function(reason) {
    if (reason) { // called with a string reason if the device is Jailbroken
        console.warn('Device has been Jailbroken', reason);
    }
    else { // otherwise an empty string is given
        console.log('Device has not been Jailbroken yet');
    }
}, function(error) {
    // called if there was an error determining if the device is Jailbroken
    console.error(error);
});
```

## Platform Support

iOS only.

## License

[MIT License](http://ilee.mit-license.org)
