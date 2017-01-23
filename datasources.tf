#retrieve the latest ami for 2008R2/2012R2/2016

data "aws_ami" "windows" {
 most_recent = true
 filter {
   name = "name"
   values = ["${lookup(var.microsoft_sql_ami_names,var.sql_ver)}"]
    }
 }


 data "template_file" "sql_instance_userdata" {

   template = "${file("${path.module}/include/sql_instance_userdata.tmpl")}"

   vars {
       drives = "${element(var.disk_letter,0)},${element(var.disk_letter,1)},${element(var.disk_letter,2)},${element(var.disk_letter,3)}"
       names = "${element(var.disk_names,0)},${element(var.disk_names,1)},${element(var.disk_names,2)},${element(var.disk_names,3)}"
   }
 }
