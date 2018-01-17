class Xcpretty < Formula
  homepage "https://github.com/supermarin/xcpretty"
  url "https://github.com/supermarin/xcpretty/archive/v0.2.8.tar.gz"
  sha256 "9f99f74d0e0540ea8573fdd7f1da1ab74e6b0f2d5860713442ac456a000362d8"

  patch :DATA

  def install
    prefix.install "vendor"
    prefix.install "lib" => "rubylib"

    bin.install "bin/xcpretty"
  end

  test do
    system "#{bin}/xcpretty", "--version"
  end
end

__END__
diff --git a/bin/xcpretty b/bin/xcpretty
index c42f1b0..11bde17 100755
--- a/bin/xcpretty
+++ b/bin/xcpretty
@@ -1,12 +1,14 @@
-#!/usr/bin/env ruby
+#!/usr/bin/env ruby --disable-gems
 
 if RUBY_VERSION < '2.0.0'
   abort "error: XCPretty requires Ruby 2.0.0 or higher."
 end
 
-if $PROGRAM_NAME == __FILE__
-  $LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
-end
+require 'pathname'
+
+file_path = Pathname.new(__FILE__).realpath
+$LOAD_PATH.unshift(File.expand_path("../../rubylib", file_path))
+
 require 'xcpretty'
 require 'optparse'
 
