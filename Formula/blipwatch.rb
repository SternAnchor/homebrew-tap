class Blipwatch < Formula
  desc "Server-based interface for HALO-based radars"
  homepage "https://github.com/SternAnchor/blipwatch"
  url "https://registry.npmjs.org/blipwatch/-/blipwatch-1.4.0.tgz"
  sha256 "6e6f6028cafe2047c71dda849196c50729181f214575900996424b226203035e"
  license "GPL-3.0-only"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args(libexec)
    bin.install_symlink libexec/"bin/blipwatch" => "blipwatch"
  end

  test do
    package = libexec/"lib/node_modules/blipwatch/package.json"
    assert_predicate package, :exist?
    assert_match version.to_s, package.read
  end
end
