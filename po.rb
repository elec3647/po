class Po < Formula
  desc "Particle Offline Utility: The Ultimate Local Particle Experience"
  homepage "https://po-util.com"
  url "https://github.com/nrobinson2000/po/archive/0.4.9.tar.gz"
  sha256 "2ba97a59acbd06303d84076dffbee31dcde39da62109104204c4a61ba4417706"
  head "https://github.com/nrobinson2000/po", :using => :git

  def install
    bin.install "bin/po"
    share.install "share/po-common"
    share.install "share/po-mac"
    man1.install "man/po.1"
    bash_completion.install "completion/po"
  end

  def caveats; <<~EOS
    In order to complete the installation of po-util,
    you must run "po install".

    For Raspberry Pi support you must have docker installed.
    EOS
  end

  test do
    system "#{bin}/po", "config", "release/v0.6.3", "duo", "false"
    system "#{bin}/po", "info"
  end
end
