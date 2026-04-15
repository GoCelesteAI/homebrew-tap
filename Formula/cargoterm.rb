class Cargoterm < Formula
  desc "AI-augmented terminal — a local LLM translates natural language into shell commands"
  homepage "https://github.com/GoCelesteAI/cargoterm"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/GoCelesteAI/cargoterm/releases/download/v0.6.0/cargoterm-0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "c2f6425e6361d7195d3e089bc7dcbcc069f5e0b887b42bda0c859127ae0ebc50"
    else
      url "https://github.com/GoCelesteAI/cargoterm/releases/download/v0.6.0/cargoterm-0.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "ad5d080d0a14d7c71429a79b9caba1e4994155da3555ab146293a4b6903cf5f3"
    end
  end

  on_linux do
    url "https://github.com/GoCelesteAI/cargoterm/releases/download/v0.6.0/cargoterm-0.6.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "3671d4cb713dead67f35cd08eddcffac1f4b5d7a0c419c7164724f171d6ee758"
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
