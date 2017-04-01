# FIXME: use the shard
require "../crystal_lib/src/clang"
require "../crystal_lib/src/crystal_lib"
require "compiler/crystal/syntax"

class LibGenerator::CrystalLibTransformer < CrystalLib::LibTransformer
  getter headers : String
  getter flags : Array(String)
  getter prefixes : Array(String)

  def initialize
    super
    @headers = ""
    @flags = [] of String
    @prefixes = [] of String
  end

  def transform(node : Crystal::LibDef)
    @headers, @flags, @prefixes, _ = process_includes
    node
  end
end