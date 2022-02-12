provider "oci" {}

resource "oci_core_instance" "generated_oci_core_instance" {
	agent_config {
		is_management_disabled = "false"
		is_monitoring_disabled = "false"
		plugins_config {
			desired_state = "DISABLED"
			name = "Vulnerability Scanning"
		}
		plugins_config {
			desired_state = "ENABLED"
			name = "OS Management Service Agent"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Management Agent"
		}
		plugins_config {
			desired_state = "ENABLED"
			name = "Custom Logs Monitoring"
		}
		plugins_config {
			desired_state = "ENABLED"
			name = "Compute Instance Run Command"
		}
		plugins_config {
			desired_state = "ENABLED"
			name = "Compute Instance Monitoring"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Block Volume Management"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Bastion"
		}
	}
	availability_config {
		recovery_action = "RESTORE_INSTANCE"
	}
	availability_domain = "SJSV:UK-LONDON-1-AD-1"
	compartment_id = "ocid1.tenancy.oc1..aaaaaaaaabeclzoshd6jv4duinduq666wyb2ajrsxjtinz6klf2nxxmfm53a"
	create_vnic_details {
		assign_private_dns_record = "true"
		assign_public_ip = "true"
		subnet_id = "${oci_core_subnet.generated_oci_core_subnet.id}"
	}
	display_name = "demo-compute-instance"
	instance_options {
		are_legacy_imds_endpoints_disabled = "false"
	}
	metadata = {
		"ssh_authorized_keys" = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDRsWeRZxcy002dtkryqI5aRMs+EwMRWZa4QcFhWaf+807cwA4LXDip1HHoLWVELyj/UC+/P7j5yrG9UFgcMK3tebz8ecE2e+H/kuwjfsZ/69iJBcwh/4KtvCJbfeoSrWOWdkZiUy0dedBgWqueU8VORkNNTi6KOHHvDmhj1jHVyWhOJkg5GNVWqEP/rfq3e+d1Md7oRyxsP3t/mOMe2YKlB4b1P0Ofeq9a+sWNz0eFz1Tt53CA6vXc4qS6gVBM1tkpNU1/Q3hitb6jYsMdbZ/ruozo2PttyKNaJkGgCd8Mg1zKSNBJe8OnZKm+48qnTXFnxJXSanNQqL8PdOKUgLrx"
	}
	platform_config {
		type = "INTEL_VM"
	}
	shape = "VM.Standard2.1"
	source_details {
		source_id = "ocid1.image.oc1.uk-london-1.aaaaaaaaxdpy4ydhk6scrcq3fsueyp3zxfgtn6rcyw22ziddhyiwb3l43oja"
		source_type = "image"
	}
}

resource "oci_core_vcn" "generated_oci_core_vcn" {
	cidr_block = "10.0.0.0/16"
	compartment_id = "ocid1.tenancy.oc1..aaaaaaaaabeclzoshd6jv4duinduq666wyb2ajrsxjtinz6klf2nxxmfm53a"
	display_name = "vcn-20220207-2058"
	dns_label = "vcn02072109"
}

resource "oci_core_subnet" "generated_oci_core_subnet" {
	cidr_block = "10.0.0.0/24"
	compartment_id = "ocid1.tenancy.oc1..aaaaaaaaabeclzoshd6jv4duinduq666wyb2ajrsxjtinz6klf2nxxmfm53a"
	display_name = "subnet-20220207-2058"
	dns_label = "subnet02072109"
	route_table_id = "${oci_core_vcn.generated_oci_core_vcn.default_route_table_id}"
	vcn_id = "${oci_core_vcn.generated_oci_core_vcn.id}"
}

resource "oci_core_internet_gateway" "generated_oci_core_internet_gateway" {
	compartment_id = "ocid1.tenancy.oc1..aaaaaaaaabeclzoshd6jv4duinduq666wyb2ajrsxjtinz6klf2nxxmfm53a"
	display_name = "Internet Gateway vcn-20220207-2058"
	enabled = "true"
	vcn_id = "${oci_core_vcn.generated_oci_core_vcn.id}"
}

resource "oci_core_default_route_table" "generated_oci_core_default_route_table" {
	route_rules {
		destination = "0.0.0.0/0"
		destination_type = "CIDR_BLOCK"
		network_entity_id = "${oci_core_internet_gateway.generated_oci_core_internet_gateway.id}"
	}
	manage_default_resource_id = "${oci_core_vcn.generated_oci_core_vcn.default_route_table_id}"
}
