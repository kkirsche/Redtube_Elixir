defmodule Redtube do
  use HTTPoison.Base

  def process_url(url) do
    "http://api.redtube.com" <> url
  end

  def process_response_body(body) do
    body
    |> Poison.decode!
    |> Enum.map(fn({k, v}) -> {String.to_atom(k), v} end)
  end

  @doc """
  Retrieves video list, can be filtered by multiple parameters,
  including the possibility to query the API for videos containing
  a specific string in the title or description.

  ## Parameters

  * `category` (Optional) String
  * `page` (Optional) Integer / default 1 /
  * `search` (Optional) String / search query string /
  * `tags` (Optional) Array
  * `stars` (Optional) Array
  * `thumbsize` (Optional) If set, provides additional thumbnails in
  different formats. Possible values are: medium, small, big,
  all, medium1, medium2.
  * `ordering` (Optional) If set, the returned JSON output is ordered
  according the selected value. Possible values are: newest,
  mostviewed, rating.
  * `period` (Optional - works only when 'ordering' parameter is used!)
  If set, the returned JSON output will deliver videos from a period,
  based on the selected value. Possible values are: weekly, monthly, alltime.

  ## Example

  iex> Redtube.search_videos search: "hard", thumbsize: "all"
       {:ok, response}
  """
  def search_videos(criteria \\ []) do
    Redtube.start
    response = Redtube.get!("/",
                 [],
                  [
                    {:params,
                      [
                        data: "redtube.Videos.searchVideos",
                        output: "json"
                      ] ++ criteria
                    }
                  ]
                ).body
    {:ok, response}
  end

  @doc """
  Retrieves additional information about specific video by `video_id`
  parameter.

  ## Example

  iex> Redtube.get_video_by_id video_id: 179543, thumbsize: "all"
       {:ok, response}
  """
  def get_video_by_id(criteria \\ []) do
    Redtube.start
    response = Redtube.get!("/",
                 [],
                  [
                    {:params,
                      [
                        data: "redtube.Videos.getVideoById",
                        output: "json"
                      ] ++ criteria
                    }
                  ]
                ).body
    {:ok, response}
  end

  @doc """
  Retrieves state of a specific video specified by `video_id` parameter,
  which is useful in order to keep your embedded videos up to date.

  ## Example

  iex> Redtube.is_video_active video_id: 179543
       {:ok, response}
  """
  def is_video_active(criteria \\ []) do
    Redtube.start
    response = Redtube.get!("/",
                 [],
                  [
                    {:params,
                      [
                        data: "redtube.Videos.isVideoActive",
                        output: "json"
                      ] ++ criteria
                    }
                  ]
                ).body
    {:ok, response}
  end

  @doc """
  Retrieves embed code (BASE64 encoded) for specific video by `video_id`
  parameter, which is useful to automatically embed videos.

  ## Example

  iex> Redtube.get_video_embed_code video_id: 179543
       {:ok, response}
  """
  def get_video_embed_code(criteria \\ []) do
    Redtube.start
    response = Redtube.get!("/",
                 [],
                  [
                    {:params,
                      [
                        data: "redtube.Videos.getVideoEmbedCode",
                        output: "json"
                      ] ++ criteria
                    }
                  ]
                ).body

    {:ok, response}
  end

  @doc """
  Retrieves all deleted videos.

  ## Example

  iex> Redtube.get_deleted_videos page: 1
       {:ok, response}
  """
  def get_deleted_videos(page \\ [page: 1]) do
    Redtube.start
    response = Redtube.get!("/",
                 [],
                  [
                    {:params,
                      [
                        data: "redtube.Videos.getDeletedVideos",
                        output: "json"
                      ] ++ page
                    }
                  ]
                ).body

    {:ok, response}
  end

  @doc """
  Retrieves all available categories.

  ## Example

  iex> Redtube.get_categories_list
       {:ok, response}
  """
  def get_categories_list() do
    Redtube.start
    response = Redtube.get!("/",
                 [],
                  [
                    {:params,
                      [
                        data: "redtube.Categories.getCategoriesList",
                        output: "json"
                      ]
                    }
                  ]
                ).body

    {:ok, response}
  end

  @doc """
  Retrieves all available tags.

  ## Example

  iex> Redtube.get_tags_list
       {:ok, response}
  """
  def get_tags_list() do
    Redtube.start
    response = Redtube.get!("/",
                 [],
                  [
                    {:params,
                      [
                        data: "redtube.Tags.getTagList",
                        output: "json"
                      ]
                    }
                  ]
                ).body

    {:ok, response}
  end

  @doc """
  Retrieves all pornstars available.

  ## Example

  iex> Redtube.get_star_list
       {:ok, response}
  """
  def get_star_list() do
    Redtube.start
    response = Redtube.get!("/",
                 [],
                  [
                    {:params,
                      [
                        data: "redtube.Stars.getStarList",
                        output: "json"
                      ]
                    }
                  ]
                ).body

    {:ok, response}
  end

  @doc """
  Retrieves all pornstars available.

  ## Example

  iex> Redtube.get_star_list
       {:ok, response}
  """
  def get_detailed_star_list() do
    Redtube.start
    response = Redtube.get!("/",
                 [],
                  [
                    {:params,
                      [
                        data: "redtube.Stars.getStarDetailedList",
                        output: "json"
                      ]
                    }
                  ]
                ).body

    {:ok, response}
  end
end
