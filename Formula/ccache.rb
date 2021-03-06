class Ccache < Formula
  desc "Memcached-enabled compiler cache"
  homepage "https://ccache.dev/"
  url "https://github.com/gjasny/ccache-memcached.git",
      :tag => "3.4.3memcached1",
      :revision => "74efcfd9f162a1b15453ff1abfc97ccced2f7dd1"
  version "3.4.3memcached1"

  uses_from_macos "zlib"

  depends_on "libmemcached"
  depends_on "asciidoc" => :build
  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build

  def install
    ENV["XML_CATALOG_FILES"] = etc/"xml/catalog"

    system "./autogen.sh"
    system "./configure", "--enable-memcached", "--prefix=#{prefix}", "--mandir=#{man}"
    system "make"
    system "make", "install"
  end

  test do
    system "#{bin}/ccache", "-s"
  end
end
