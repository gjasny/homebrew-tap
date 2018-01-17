class Xcpretty < Formula
  desc "Flexible and fast xcodebuild formatter"
  homepage "https://github.com/supermarin/xcpretty"
  url "https://github.com/supermarin/xcpretty/archive/v0.2.8.tar.gz"
  sha256 "9f99f74d0e0540ea8573fdd7f1da1ab74e6b0f2d5860713442ac456a000362d8"

  bottle do
    cellar :any
  end

  def install
    ENV["GEM_HOME"] = libexec
    system "gem", "build", "xcpretty.gemspec"
    system "gem", "install", "xcpretty-#{version}.gem"
    bin.install "libexec/bin/xcpretty"
    #bin.env_script_all_files("libexec/bin", :GEM_HOME => ENV["GEM_HOME"])
  end

  test do
    #system "#{bin}/xcpretty", "--version"
  end
end