[cookbookurl]: https://geek-cookbook.funkypenguin.co.nz
[kitchenurl]: https://discourse.kitchen.funkypenguin.co.nz
[discordurl]: http://chat.funkypenguin.co.nz
[patreonurl]: https://patreon.com/funkypenguin
[blogurl]: https://www.funkypenguin.co.nz
[appurl]: https://github.com/bitly/oauth2_proxy
[hub]: https://hub.docker.com/r/funkypenguin/oauth2_proxy/

[![geek-cookbook](https://raw.githubusercontent.com/funkypenguin/www.funkypenguin.co.nz/master/images/geek-kitchen-banner.png)][cookbookurl]

# Contents

1. [What is funkypenguin/oauth?](#what-is-funkypenguin-oauth2_proxy)
2. [Why should I use this?](#why-should-i-use-this)
3. [How do I use it?](#how-do-i-use-this)
4. [CHANGELOG](#changelog)

---

This container is maintained by [Funky Penguin's Geek Cookbook][cookbookurl], a collection of "recipes" to run popular applications
on Docker Swarm or Kubernetes, in a cheeky, geek format.

Got more details at:
* ![Discourse with us!](https://img.shields.io/discourse/https/discourse.geek-kitchen.funkypenguin.co.nz/topics.svg) [Forums][kitchenurl]
* ![Chat with us!](https://img.shields.io/discord/396055506072109067.svg) [Friendly Discord Chat][discordurl]
* ![Geek out with us!](https://img.shields.io/badge/recipies-35+-brightgreen.svg) [Funky Penguin's Geek Cookbook][cookbookurl]
* ![Thank YOU](https://img.shields.io/badge/thank-you-brightgreen.svg) [Patreon][patreonurl]
* ![Read blog!](https://img.shields.io/badge/read-blog-brightgreen.svg) [Blog][blogurl]

---

# What is funkypenguin/oauth2_proxy ?

[![](https://images.microbadger.com/badges/version/funkypenguin/oauth2_proxy.svg)](https://microbadger.com/images/funkypenguin/oauth2_proxy "Get your own version badge on microbadger.com")[![](https://images.microbadger.com/badges/image/funkypenguin/oauth2_proxy.svg)](https://microbadger.com/images/funkypenguin/oauth2_proxy "Get your own image badge on microbadger.com")[![Docker Pulls](https://img.shields.io/docker/pulls/funkypenguin/oauth2_proxy.svg)][hub][![Docker Stars](https://img.shields.io/docker/stars/funkypenguin/oauth2_proxy.svg)][hub][![](https://images.microbadger.com/badges/commit/funkypenguin/oauth2_proxy.svg)](https://microbadger.com/images/oauth2_proxy "Get your own commit badge on microbadger.com")

funkypenguin/oauth2_proxy is _yet another_ build of Bitly's ([now-abandoned](https://github.com/bitly/oauth2_proxy/issues/628#issuecomment-417121636)) oauth2_proxy application.

[oauth2_proxy][appurl] is a reverse proxy and static file server that provides authentication using Providers (Google, GitHub, and others) to validate accounts by email, domain or group. Although the project is now [abandoned](https://github.com/bitly/oauth2_proxy/issues/628#issuecomment-417121636), it remains a useful and consistent way to provide secured public access to an application.

What makes this version unique is:

1. Built with 2-stage Docker build, resulting image is a whopping 3.4MB!
2. Includes [PR #651](https://github.com/bitly/oauth2_proxy/pull/651) to permit self-signed certs on upstream applications (specifically, to allow oauth2_proxy in front of the UniFi Controller, which uses a baked-in self-signed cert)

# Why should I use this?

There are details re how (and why) to use oauth2_proxy in the [Geek's Cookbook](https://geek-cookbook.funkypenguin.co.nz/reference/oauth_proxy/).

# How do I use this?

Ideally, in a swarm, or a docker-compose.yml file (see above).

# CHANGELOG

* v2.2-r1 : First release based off scratch and with [self-signed-SSL patch](https://github.com/bitly/oauth2_proxy/pull/651/commits/3899576c07a51cf94307d679c76aafd72dcba4f2)
