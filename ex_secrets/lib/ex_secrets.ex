defmodule ExSecrets do
  def build(inputFile) do
    inputFile
    |> File.read()
    |> input_file_decode64()
  end

  def build(inputFile, outputFile) do
    inputFile
    |> File.read()
    |> input_file_encode64()
    |> output_file_write(outputFile)
  end

  defp input_file_decode64({:ok, result}) do
    result
    |> Base.decode64()
  end
  defp input_file_decode64({:error, reason}), do: reason

  defp input_file_encode64({:ok, result}) do
    result
    |> Base.encode64()
  end
  defp input_file_encode64({:error, reason}), do: reason

  defp output_file_write(str, output) do
    output
    |> File.write(str)
  end
end
