# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Taxonkit < Formula
  desc "A Practical and Efficient NCBI Taxonomy Toolkit, also supports creating NCBI-style taxdump files for custom taxonomies like GTDB/ICTV"
  homepage "https://bioinf.shenwei.me/taxonkit"
  url "https://github.com/shenwei356/taxonkit/archive/refs/tags/v0.20.0.tar.gz"
  version "0.20.0"
  sha256 "eb5a6641264f84997eaa22df7c9cad735c100b434dfd62c2560aba78164f34f6"
  license "MIT"

  depends_on "go" => :build

  def install
    # Remove unrecognized options if they cause configure to fail
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method

    system "go", "build", "-C", "taxonkit"
    bin.install "taxonkit/taxonkit"
  end

  test do
	shell_output("#{bin}/taxonkit --help 1>&2", result = 0)
  end
end
