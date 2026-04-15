class Cargoterm < Formula
  desc "AI-augmented terminal — a local LLM translates natural language into shell commands"
  homepage "https://github.com/GoCelesteAI/cargoterm"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/GoCelesteAI/cargoterm/releases/download/v0.2.0/cargoterm-0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "364323312aa6919a50463ec82f2659758c40f784bcce6114d749a6962f4800e9"
    else
      url "https://github.com/GoCelesteAI/cargoterm/releases/download/v0.2.0/cargoterm-0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "74480ad8bdab6ee8192d1b27aa34aa5b6a4c0c794d0b536097814123a92115fc"
    end
  end

  on_linux do
    url "https://github.com/GoCelesteAI/cargoterm/releases/download/v0.2.0/cargoterm-0.2.0-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f520985ccfa77049850191c68015ddd72248fff0ea2e8427ff605ad765abc6a2"
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
