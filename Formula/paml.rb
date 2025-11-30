# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://docs.brew.sh/rubydoc/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Paml < Formula
  desc "PAML is a package of programs for phylogenetic analyses of DNA or protein sequences using maximum likelihood. Please report only **technical issues** on this repository (e.g., compiling, programs abort, etc.). Problems with input data (e.g., error/warning messages) & general questions should be posted at https://groups.google.com/g/pamlsoftware?pli"
  homepage "https://github.com/abacus-gene/paml"
  url "https://github.com/abacus-gene/paml/archive/refs/tags/v4.10.9.tar.gz"
  sha256 "19ca9d484d729324748b9c86453e4c8f4a1fa79ad6fa3ac7cdbfaa7d0bfb8c22"
  license "GPL-3.0"

  def install
    system "make", "-C", "src"
    bin.install "src/baseml", "src/basemlg", "src/chi2", "src/codeml", "src/evolver", "src/infinitesites", "src/mcmctree", "src/pamp", "src/yn00"
  end

  test do
    shell_output("echo 'q' | #{bin}/chi2", result = 0)
  end
end
