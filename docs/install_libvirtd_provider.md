# Installation

Terraform instal·lation on macos can be found at reference https://learn.hashicorp.com/tutorials/terraform/install-cli using Homebrew.

```
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
brew upgrade hashicorp/tap/terraform
terraform -help
```

These are the required steps to install libvirt provider to work with Terraform v0.14.9 on my macbook pro (Big sur).

```
brew install golang
brew install libvirt
brew install pkg-conf
go version
go get github.com/dmacvicar/terraform-provider-libvirt
go install github.com/dmacvicar/terraform-provider-libvirt
ls ~/go/bin/terraform-provider-libvirt
mkdir -p ~/.terraform.d/plugins/registry.terraform.io/dmacvicar/libvirt/0.6.2/darwin_amd64/
cp ~/go/bin/terraform-provider-libvirt ~/.terraform.d/plugins/registry.terraform.io/dmacvicar/libvirt/0.6.2/darwin_amd64/
brew install cdrtools
```