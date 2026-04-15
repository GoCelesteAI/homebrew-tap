class Cargoterm < Formula
  desc "AI-augmented terminal — a local LLM translates natural language into shell commands"
  homepage "https://github.com/GoCelesteAI/cargoterm"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/GoCelesteAI/cargoterm/releases/download/v0.3.0/cargoterm-0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "d9aaf5dea2a0c82bd58043f6e8bd926b75be057dd9ac141261ec1a5d6d67693a"
    else
      url "https://github.com/GoCelesteAI/cargoterm/releases/download/v0.3.0/cargoterm-0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "7c8a8cceab64bcab0e5aed977b50d50d52a0aac5e49114eff4d9286e07544adc"
    end
  end

  on_linux do
    url "https://github.com/GoCelesteAI/cargoterm/releases/download/v0.3.0/cargoterm-0.3.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "754b4225b5a89aa36cae588748af690211047d2de3b84fe0ab6ac56d7d0bd3c2"
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
