resource "aws_instance" "windows_2016_dc" {
  ami                    = var.windows_2016_dc_ami
  instance_type          = "t2.large"
  key_name               = var.key_name
  subnet_id              = "${aws_subnet.default.0.id}"
  vpc_security_group_ids = ["${aws_security_group.default.id}"]
  tags = {
    Name = "attack-range_windows_2016_dc"
  }
  user_data = <<EOF
<powershell>
$admin = [adsi]("WinNT://./${var.win_username}, user")
$admin.PSBase.Invoke("SetPassword", "${var.win_password}")
Invoke-Expression ((New-Object System.Net.Webclient).DownloadString('https://raw.githubusercontent.com/ansible/ansible/devel/examples/scripts/ConfigureRemotingForAnsible.ps1'))
</powershell>
EOF

provisioner "local-exec" {
    working_dir = "../../../ansible"
    command     = "sleep 60;cp hosts.default hosts; sed -i '' 's/PUBLICIP/${aws_instance.windows_2016_dc.public_ip}/g' hosts;ansible-playbook -i hosts playbooks/windows_dc.yml"
  }
}

/**
 *  Copyright 2019 Palo Alto Networks.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
 