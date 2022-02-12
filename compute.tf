resource "oci_core_instance" "ubuntu_instance" {
    # Required
    availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
    compartment_id = oci_identity_compartment.tf-compartment.id
    shape = "VM.Standard2.1"
    source_details {
        source_id = "ocid1.image.oc1.uk-london-1.aaaaaaaalu2sd65shsmeewhijd5bo4ut64sc5l3436lgoizanotrqbzawlwq"
        source_type = "image"
    }

    # Optional
    display_name = "tf-instance"
    create_vnic_details {
        assign_public_ip = true
        subnet_id = oci_core_subnet.vcn-public-subnet.id
    }
    metadata = {
        ssh_authorized_keys = file("/home/jeremy_bre/.ssh/id_rsa.pub")
    } 
    preserve_boot_volume = false
}
