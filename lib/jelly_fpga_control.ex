defmodule JellyFpgaControl do
  def reset(channel) do
    request = %JellyFpgaControl.ResetRequest{}

    case JellyFpgaControl.JellyFpgaControl.Stub.reset(channel, request) do
      {:ok, %JellyFpgaControl.BoolResponse{result: true}} -> :ok
      {:ok, %JellyFpgaControl.BoolResponse{result: false}} -> {:error, :reset_failed}
      {:error, reason} -> {:error, reason}
    end
  end

  def unload(channel, slot \\ 0) do
    request = %JellyFpgaControl.UnloadRequest{slot: slot}

    case JellyFpgaControl.JellyFpgaControl.Stub.unload(channel, request) do
      {:ok, %JellyFpgaControl.BoolResponse{result: true}} -> :ok
      {:ok, %JellyFpgaControl.BoolResponse{result: false}} -> {:error, :unload_failed}
      {:error, reason} -> {:error, reason}
    end
  end

  def load(channel, name) do
    request = %JellyFpgaControl.LoadRequest{name: name}

    case JellyFpgaControl.JellyFpgaControl.Stub.load(channel, request) do
      {:ok, %JellyFpgaControl.BoolResponse{result: true}} -> :ok
      {:ok, %JellyFpgaControl.BoolResponse{result: false}} -> {:error, :load_failed}
      {:error, reason} -> {:error, reason}
    end
  end

  defp split_binary(data, max_chunk_size) do
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

    case GRPC.Stub.recv(stream) do
      {:ok, %JellyFpgaControl.BoolResponse{result: true}} -> :ok
      {:ok, %JellyFpgaControl.BoolResponse{result: false}} -> {:error, :upload_failed}
      {:error, reason} -> {:error, reason}
    end
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

  def remove_firmware(channel, name) do
    request = %JellyFpgaControl.RemoveFirmwareRequest{name: name}

    case JellyFpgaControl.JellyFpgaControl.Stub.remove_firmware(channel, request) do
      {:ok, %JellyFpgaControl.BoolResponse{result: true}} -> :ok
      {:ok, %JellyFpgaControl.BoolResponse{result: false}} -> {:error, :remove_firmware_failed}
      {:error, reason} -> {:error, reason}
    end
  end

  def load_bitstream(channel, name) do
    request = %JellyFpgaControl.LoadBitstreamRequest{name: name}

    case JellyFpgaControl.JellyFpgaControl.Stub.load_bitstream(channel, request) do
      {:ok, %JellyFpgaControl.BoolResponse{result: true}} -> :ok
      {:ok, %JellyFpgaControl.BoolResponse{result: false}} -> {:error, :load_bitstream_failed}
      {:error, reason} -> {:error, reason}
    end
  end

  def load_dtbo(channel, name) do
    request = %JellyFpgaControl.LoadDtboRequest{name: name}

    case JellyFpgaControl.JellyFpgaControl.Stub.load_dtbo(channel, request) do
      {:ok, %JellyFpgaControl.BoolResponse{result: true}} -> :ok
      {:ok, %JellyFpgaControl.BoolResponse{result: false}} -> {:error, :load_dtbo_failed}
      {:error, reason} -> {:error, reason}
    end
  end

  def dts_to_dtb(channel, dts) do
    request = %JellyFpgaControl.DtsToDtbRequest{dts: dts}

    case JellyFpgaControl.JellyFpgaControl.Stub.dts_to_dtb(channel, request) do
      {:ok, %JellyFpgaControl.DtsToDtbResponse{result: true, dtb: dtb}} -> {:ok, dtb}
      {:ok, %JellyFpgaControl.DtsToDtbResponse{result: false}} -> {:error, :load_dtbo_failed}
      {:error, reason} -> {:error, reason}
    end
  end

  def bitstream_to_bin(channel, bitstream_name, bin_name, arch) do
    request = %JellyFpgaControl.BitstreamToBinRequest{
      bitstream_name: bitstream_name,
      bin_name: bin_name,
      arch: arch
    }

    case JellyFpgaControl.JellyFpgaControl.Stub.bitstream_to_bin(channel, request) do
      {:ok, %JellyFpgaControl.BoolResponse{result: true}} -> :ok
      {:ok, %JellyFpgaControl.BoolResponse{result: false}} -> {:error, :load_dtbo_failed}
      {:error, reason} -> {:error, reason}
    end
  end

  def open_mmap(channel, path, offset, size, unit \\ 0) do
    request = %JellyFpgaControl.OpenMmapRequest{
      path: path,
      offset: offset,
      size: size,
      unit: unit
    }

    case JellyFpgaControl.JellyFpgaControl.Stub.open_mmap(channel, request) do
      {:ok, %JellyFpgaControl.OpenResponse{result: true, id: id}} -> {:ok, id}
      {:ok, %JellyFpgaControl.OpenResponse{result: false}} -> {:error, :open_mmap_failed}
      {:error, reason} -> {:error, reason}
    end
  end

  def write_mem_u(channel, id, offset, data, size) do
    request = %JellyFpgaControl.WriteMemURequest{id: id, offset: offset, data: data, size: size}

    case JellyFpgaControl.JellyFpgaControl.Stub.write_mem_u(channel, request) do
      {:ok, %JellyFpgaControl.BoolResponse{result: true}} -> :ok
      {:ok, %JellyFpgaControl.BoolResponse{result: false}} -> {:error, :write_mem_failed}
      {:error, reason} -> {:error, reason}
    end
  end

  def write_mem_u8(channel, id, offset, data) do
    write_mem_u(channel, id, offset, data, 1)
  end

  def write_mem_u16(channel, id, offset, data) do
    write_mem_u(channel, id, offset, data, 2)
  end

  def write_mem_u32(channel, id, offset, data) do
    write_mem_u(channel, id, offset, data, 4)
  end

  def write_mem_u64(channel, id, offset, data) do
    write_mem_u(channel, id, offset, data, 8)
  end

  def write_mem_i(channel, id, offset, data, size) do
    request = %JellyFpgaControl.WriteMemIRequest{id: id, offset: offset, data: data, size: size}

    case JellyFpgaControl.JellyFpgaControl.Stub.write_mem_i(channel, request) do
      {:ok, %JellyFpgaControl.BoolResponse{result: true}} -> :ok
      {:ok, %JellyFpgaControl.BoolResponse{result: false}} -> {:error, :write_mem_failed}
      {:error, reason} -> {:error, reason}
    end
  end

  def write_mem_i8(channel, id, offset, data) do
    write_mem_i(channel, id, offset, data, 1)
  end

  def write_mem_i16(channel, id, offset, data) do
    write_mem_i(channel, id, offset, data, 2)
  end

  def write_mem_i32(channel, id, offset, data) do
    write_mem_i(channel, id, offset, data, 4)
  end

  def write_mem_i64(channel, id, offset, data) do
    write_mem_i(channel, id, offset, data, 8)
  end

  def read_mem_u(channel, id, offset, size) do
    request = %JellyFpgaControl.ReadMemRequest{id: id, offset: offset, size: size}
    case JellyFpgaControl.JellyFpgaControl.Stub.read_mem_u(channel, request) do
      {:ok, %JellyFpgaControl.ReadUResponse{result: true,  data: data}} -> {:ok, data}
      {:ok, %JellyFpgaControl.ReadUResponse{result: false, data: _}} -> {:error, :write_mem_failed}
      {:error, reason} -> {:error, reason}
    end
  end

  def read_mem_u8(channel, id, offset) do
    read_mem_u(channel, id, offset, 1)
  end

  def read_mem_u16(channel, id, offset) do
    read_mem_u(channel, id, offset, 2)
  end

  def read_mem_u32(channel, id, offset) do
    read_mem_u(channel, id, offset, 4)
  end

  def read_mem_u64(channel, id, offset) do
    read_mem_u(channel, id, offset, 8)
  end

  def read_mem_i(channel, id, offset, size) do
    request = %JellyFpgaControl.ReadMemRequest{id: id, offset: offset, size: size}
    case JellyFpgaControl.JellyFpgaControl.Stub.read_mem_i(channel, request) do
      {:ok, %JellyFpgaControl.ReadIResponse{result: true,  data: data}} -> {:ok, data}
      {:ok, %JellyFpgaControl.ReadIResponse{result: false, data: _}} -> {:error, :write_mem_failed}
      {:error, reason} -> {:error, reason}
    end
  end

  def read_mem_i8(channel, id, offset) do
    read_mem_i(channel, id, offset, 1)
  end

  def read_mem_i16(channel, id, offset) do
    read_mem_i(channel, id, offset, 2)
  end

  def read_mem_i32(channel, id, offset) do
    read_mem_i(channel, id, offset, 4)
  end

  def read_mem_i64(channel, id, offset) do
    read_mem_i(channel, id, offset, 8)
  end

end
