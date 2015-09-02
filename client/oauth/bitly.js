Accounts.oauth.registerService('bitly');

if (Meteor.isClient) {
  Meteor.loginWithBitly = function(options, callback) {
    // support a callback without options
    if (! callback && typeof options === "function") {
      callback = options;
      options = null;
    }

    var credentialRequestCompleteCallback = Accounts.oauth.credentialRequestCompleteHandler(callback);
    Bitly.requestCredential(options, credentialRequestCompleteCallback);
  };
} else {
  Accounts.addAutopublishFields({
    forLoggedInUser: ['services.bitly'],
    forOtherUsers: ['services.bitly.id']
  });
}
