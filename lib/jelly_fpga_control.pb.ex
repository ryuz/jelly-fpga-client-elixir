defmodule JellyFpgaControl.Empty do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.13.0"
end

defmodule JellyFpgaControl.BoolResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.13.0"

  field :result, 1, type: :bool
end

defmodule JellyFpgaControl.ResetRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.13.0"
end

defmodule JellyFpgaControl.LoadRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.13.0"

  field :name, 1, type: :string
end

defmodule JellyFpgaControl.LoadResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.13.0"

  field :result, 1, type: :bool
  field :slot, 2, type: :int32
end

defmodule JellyFpgaControl.UnloadRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.13.0"

  field :slot, 1, type: :int32
end

defmodule JellyFpgaControl.UploadFirmwareRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.13.0"

  field :name, 1, type: :string
  field :data, 2, type: :bytes
end

defmodule JellyFpgaControl.RemoveFirmwareRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.13.0"

  field :name, 1, type: :string
end

defmodule JellyFpgaControl.LoadBitstreamRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.13.0"

  field :name, 1, type: :string
end

defmodule JellyFpgaControl.LoadDtboRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.13.0"

  field :name, 1, type: :string
end

defmodule JellyFpgaControl.DtsToDtbRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.13.0"

  field :dts, 1, type: :string
end

defmodule JellyFpgaControl.DtsToDtbResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.13.0"

  field :result, 1, type: :bool
  field :dtb, 2, type: :bytes
end

defmodule JellyFpgaControl.BitstreamToBinRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.13.0"

  field :bitstream_name, 1, type: :string, json_name: "bitstreamName"
  field :bin_name, 2, type: :string, json_name: "binName"
  field :arch, 3, type: :string
end

defmodule JellyFpgaControl.OpenMmapRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.13.0"

  field :path, 1, type: :string
  field :offset, 2, type: :uint64
  field :size, 3, type: :uint64
  field :unit, 4, type: :uint64
end

defmodule JellyFpgaControl.OpenUioRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.13.0"

  field :name, 1, type: :string
  field :unit, 2, type: :uint64
end

defmodule JellyFpgaControl.OpenUdmabufRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.13.0"

  field :name, 1, type: :string
  field :cache_enable, 2, type: :bool, json_name: "cacheEnable"
  field :unit, 3, type: :uint64
end

defmodule JellyFpgaControl.OpenResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.13.0"

  field :result, 1, type: :bool
  field :id, 2, type: :uint32
end

defmodule JellyFpgaControl.CloseRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.13.0"

  field :id, 1, type: :uint32
end

defmodule JellyFpgaControl.SubcloneRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.13.0"

  field :id, 1, type: :uint32
  field :offset, 2, type: :uint64
  field :size, 3, type: :uint64
  field :unit, 4, type: :uint64
end

defmodule JellyFpgaControl.SubcloneResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.13.0"

  field :result, 1, type: :bool
  field :id, 2, type: :uint32
end

defmodule JellyFpgaControl.GetAddrRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.13.0"

  field :id, 1, type: :uint32
end

defmodule JellyFpgaControl.GetAddrResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.13.0"

  field :result, 1, type: :bool
  field :addr, 2, type: :uint64
end

defmodule JellyFpgaControl.GetSizeRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.13.0"

  field :id, 1, type: :uint32
end

defmodule JellyFpgaControl.GetSizeResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.13.0"

  field :result, 1, type: :bool
  field :size, 2, type: :uint64
end

defmodule JellyFpgaControl.GetPhysAddrRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.13.0"

  field :id, 1, type: :uint32
end

defmodule JellyFpgaControl.GetPhysAddrResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.13.0"

  field :result, 1, type: :bool
  field :phys_addr, 2, type: :uint64, json_name: "physAddr"
end

defmodule JellyFpgaControl.WriteMemURequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.13.0"

  field :id, 1, type: :uint32
  field :offset, 2, type: :uint64
  field :data, 3, type: :uint64
  field :size, 4, type: :uint64
end

defmodule JellyFpgaControl.WriteMemIRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.13.0"

  field :id, 1, type: :uint32
  field :offset, 2, type: :uint64
  field :data, 3, type: :int64
  field :size, 4, type: :uint64
end

defmodule JellyFpgaControl.ReadMemRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.13.0"

  field :id, 1, type: :uint32
  field :offset, 2, type: :uint64
  field :size, 3, type: :uint64
end

defmodule JellyFpgaControl.WriteRegURequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.13.0"

  field :id, 1, type: :uint32
  field :reg, 2, type: :uint64
  field :data, 3, type: :uint64
  field :size, 4, type: :uint64
end

defmodule JellyFpgaControl.WriteRegIRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.13.0"

  field :id, 1, type: :uint32
  field :reg, 2, type: :uint64
  field :data, 3, type: :int64
  field :size, 4, type: :uint64
end

defmodule JellyFpgaControl.ReadRegRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.13.0"

  field :id, 1, type: :uint32
  field :reg, 2, type: :uint64
  field :size, 3, type: :uint64
end

defmodule JellyFpgaControl.ReadUResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.13.0"

  field :result, 1, type: :bool
  field :data, 2, type: :uint64
end

defmodule JellyFpgaControl.ReadIResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.13.0"

  field :result, 1, type: :bool
  field :data, 2, type: :int64
end

defmodule JellyFpgaControl.WriteMemF32Request do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.13.0"

  field :id, 1, type: :uint32
  field :offset, 2, type: :uint64
  field :data, 3, type: :float
end

defmodule JellyFpgaControl.WriteMemF64Request do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.13.0"

  field :id, 1, type: :uint32
  field :offset, 2, type: :uint64
  field :data, 3, type: :double
end

defmodule JellyFpgaControl.ReadF32Response do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.13.0"

  field :result, 1, type: :bool
  field :data, 2, type: :float
end

defmodule JellyFpgaControl.ReadF64Response do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.13.0"

  field :result, 1, type: :bool
  field :data, 2, type: :double
end

defmodule JellyFpgaControl.WriteRegF32Request do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.13.0"

  field :id, 1, type: :uint32
  field :reg, 2, type: :uint64
  field :data, 3, type: :float
end

defmodule JellyFpgaControl.WriteRegF64Request do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.13.0"

  field :id, 1, type: :uint32
  field :reg, 2, type: :uint64
  field :data, 3, type: :double
end

defmodule JellyFpgaControl.MemCopyToRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.13.0"

  field :id, 1, type: :uint32
  field :offset, 2, type: :uint64
  field :data, 3, type: :bytes
end

defmodule JellyFpgaControl.MemCopyFromRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.13.0"

  field :id, 1, type: :uint32
  field :offset, 2, type: :uint64
  field :size, 3, type: :uint64
end

defmodule JellyFpgaControl.MemCopyFromResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.13.0"

  field :result, 1, type: :bool
  field :data, 2, type: :bytes
end

defmodule JellyFpgaControl.JellyFpgaControl.Service do
  @moduledoc false

  use GRPC.Service,
    name: "jelly_fpga_control.JellyFpgaControl",
    protoc_gen_elixir_version: "0.13.0"

  rpc :Reset, JellyFpgaControl.ResetRequest, JellyFpgaControl.BoolResponse

  rpc :Load, JellyFpgaControl.LoadRequest, JellyFpgaControl.LoadResponse

  rpc :Unload, JellyFpgaControl.UnloadRequest, JellyFpgaControl.BoolResponse

  rpc :UploadFirmware,
      stream(JellyFpgaControl.UploadFirmwareRequest),
      JellyFpgaControl.BoolResponse

  rpc :RemoveFirmware, JellyFpgaControl.RemoveFirmwareRequest, JellyFpgaControl.BoolResponse

  rpc :LoadBitstream, JellyFpgaControl.LoadBitstreamRequest, JellyFpgaControl.BoolResponse

  rpc :LoadDtbo, JellyFpgaControl.LoadDtboRequest, JellyFpgaControl.BoolResponse

  rpc :DtsToDtb, JellyFpgaControl.DtsToDtbRequest, JellyFpgaControl.DtsToDtbResponse

  rpc :BitstreamToBin, JellyFpgaControl.BitstreamToBinRequest, JellyFpgaControl.BoolResponse

  rpc :OpenMmap, JellyFpgaControl.OpenMmapRequest, JellyFpgaControl.OpenResponse

  rpc :OpenUio, JellyFpgaControl.OpenUioRequest, JellyFpgaControl.OpenResponse

  rpc :OpenUdmabuf, JellyFpgaControl.OpenUdmabufRequest, JellyFpgaControl.OpenResponse

  rpc :Close, JellyFpgaControl.CloseRequest, JellyFpgaControl.BoolResponse

  rpc :Subclone, JellyFpgaControl.SubcloneRequest, JellyFpgaControl.SubcloneResponse

  rpc :GetAddr, JellyFpgaControl.GetAddrRequest, JellyFpgaControl.GetAddrResponse

  rpc :GetSize, JellyFpgaControl.GetSizeRequest, JellyFpgaControl.GetSizeResponse

  rpc :GetPhysAddr, JellyFpgaControl.GetPhysAddrRequest, JellyFpgaControl.GetPhysAddrResponse

  rpc :WriteMemU, JellyFpgaControl.WriteMemURequest, JellyFpgaControl.BoolResponse

  rpc :WriteMemI, JellyFpgaControl.WriteMemIRequest, JellyFpgaControl.BoolResponse

  rpc :ReadMemU, JellyFpgaControl.ReadMemRequest, JellyFpgaControl.ReadUResponse

  rpc :ReadMemI, JellyFpgaControl.ReadMemRequest, JellyFpgaControl.ReadIResponse

  rpc :WriteRegU, JellyFpgaControl.WriteRegURequest, JellyFpgaControl.BoolResponse

  rpc :WriteRegI, JellyFpgaControl.WriteRegIRequest, JellyFpgaControl.BoolResponse

  rpc :ReadRegU, JellyFpgaControl.ReadRegRequest, JellyFpgaControl.ReadUResponse

  rpc :ReadRegI, JellyFpgaControl.ReadRegRequest, JellyFpgaControl.ReadIResponse

  rpc :WriteMemF32, JellyFpgaControl.WriteMemF32Request, JellyFpgaControl.BoolResponse

  rpc :WriteMemF64, JellyFpgaControl.WriteMemF64Request, JellyFpgaControl.BoolResponse

  rpc :ReadMemF32, JellyFpgaControl.ReadMemRequest, JellyFpgaControl.ReadF32Response

  rpc :ReadMemF64, JellyFpgaControl.ReadMemRequest, JellyFpgaControl.ReadF64Response

  rpc :WriteRegF32, JellyFpgaControl.WriteRegF32Request, JellyFpgaControl.BoolResponse

  rpc :WriteRegF64, JellyFpgaControl.WriteRegF64Request, JellyFpgaControl.BoolResponse

  rpc :ReadRegF32, JellyFpgaControl.ReadRegRequest, JellyFpgaControl.ReadF32Response

  rpc :ReadRegF64, JellyFpgaControl.ReadRegRequest, JellyFpgaControl.ReadF64Response

  rpc :MemCopyTo, JellyFpgaControl.MemCopyToRequest, JellyFpgaControl.BoolResponse

  rpc :MemCopyFrom, JellyFpgaControl.MemCopyFromRequest, JellyFpgaControl.MemCopyFromResponse
end

defmodule JellyFpgaControl.JellyFpgaControl.Stub do
  @moduledoc false

  use GRPC.Stub, service: JellyFpgaControl.JellyFpgaControl.Service
end