class Bullshtml < Formula
  desc "Html Reporter for BullseyeCoverage tool."
  homepage "https://github.com/RafalSkorka/bullshtml"
  url "https://github.com/RafalSkorka/bullshtml.git",
      :tag => "1.2.0",
      :revision => "43efec2ff5ea7db9622c679616908aeacf46e7b8"
  revision 1

  depends_on "ant" => :build
  depends_on "openjdk"

  # Apply fix for https://github.com/RafalSkorka/bullshtml/pull/27
  patch do
    url "https://github.com/gjasny/bullshtml/commit/15eac03fba05676a562f50542c189b5699429626.diff?full_index=1"
    sha256 "a3e470408919e90c56e40ab75b8da1009afb35353ccecb7379fa79fd06a69bf2"
  end

  def install
    system "ant", "make_onejar", "-Ddebuglevel=none"

    libexec.install "target/bullshtml.jar"
    (bin/"bullshtml").write <<~EOS
      #!/bin/bash
      exec "#{Formula["openjdk"].opt_bin}/java" -jar #{libexec}/bullshtml.jar "$@"
    EOS
  end

  test do
    system bin/"bullshtml", "-h"
  end
end
