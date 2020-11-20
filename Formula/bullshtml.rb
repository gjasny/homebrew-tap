class Bullshtml < Formula
  desc "Html Reporter for BullseyeCoverage tool."
  homepage "https://github.com/RafalSkorka/bullshtml"
  url "https://github.com/RafalSkorka/bullshtml.git",
      :tag => "1.2.1",
      :revision => "6c2d0d7182b91a32b3c6d188ea4113f2047b7377"

  depends_on "ant" => :build
  depends_on "openjdk"

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
