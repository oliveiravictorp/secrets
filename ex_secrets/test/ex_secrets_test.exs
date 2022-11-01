defmodule ExSecretsTest do
  use ExUnit.Case
  doctest ExSecrets

  test "read file and encode to base64" do
    assert ExSecrets.build("file1.txt", "file2.txt") == :ok
  end

  test "read file and decode from base64" do
    assert ExSecrets.build("file2.txt") == {:ok, "I am happy\n"}
  end
end
