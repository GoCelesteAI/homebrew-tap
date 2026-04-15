class Cargoterm < Formula
  desc "AI-augmented terminal — a local LLM translates natural language into shell commands"
  homepage "https://github.com/GoCelesteAI/cargoterm"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/GoCelesteAI/cargoterm/releases/download/v0.5.0/cargoterm-0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "acc10ecd650fd5b0cd4a726b22d4911a5a0e56fa9975585e2d26a7d47f11daa7"
    else
      url "https://github.com/GoCelesteAI/cargoterm/releases/download/v0.5.0/cargoterm-0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "e2da02c5c5239410a13e0b1c25603acfe61105b0aa3508ff3f44f995ed740c4a"
    end
  end

  on_linux do
    url "https://github.com/GoCelesteAI/cargoterm/releases/download/v0.5.0/cargoterm-0.5.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "1888fc21a1ccfb37de0dcb308c817012064cb4f22b4b7aa495b517e20e7733d0"
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
