# GKE OCI Helm Deployment Module

This Terraform module facilitates the secure, automated deployment of Helm charts hosted as OCI images inside Google Artifact Registry to a Google Kubernetes Engine (GKE) cluster. It operates natively with Application Default Credentials (ADC), bypassing the need for third-party command-line utilities or local shell provisioners.

## Input Variables Reference

The table below describes all input variables required or supported by this module.

| Variable Name | Type | Description | Default | Required |
| :--- | :---: | :--- | :---: | :---: |
| `gcp_project_id` | `string` | The target Google Cloud Platform (GCP) Project ID. | *None* | **Yes** |
| `cluster_id` | `string` | The fully qualified or shorthand resource ID of the target GKE cluster. | *None* | **Yes** |
| `set_inputs` | `string` | Comma-separated list of key-value overrides passed to the Helm execution engine (Format: `key1:val1,key2:val2`). | *None* | **Yes** |
| `helm_release_name` | `string` | The unique release name for the Helm deployment inside the cluster namespace. | `"velero-demo"` | No |
| `artifact_registry_repo_name` | `string` | The name of the Google Artifact Registry repository hosting the OCI Helm charts. | `"oci-images"` | No |
| `region` | `string` | The regional location of the Google Artifact Registry repository. | `"us-central1"` | No |
| `zone` | `string` | The specific GCP availability zone where the GKE cluster resides. | `"us-central1-a"` | No |
| `helm_namespace` | `string` | The target Kubernetes namespace inside GKE where resources will be installed. | `"velero"` | No |
| `chart` | `string` | The exact name of the OCI chart artifact inside the registry. | `"velero"` | No |

---

## Detailed Variable Breakdown

### `gcp_project_id` (Required)
The unique project identifier within Google Cloud. This project must host both the target GKE cluster and the Google Artifact Registry repository containing your containerized charts.

### `cluster_id` (Required)
The source cluster address used by the provider to extract connection configurations, API endpoints, and cluster certificates.
* **Example Format:** `projects/easysaas-adc-demo/locations/us-central1-a/clusters/gke-byoc-c1`

### `set_inputs` (Required)
A single string parsing interface used to inject configurations into your Helm chart template dynamically. Ensure there are no stray spaces around the separating colons (`:`).
* **Example Syntax:** `"serviceAccount.create:false,serviceAccount.name:default,configuration.provider:gcp"`

---

## Prerequisites: Creating and Pushing the OCI Chart Image

Before running the Terraform code, your Helm chart must be packaged and hosted in Google Artifact Registry as an OCI image. Follow these steps to prepare your environment and registry:

### 1. Create an Artifact Registry Repository
Create a Docker/OCI-compatible repository inside your Google Cloud project via the gcloud CLI or GCP Console:
```bash
gcloud artifacts repositories create <ARTIFACT_REGISTRY_REPO_NAME> \
    --repository-format=docker \
    --location=<REGION> \
    --description="OCI Helm Charts Repository"