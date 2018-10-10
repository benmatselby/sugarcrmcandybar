# SugarCRM Candy Bar

[![Build Status](https://travis-ci.org/benmatselby/sugarcrmcandybar.svg?branch=master)](https://travis-ci.org/benmatselby/sugarcrmcandybar)

Search your [SugarCRM](https://www.sugarcrm.com) application from your Mac menu bar

## Installation

Go to the [Releases page](https://github.com/benmatselby/sugarcrmcandybar/releases) and download `SugarCRMCandyBar.app.zip`. Unzip the file and drag `SugarCRM Candy Bar` to your applications folder.

## Features

* Ability to set your credentials to authenticate onto your SugarCRM application
* Ability to search your SugarCRM application from your Mac menu bar and go to that record
* Ability to limit the search to certain modules within the SugarCRM instance
* Ability to go straight to your SugarCRM instance
* Mac OS X Mojave: Two different UI appearances - Dark and Light

## User Interface

![The Menu Bar](docs/menu-bar.png?raw=true "The Menu Bar")

![Preferences](docs/preferences.png?raw=true "Preferences")

![Search Results - Light Mode](docs/search-results.png?raw=true "Search Results - Light Mode")

![Search Results - Dark Mode](docs/search-results-dark.png?raw=true "Search Results -  Dark Mode")

## Requirements

### SugarCRM

* Version 7.2 or above
* Access to the URL the application is running on
* A valid username and password to authenticate onto your SugarCRM instance

### Mac OS X

* Version 10.12 or above

## Development

If you are developing this application, you can mock away the SugarCRM application if need be. You need to supply the mock with a REST version in order for it to work. For example:

```
$ go run mock/server/main.go v10
```

Would run the mock for version 10 of the API (Pre verion 8.0 of SugarCRM). If you are running version 8 of SugarCRM, the support `v11`.

When the mock is being hit, you get some feedback:

```
$ go run mock/server/main.go v10
Hit the oauth handler /rest/v10/oauth2/token
Hit the me handler /rest/v10/me
Hit the oauth handler /rest/v10/oauth2/token
Hit the search handler /rest/v10/globalsearch?q=Testing
```

You need to set the preferences of the application to have a URL of `http://localhost:8080`
