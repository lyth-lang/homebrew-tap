class Lyth < Formula
  desc "Statically typed language that compiles to readable Go"
  homepage "https://lyth.bkymz.net"
  url "https://github.com/lyth-lang/lyth/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "8b9e3934f580cf87611da28e822b099acf6da908272e6666c4c19ad4f4707e80"
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
