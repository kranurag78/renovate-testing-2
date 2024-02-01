# renovate: datasource=github-tags depName=kubernetes-sigs/cluster-api
CLUSTERCTL_VERSION ?= v1.6.0
# renovate: datasource=github-tags depName=helm/helm
HELM_VERSION ?= v3.14.0
# renovate: datasource=github-tags depName=kubernetes-sigs/kind
KIND_VERSION ?= v0.19.0

CLUSTERCTL := $(abspath $(TOOLS_BIN_DIR)/clusterctl)
clusterctl: $(CLUSTERCTL) ## Build a local copy of clusterctl
$(CLUSTERCTL):
	curl -sSLf https://github.com/kubernetes-sigs/cluster-api/releases/download/v1.6.0/clusterctl-$$(go env GOOS)-$$(go env GOARCH) -o $(CLUSTERCTL)
	chmod a+rx $(CLUSTERCTL)

HELM := $(abspath $(TOOLS_BIN_DIR)/helm)
helm: $(HELM) ## Build a local copy of helm
$(HELM):
	curl -sSL https://get.helm.sh/helm-v3.13.2-linux-amd64.tar.gz | tar xz -C $(TOOLS_BIN_DIR) --strip-components=1 linux-amd64/helm
	chmod a+rx $(HELM)

KIND := $(abspath $(TOOLS_BIN_DIR)/kind)
kind: $(KIND) ## Build a local copy of kind
$(KIND):
	# renovate: datasource=github-tags depName=kubernetes-sigs/kind versioning=semver
	go install sigs.k8s.io/kind@v0.20.0

KUBECTL := $(abspath $(TOOLS_BIN_DIR)/kubectl)
kubectl: $(KUBECTL) ## Build a local copy of kubectl
$(KUBECTL):
	curl -fsSL "https://dl.k8s.io/release/v1.28.4/bin/$$(go env GOOS)/$$(go env GOARCH)/kubectl" -o $(KUBECTL)
	chmod a+rx $(KUBECTL)
