class Xsnmp < Formula
  desc "SNMP agent extension to query macOS values"
  homepage "https://github.com/gjasny/Xsnmp"
  url "https://github.com/gjasny/Xsnmp/archive/v1.2.1.tar.gz"
  sha256 "7001b0de15517235990b5a3880fba203724e7a5181b8ea3cf5c97cddc6783cc6"
  head "https://github.com/gjasny/Xsnmp.git"

  depends_on "libtool" => :build
  depends_on "automake" => :build
  depends_on "autoconf" => :build

  #depends_on "net-snmp"
  depends_on "pcre"

  def install
    system "autoreconf -vfi"
    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
    (share/"snmp/mibs").install("mib/XSNMP-MIB.txt")
  end

  plist_options :manual => true

  def plist; <<-EOS.undent
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
      <key>Label</key>
      <string>#{plist_name}</string>
      <key>ProgramArguments</key>
      <array>
        <string>#{opt_sbin}/xsnmp</string>
        <string>-f</string>
      </array>
      <key>RunAtLoad</key>
      <true/>
    </dict>
    </plist>
    EOS
  end

  test do
    system "#{sbin}/xsnmp", "--help"
  end
end
