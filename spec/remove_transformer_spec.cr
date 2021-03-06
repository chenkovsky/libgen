require "./spec_helper"

describe "LibGenerator::RemoveTransformer" do
  describe "transform" do
    it "removes the specified nodes" do
      sources = [
        "fun a",
        "fun b",
        "fun c",
        "fun d",
        "fun e",
      ]
      ast = Crystal::Parser.parse("lib L\n#{sources.join("\n")}\nend")

      transformer = LibGenerator::RemoveTransformer.new(ast_nodes(sources[0..1]))

      ast.transform(transformer)
      ast.as?(Crystal::LibDef).not_nil!.body.as(Crystal::Expressions).expressions.size.should eq(3)
      ast.to_s.should eq("lib L\n  #{sources[2..-1].join("\n  ")}\nend")
    end
  end
end
