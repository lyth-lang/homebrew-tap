class Lyth < Formula
  desc "Statically typed language that compiles to readable Go"
  homepage "https://lyth.bkymz.net"
  url "https://github.com/lyth-lang/lyth/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "c5083ae2bfa1455b022036592380258a31691918560f8ee39da2403eb9c079d6"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/lyth-lang/lyth.git", branch: "main"

  # lyth generates Go and builds it with the go command, so Go is needed at run time too.
  depends_on "go"

  def install
    system "go", "build", *std_go_args(ldflags: "-X main.version=#{version}"), "./cmd/lyth"
  end

  test do
    assert_match "lyth version #{version}", shell_output("#{bin}/lyth version")

    (testpath/"hello.lyth").write <<~LYTH
      func main() {
          name := "Lyth"
          println("hello, ${name}")
      }
    LYTH
    assert_equal "hello, Lyth\n", shell_output("#{bin}/lyth run hello.lyth")
  end
end
