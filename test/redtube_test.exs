defmodule RedtubeTest do
  use ExUnit.Case, async: true

  test "search videos receives a valid JSON response" do
    {:ok, results} = Redtube.search_videos
    assert results != nil
    assert length(results) >= 1
  end

  test "get video by ID receives a valid JSON response" do
    {:ok, results} = Redtube.get_video_by_id video_id: 179543, thumbsize: "all"
    assert results != nil
    assert length(results) >= 1
    assert results[:video]["title"] === "Kari Milla blowjob"
  end

  test "is video active receives a valid JSON response" do
    {:ok, results} = Redtube.is_video_active video_id: 179543
    assert results != nil
    assert length(results) >= 1
    assert results[:active]["video_id"] === "179543"
  end

  test "get video embed code receives a valid JSON response" do
    {:ok, results} = Redtube.get_video_embed_code video_id: 179543
    assert results != nil
    assert length(results) >= 1
    assert results[:embed]["code"] === "PGlmcmFtZSBzcmM9Imh0dHA6Ly9lbWJlZC5yZWR0dWJlLmNvbS8/aWQ9MTc5NTQzJmJnY29sb3I9MDAwMDAwIiBmcmFtZWJvcmRlcj0iMCIgd2lkdGg9IjQzNCIgaGVpZ2h0PSIzNDQiIHNjcm9sbGluZz0ibm8iPjwvaWZyYW1lPg=="
  end

  test "get deleted videos receives a valid JSON response" do
    {:ok, results} = Redtube.get_deleted_videos page: 1
    assert results != nil
    assert length(results) >= 1
  end

  test "get categories list receives a valid JSON response" do
    {:ok, results} = Redtube.get_categories_list
    assert results != nil
    assert length(results) >= 1
  end

  test "get tags list receives a valid JSON response" do
    {:ok, results} = Redtube.get_tags_list()
    assert results != nil
    assert length(results) >= 1
  end

  test "get stars list receives a valid JSON response" do
    {:ok, results} = Redtube.get_detailed_star_list()
    assert results != nil
    assert length(results) >= 1
  end

  test "get stars list receives a valid JSON response" do
    {:ok, results} = Redtube.get_star_list()
    assert results != nil
    assert length(results) >= 1
  end
end
