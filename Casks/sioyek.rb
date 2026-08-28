cask "sioyek" do
  version :latest
  sha256 ""

  url "https://github.com/ahrm/sioyek/releases/download/sioyek3-alpha0/sioyek-release-mac-arm.zip",
      verified: "github.com/ahrm/sioyek/"
  name "Sioyek"
  desc "PDF viewer designed for reading research papers and technical books"
  homepage "https://sioyek.info/"

  depends_on :macos
  container nested: "build/sioyek.dmg"

  app "sioyek.app"
  command_wrapper "sioyek",
                  executable: "#{appdir}/sioyek.app/Contents/MacOS/sioyek"

  postflight do
    system_command "/usr/bin/xattr",
      args: ["-dr", "com.apple.quarantine", "#{appdir}/sioyek.app"]
  end

  zap trash: [
    "~/Library/Application Support/sioyek",
    "~/Library/Saved Application State/com.yourcompany.sioyek.savedState",
  ]
end
