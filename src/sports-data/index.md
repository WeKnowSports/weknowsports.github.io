## Introduction

The Sports Data is a **push-based queriable API**. You compose a query to target a specific data set and the API creates a **Subscription** and starts sending updates as they happen.

For defining a query the API use [OData](https://en.wikipedia.org/wiki/Open_Data_Protocol) as a query format *(more info about OData supports you can find here)*.

The API supports these protocols:
* HTTP (for pull, to query data) 
* [SSE](https://en.wikipedia.org/wiki/Server-sent_events) (for push, to subscribe and listen to a stream of updates, it works over HTTP).

Logically the API is divided into two parts: Pull and Push. The Pull API should be used to query data, to retrieve an initial snapshot of data. The Push API should be used to subscribe on a stream of updates by a specific query.

The Sports Data API is a way for our clients to build great real-time user experiences, specifically tailored for their needs. The API provides five endpoints returning five types of objects covering different levels of the offer hierarchy:

* Sports
* Leagues
* Events
* Markets
* Regions

Objects come with a comprehensive amount of attributes describing all of their significant features and parameter. Based on these, you can build a wide range of presentations and experiences. Some examples of features which can be built using the Sports data API include various navigational widgets, league coupons presenting all events from a league, full live betting section, live betting schedule, event view for both pre-match and in-play events, list of upcoming events, optionally grouped by sport, league etc., list of most popular events (ordered by total amount of stakes or total number of bets) and many more.

In short, we aim to provide support for any use case which can be part of a complete user-facing sportsbook solution.

_Usage of Sports Data API is a subject to a contractual agreement between SBTech and a partnering organization. Authentication is required for the API to be used in development and production environments._