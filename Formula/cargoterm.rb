class Cargoterm < Formula
  desc "AI-augmented terminal — a local LLM translates natural language into shell commands"
  homepage "https://github.com/GoCelesteAI/cargoterm"
  version "0.6.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/GoCelesteAI/cargoterm/releases/download/v0.6.2/cargoterm-0.6.2-aarch64-apple-darwin.tar.gz"
      sha256 "a67efb23c2feecf0e28d90b8e0818990c858a4be523349279bf14cd5a91dd568"
    else
      url "https://github.com/GoCelesteAI/cargoterm/releases/download/v0.6.2/cargoterm-0.6.2-x86_64-apple-darwin.tar.gz"
      sha256 "933128a0d6a1fbb39b84f8abc0e233ec4dc3d52b945118a398fe672193bde09b"
    end
  end

  on_linux do
    url "https://github.com/GoCelesteAI/cargoterm/releases/download/v0.6.2/cargoterm-0.6.2-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e6d4bcbedc856975a599763bc43a1337d433010192ca39bfc117770505404e8c"
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
