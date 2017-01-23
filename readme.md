Declare a module in your Terraform file, for example:

module "ms-sql" {
    source = "https://git.bashton.net/Bashton-Terraform-Modules/ts-aws-ms-sql.git"


    	customer                = string of customer name
	envname                 = string of environment name
	envtype                 = string of type

	azs	                = list of AZs (default set)

	key_name                = string of key name for instance resource
	userdata                = string of domain join userdata

	vpc_id                  = string of vpc id
	ads_sg                  = string active directory security group
	rdgw_internal_sg_id     = string of remote gateway security group
	private_subnets         = list of private subnet ids
	private_subnets_cidrs   = list of private subnet cidr blocks

## disks to be added - size
	disk_sizes              = ["10","20","30","40"]
## disks to be added - drive labels
	disk_names              = ["SystemDB","tempDB","userDB","userLOGS"]
## disks to be added - drive letters
	disk_letter             = ["v","u","t","s"]
    }
