[![Build Status](https://travis-ci.org/kkirsche/Redtube_Elixir.svg?branch=master)](https://travis-ci.org/kkirsche/Redtube_Elixir) [![Hex pm](http://img.shields.io/hexpm/v/httpoison.svg?style=flat)](https://hex.pm/packages/redtube)


Redtube API Wrapper
===================

Welcome to the Redtube API wrapper, written in Elixir. This API wrapper leverages [HTTPoison](https://github.com/edgurgel/httpoison) and [Poison](https://github.com/devinus/poison) to work it's magic. 

## Setup

Retrieve dependencies:

```shell
$ mix deps.get
```

Load the library in your project or start the application in IEX with:

```shell
iex -S mix
```

## Usage

Example usage:

```elixir
Redtube.search_videos search: "kari milla", tags: "Blowjob"
```
