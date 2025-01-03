defmodule JellyFpgaControl do
  def reset(channel) do
    request = %JellyFpgaControl.ResetRequest{}
    channel |> JellyFpgaControl.JellyFpgaControl.Stub.reset(request)
  end

  def unload(channel, slot \\ 0) do
    request = %JellyFpgaControl.UnloadRequest{slot: slot}
    channel |> JellyFpgaControl.JellyFpgaControl.Stub.unload(request)
  end

  def load(channel, name) do
    request = %JellyFpgaControl.LoadRequest{name: name}
    channel |> JellyFpgaControl.JellyFpgaControl.Stub.load(request)
  end

  def upload_firmware_file2(channel, name, file_path, chunk_size) do
    case File.read(file_path) do
      {:ok, binary_data} ->
        upload_firmware(channel, name, binary_data, chunk_size)

      {:error, reason} ->
        IO.puts("file read error #{reason}")
        false
    end
  end

  def split_binary(data, max_chunk_size \\ 1024 * 1024) do
    Stream.unfold(data, fn
      <<>> ->
        nil

      chunk when byte_size(chunk) <= max_chunk_size ->
        {chunk, <<>>}

      chunk ->
        {binary_part(chunk, 0, min(byte_size(chunk), max_chunk_size)),
         binary_part(chunk, max_chunk_size, byte_size(chunk) - max_chunk_size)}
    end)
  end

  def upload_firmware(channel, name, data, max_chunk_size \\ 2 * 1024 * 1024) do
    stream = JellyFpgaControl.JellyFpgaControl.Stub.upload_firmware(channel)

    data
    |> split_binary(max_chunk_size)
    |> Enum.to_list()
    |> Enum.each(fn chunk ->
      GRPC.Stub.send_request(stream, %JellyFpgaControl.UploadFirmwareRequest{
        name: name,
        data: chunk
      })
    end)

    GRPC.Stub.end_stream(stream)
    match?({:ok, %JellyFpgaControl.BoolResponse{result: true}}, GRPC.Stub.recv(stream))
  end

  def upload_firmware_file(channel, name, file_path, max_chunk_size \\ 2 * 1024 * 1024) do
    case File.read(file_path) do
      {:ok, binary_data} ->
        upload_firmware(channel, name, binary_data, max_chunk_size)

      {:error, reason} ->
        IO.puts("file read error #{reason}")
        false
    end
  end
end
