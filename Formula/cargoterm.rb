class Cargoterm < Formula
  desc "AI-augmented terminal — a local LLM translates natural language into shell commands"
  homepage "https://github.com/GoCelesteAI/cargoterm"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/GoCelesteAI/cargoterm/releases/download/v0.4.0/cargoterm-0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "18304159eaad5c1753feb975e3e4131f58cb9d1b17bc5f63505e5eebe61aa83d"
    else
      url "https://github.com/GoCelesteAI/cargoterm/releases/download/v0.4.0/cargoterm-0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "67f3cc2f4f81089e5f5b9c86bf1c8daecbd6c35843926b81fc6ff157d6f7ad7c"
    end
  end

  on_linux do
    url "https://github.com/GoCelesteAI/cargoterm/releases/download/v0.4.0/cargoterm-0.4.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "be59a5743701444fd3635ffcfeb72ec303e96a15d017d046f2027dc63e977061"
  end

  def install
    bin.install "cargoterm"
    doc.install "README.md", "LICENSE"
  end

  def caveats
    <<~EOS
      cargoterm needs a local Ollama instance and a pulled model.

        brew install ollama
        ollama serve &
        cargoterm --setup    # pulls the default model (qwen3:14b, ~9 GB)

      Then run `cargoterm` to start the REPL.
    EOS
  end

  test do
    assert_match "cargoterm #{version}", shell_output("#{bin}/cargoterm --version")
  end
end
