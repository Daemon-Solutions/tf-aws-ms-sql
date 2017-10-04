/* Environment variables */
variable "customer" {
  description = "First name prefix for the 'Name' tag on resources created by this module"
  type = "string"
}

variable "envname" {
  description = "Second name prefix for the 'Name' tag on resources created by this module"
  type = "string"
}

variable "azs" {
  description = "List of availability zones to create resources in"
  type = "list"
  default = ["eu-west-1a","eu-west-1b","eu-west-1c"]
}

/* VPC variables */
variable "public_subnets" {
  description = "A list of public subnets inside the VPC."
  type = "list"
  default     = []
}

variable "private_subnets" {
  description = "A list of private subnets inside the VPC."
  type = "list"
  default     = []
}

variable "private_subnets_cidrs" {
  description = "A list of CIDR blocks for the private subnets defined in 'private_subnets'"
  type = "list"
  default = []
}


/* Launch Configuration variables & AMI lookup */
variable "userdata" {
  description = "The userdata to launch instances with"
  type = "string"
  default = ""
}

variable "microsoft_sql_ami_names" {
  description = "Map containing a lookup for MSSQL AMI names"
  type = "map"
  default = {
    "W2K8R2_SQL2K8R2EXP"="Windows_Server-2008-R2_SP1-English-64Bit-SQL_2008_R2_SP3_Express*",
    "W2K8R2_SQL2K8R2STA"="Windows_Server-2008-R2_SP1-English-64Bit-SQL_2008_R2_SP3_Standard*",
    "W2K8R2_SQL2K8R2WEB"="Windows_Server-2008-R2_SP1-English-64Bit-SQL_2008_R2_SP3_Web*",
    "W2K8R2_SQL2K12R2EXP"="Windows_Server-2008-R2_SP1-English-64Bit-SQL_2012_SP2_Express*",
    "W2K8R2_SQL2K12R2STA"="Windows_Server-2008-R2_SP1-English-64Bit-SQL_2012_SP2_Standard*",
    "W2K8R2_SQL2K12R2WEB"="Windows_Server-2008-R2_SP1-English-64Bit-SQL_2012_SP2_Web*",
    "W2K8SP2_SQL2K8EXP"="Windows_Server-2008-SP2-English-64Bit-SQL_2008_SP4_Express*",
    "W2K8SP2_SQL2K8STA"="Windows_Server-2008-SP2-English-64Bit-SQL_2008_SP4_Standard*",
    "W2K12R2_SQL2K14EXP"="Windows_Server-2012-R2_RTM-English-64Bit-SQL_2014_SP1_Express*",
    "W2K12R2_SQL2K14STA"="Windows_Server-2012-R2_RTM-English-64Bit-SQL_2014_SP1_Standard*",
    "W2K12R2_SQL2K14WEB"="Windows_Server-2012-R2_RTM-English-64Bit-SQL_2014_SP1_Web*",
    "W2K12R2_SQL2K16EXP"="Windows_Server-2012-R2_RTM-English-64Bit-SQL_2016_Express*",
    "W2K12R2_SQL2K16STA"="Windows_Server-2012-R2_RTM-English-64Bit-SQL_2016_Standard*",
    "W2K12R2_SQL2K16WEB"="Windows_Server-2012-R2_RTM-English-64Bit-SQL_2016_Web*",
    "W2K12_SQL2K8EXP"="Windows_Server-2012-RTM-English-64Bit-SQL_2008_R2_SP3_Express*",
    "W2K12_SQL2K8STA"="Windows_Server-2012-RTM-English-64Bit-SQL_2008_R2_SP3_Standard*",
    "W2K12_SQL2K8WEB"="Windows_Server-2012-RTM-English-64Bit-SQL_2008_R2_SP3_Web*",
    "W2K12_SQL2K12EXP"="Windows_Server-2012-RTM-English-64Bit-SQL_2012_SP2_Express*",
    "W2K12_SQL2K12STA"="Windows_Server-2012-RTM-English-64Bit-SQL_2012_SP2_Standard*",
    "W2K12_SQL2K12WEB"="Windows_Server-2012-RTM-English-64Bit-SQL_2012_SP2_Web*",
    "W2K12_SQL2K12EXP"="Windows_Server-2012-RTM-English-64Bit-SQL_2014_SP1_Express*",
    "W2K12_SQL2K12STA"="Windows_Server-2012-RTM-English-64Bit-SQL_2014_SP1_Standard*",
    "W2K12_SQL2K12WEB"="Windows_Server-2012-RTM-English-64Bit-SQL_2014_SP1_Web*",
    "W2K16_SQL2K16"="Windows_Server-2016-English-Full-SQL_2016*",
    "W2K16_SQL2K16ENT"="Windows_Server-2016-English-Full-SQL_2016_Enterprise*",
    "W2K16_SQL2K16EXP"="Windows_Server-2016-English-Full-SQL_2016_Express*",
    "W2K16_SQL2K16STA"="Windows_Server-2016-English-Full-SQL_2016_Standard*"
  }
}

variable "sql_ver" {
  description = "The version of SQL you wish to deploy"
  type = "string"
  default = "W2K16_SQL2K16STA"
}

variable "key_name" {
  description = "The key pair to associate with launched instances"
  type = "string"
}

variable "admin_users" {
  description = "Map to lookup the default administrative user dependent on AD type"
  type = "map"
  default = {
    "SimpleAD"    = "administrator",
    "MicrosoftAD" = "admin"
  }
}

variable "vpc_id" {
  description = "The VPC ID in which to create resources"
  type = "string"
}

variable "ads_sg" {
  description = "Active directory security group ID"
  type = "string"
}

variable "rdgw_external_sg_id" {
  description = "The remote gateway security group ID"
  type = "string"
}

variable "disk_sizes" {
  description = "List containing the sizes for each volume"
  type ="list"
  default = ["10","20","30","40"]
}

variable "disk_names" {
  description = "List containing the names for each volume"
  type ="list"
  default = ["SystemDB","tempDB","userDB","userLOGS"]
}

variable "disk_letter" {
  description = "List containing the drive letters for each volume"
  type ="list"
  default = ["v","u","t","s"]
}

variable "disk_mappings" {
  description = "List containing the logical device names presented to the instance for each volume"
  type = "list"
  default = ["xvdb","xvdc","xvdd","xvde"]
}
