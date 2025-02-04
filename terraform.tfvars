cluster_name            = "tooling-app-eks"
iac_environment_tag     = "development"
name_prefix             = "ktrontech-eks"
main_network_block      = "10.0.0.0/16"
subnet_prefix_extension = 4
zone_offset             = 8

# Ensure that these users already exist in AWS IAM. Another approach is that you can introduce an iam.tf file to manage users separately, get the data source and interpolate their ARN.
admin_users = ["Terah"]
# developer_users                = ["leke", "david"]
developer_users                = ["Terah"]
asg_instance_types             = [{ instance_type = "t3.medium" }, { instance_type = "t2.medium" }, ]
autoscaling_minimum_size_by_az = 1
autoscaling_maximum_size_by_az = 10

aws_region  = "us-west-1"
domain_name = "liberttinnii.xyz"
subdomain   = "tooling.artifactory.liberttinnii.xyz"
