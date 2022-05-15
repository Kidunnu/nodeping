
terraform {
  required_providers {
    nodeping = {
      version = "0.0.1"
      source  = "softkraft.co/terraform/nodeping"
    }
  }
}


resource "nodeping_check" "first_check"{
    label = "FirstCheck"
	type = "HTTP"
	target = "http://cosiek.eu/"
	enabled = "inactive"
	interval = 25
	public = true
	runlocations = var.location["nam"]
	threshold = 3
	sens = 1
	description = "Testing 123"
	notifications {
		contact = nodeping_contact.first_contact.addresses[0].id
		delay = 1
		schedule = "Weekdays" 
	}
}