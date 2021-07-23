resource "aws_autoscaling_group" "example" {
  availability_zones = data.aws_availability_zones.all.names
  desired_capacity   = 3
  max_size           = 99
  min_size           = 3
  mixed_instances_policy {
    launch_template {
      launch_template_specification {
        launch_template_id = aws_launch_template.example.id
      }
      override {
        instance_type     = "c4.large"
        weighted_capacity = "1"
      }
      override {
        instance_type     = "c3.large"
        weighted_capacity = "2"
      }
      override {
        instance_type     = "m5.large"
        weighted_capacity = "3"
      }
    }
  }
}
