resource "aws_instance" "sql" {
    ami = "${data.aws_ami.windows.id}"
    subnet_id="${element(var.private_subnets, 0)}"
    instance_type = "m4.large"
    user_data = "<powershell>${var.userdata}${data.template_file.sql_instance_userdata.rendered}</powershell><persist>true</persist>"
    iam_instance_profile="${module.iam_instance_profile_ms_sql_pull.profile_id}"
    vpc_security_group_ids = ["${aws_security_group.ms_sql.id}","${var.ads_sg}"]
    key_name = "${var.key_name}"
    tags {
        Name              = "${var.customer}-${var.envname}_ms-sql-server"
      }

}


resource "aws_ebs_volume" "sql_disks" {
count = "${length(var.disk_sizes)}"
    availability_zone = "${aws_instance.sql.availability_zone}"
    size = "${element(var.disk_sizes, count.index)}"
    type = "gp2"
    tags {
        Name = "${element(var.disk_names, count.index)}"
    }
}

resource "aws_volume_attachment" "ebs_att" {
count = "${length(var.disk_sizes)}"
  device_name = "${element(var.disk_mappings, count.index)}"
  volume_id = "${element(aws_ebs_volume.sql_disks.*.id, count.index)}"
  instance_id = "${aws_instance.sql.id}"
}
