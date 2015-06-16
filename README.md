[![Build Status](https://travis-ci.org/kkirsche/Redtube_Elixir.svg?branch=master)](https://travis-ci.org/kkirsche/Redtube_Elixir) [![Hex.pm](https://img.shields.io/hexpm/v/plug.svg)](https://hex.pm/packages/redtube)


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
iex(1)> Redtube.search_videos search: "kari milla", tags: "Blowjob"
...
iex(2)> {:ok, response} = Redtube.search_videos search: "tori black", tags: "gangbang, hardcore"
...
iex(3)> Enum.fetch response[:videos], 1
{:ok,
 %{"video" => %{"default_thumb" => "http://img.l3.cdn.redtubefiles.com/_thumbs/0001142/1142089/1142089_015m.jpg",
     "duration" => "9:52",
     "embed_url" => "http://embed.redtube.com/player/?id=1142089",
     "publish_date" => "2015-06-02 22:54:48", "rating" => "4.11",
     "ratings" => "27",
     "tags" => [%{"tag_name" => "Anal Sex"}, %{"tag_name" => "Big Cock"},
      %{"tag_name" => "Blowjob"}, %{"tag_name" => "Brunette"},
      %{"tag_name" => "Couple"}, %{"tag_name" => "Cream Pie"},
      %{"tag_name" => "HD"}, %{"tag_name" => "Oral Sex"},
      %{"tag_name" => "POV"}, %{"tag_name" => "Pornstar"},
      %{"tag_name" => "Shaved"}, %{"tag_name" => "Skinny"},
      %{"tag_name" => "Small Tits"}],
     "thumb" => "http://img.l3.cdn.redtubefiles.com/_thumbs/0001142/1142089/1142089_015m.jpg",
     "title" => "HDVPass Pretty Tori Black loves to get butt b",
     "url" => "http://www.redtube.com/1142089", "video_id" => "1142089",
     "views" => 16169}}}
```