class Cargoterm < Formula
  desc "AI-augmented terminal — a local LLM translates natural language into shell commands"
  homepage "https://github.com/GoCelesteAI/cargoterm"
  version "0.6.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/GoCelesteAI/cargoterm/releases/download/v0.6.1/cargoterm-0.6.1-aarch64-apple-darwin.tar.gz"
      sha256 "0b2b6cc43753b527d95f6984453a56a1c76254a72f5d7c7bb3347f189f1c10e0"
    else
      url "https://github.com/GoCelesteAI/cargoterm/releases/download/v0.6.1/cargoterm-0.6.1-x86_64-apple-darwin.tar.gz"
      sha256 "623768241aac4218e0ce868fddff32cf5bead06a50a9670d7fc3dd53d69ca8ea"
    end
  end

  on_linux do
    url "https://github.com/GoCelesteAI/cargoterm/releases/download/v0.6.1/cargoterm-0.6.1-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b643c4d60029678149a2a803bfebd633d355b7b7fedd20f7334ae9a14b94bb8a"
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
