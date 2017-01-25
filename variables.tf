variable "customer" {}

variable "envname" {}

variable "envtype" {}

variable "service" {
  default = "rdgw"
}

variable "public_subnets" {
  description = "A list of public subnets inside the VPC."
  default     = []
}

variable "private_subnets" {
  description = "A list of private subnets inside the VPC."
  default     = []
}

variable "azs" {
  type = "list"
  default = ["eu-west-1a","eu-west-1b","eu-west-1c"]
}

## Userdata Variables

variable "userdata" {
  default = ""
}



# ## Launch Configuration Variables & ami lookup

variable "microsoft_sql_ami_names" {
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
  default = "W2K16_SQL2K16STA"
}

variable "key_name" {}

variable "admin_users" {
  default = {
    "SimpleAD"    = "administrator",
    "MicrosoftAD" = "admin"
  }
}

variable "vpc_id" {}

variable "ads_sg" {}

variable "rdgw_external_sg_id" {}

variable "disk_sizes" {type ="list"}
variable "disk_names" {type ="list"}
variable "disk_letter" {type ="list"}


variable "disk_mappings" {
  default=["xvdb","xvdc","xvdd","xvde"]
}

variable "private_subnets_cidrs" {type = "list"}
