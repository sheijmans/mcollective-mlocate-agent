# MCollective Agent mlocate

MCollective Agent to manage/use mlocate.

To use this agent you need:

  * MCollective 2.2.1 at least
  * mlocate installed

# TODO

  * ???

## Agent Installation

Follow the basic [plugin install guide](http://projects.puppetlabs.com/projects/mcollective-plugins/wiki/InstalingPlugins)

## Usage

All options and filters are available.

### Updating

Update the mlocate database with the MCollective Agent:

    $ mco rpc mlocate updatedb

### Searching

To search in the mlocate database with the MCollective Application:

    $ mco mlocate locate <file>

To search in the mlocate database with the MCollective Agent:

    $ mco rpc mlocate locate file=<file>

