resource "oci_identity_compartment" "tf-compartment" {
    # Required
    compartment_id = "ocid1.tenancy.oc1..aaaaaaaaabeclzoshd6jv4duinduq666wyb2ajrsxjtinz6klf2nxxmfm53a"
    description = "Compartment for Terraform resources."
    name = "tf_stack_test"
}
