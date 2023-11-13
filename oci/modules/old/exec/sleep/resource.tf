/*
resource "null_resource" "vcns-sleep" {
  provisioner "local-exec"          {
    interpreter                     = ["bash", "-c"]
    command                         = "for i in {1..5}; do sleep 60; echo Waiting for compartments to complete [$(( 5 * $i ))]; done"
  }
}
*/