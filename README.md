# SVN::Downloader

SVN::Downloader is a library for downloading remote SVN repositories

SVN repositories can be downloaded over HTTP protocol, but SVN protocol isn't implemented yet.


## Installation

Add this line to your application's Gemfile:

    gem 'svn-downloader'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install svn-downloader

### Dependencies

gems:

* `net_dav` (required)


## Usage

```ruby
require 'svn/downloader'

SVN::Downloader.download('http://svn.example.com/repo/', './local_path/')
```


## Code status

[![Build Status](https://travis-ci.org/davispuh/svn-downloader.png?branch=master)](https://travis-ci.org/davispuh/svn-downloader)
[![Dependency Status](https://gemnasium.com/davispuh/svn-downloader.png)](https://gemnasium.com/davispuh/svn-downloader)
[![Coverage Status](https://coveralls.io/repos/davispuh/svn-downloader/badge.png)](https://coveralls.io/r/davispuh/svn-downloader)
[![Code Climate](https://codeclimate.com/github/davispuh/svn-downloader.png)](https://codeclimate.com/github/davispuh/svn-downloader)

## Unlicense

![Copyright-Free](http://unlicense.org/pd-icon.png)

All text, documentation, code and files in this repository are in public domain (including this text, README).

It means you can copy, modify, distribute and include in your own work/code, even for commercial purposes, all without asking permission.

[About Unlicense](http://unlicense.org/)
 
## Contributing

Feel free to improve anything.

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


**Warning**: By sending pull request to this repository you dedicate any and all copyright interest in pull request (code files and all other) to the public domain. (files will be in public domain even if pull request doesn't get merged)

Also before sending pull request you acknowledge that you own all copyrights or have authorization to dedicate them to public domain.

If you don't want to dedicate code to public domain or if you're not allowed to (eg. you don't own required copyrights) then DON'T send pull request.
