Pack.set "bitly", "homeTitle", "Shorten your URLs with Bitly"
Pack.set "bitly", "welcomeTemplate", "packWelcome"

# objects must be created anew, unlike scalar values which can be reused
Pack.set "bitly", "getAppsSelector", ->
  {key: {$in: ["bitly"]}}
