# To-do list for the vim-tlv-mode plug-in

This document lists work to be done on the *vim-tlv-mode* plug-in:

 * Determine the license to use
 * Get integrated syntax checking working (out of the box)

Each point is discussed in more detail below.

## Determine the license to use

I need to determine under what license the plug-in is to be shared with the
world. All of my existing Vim plug-ins have been shared under the [MIT license]
[mit] but this is the first time I've developed a Vim plug-in on commission so
I'll have to discuss this with the client.

## Get integrated syntax checking working (out of the box)

The integrated syntax checking is not working correctly (yet) while I consider
this a major feature for users that are getting started with TLV and/or the Vim
plug-in. Impediments for the integration between *vim-tlv-mode* and the
`sandpiper` compiler:

 1. Right now I'm using a wrapper script to run `sandpiper` because the version
    of `sandpiper` that I'm using requires several command line options
    (`-m4inc`, `-m4out`, `-xclk`, `-xinj`) some if which (`-m4inc`) require
    arguments that are not trivial for the plug-in to fill in automatically.

    Ideally the Vim plug-in can just run `sandpiper FILE.tlv` and get a listing
    of syntax warnings/errors on standard output to be shown in a Vim quick-fix
    / location list window. This way, when the Vim plug-in and the `sandpiper`
    compiler are installed, things will work out of the box (easiest for users
    to get started).

 2. The version of the `sandpiper` compiler that I'm using prints an empty line
    to standard output when no messages are reported. This means that the Vim
    quick-fix window always opens (just to show an empty line). Ideally there
    would be no output at all when no messages are reported. The alternative is
    for the Vim plug-in to filter out empty lines before the Vim quick-fix
    window is populated.

 3. I'm probably doing something wrong but when I create a syntax error and run
    the compiler I get messages without a filename, specifically the output
    includes `File '<unknown>'`. This makes it impossible for Vim to correlate
    compiler messages to TLV files (i.e. recognizing filenames and line numbers
    in the messages reported by `sandpiper`).

My goal is to have these issues resolved (in one way or another :-) as quickly
as possible.

[mit]: http://en.wikipedia.org/wiki/MIT_License
