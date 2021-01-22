# GCP-AWS-Classic-VPN
Setup a VPN from GCP to existing VPC on AWS

### Change and Simplify from [Automated Network Deployment: Multicloud VPN - GCP-AWS VPN](https://github.com/GoogleCloudPlatform/autonetdeploy-multicloudvpn)

- [Automated Network Deployment: Multicloud VPN - GCP-AWS VPN](https://github.com/GoogleCloudPlatform/autonetdeploy-multicloudvpn) is a total fresh new deployment from zero, which means there are no VPC in AWS and GCP envirnment and it create from scratch. but in most cases from GCP side, it's very common to setup an vpn from GCP to an existing VPC in AWS.

### architecture of gcp-aws-classic-vpn
1. leverage the existing vpc on aws
2. create ha vpn on gcp with 1 interface, 1 public addresss and 2 tunnels with aws vgw with 2 tunnels.
3. create vgw/vpn connnection based on existing vpc
4. create the vgw and vpc route propogation on aws


#### file description
- [aws_networking.tf](https://github.com/liuchenggang2014/gcp-aws-ha-vpn/blob/main/aws_networking.tf):  create vgw/cgw/vpn connection on existing vpc; add route propagation on the vpc main route table
- [aws_security.tf](https://github.com/liuchenggang2014/gcp-aws-ha-vpn/blob/main/aws_security.tf):    create ingress security group by allow the trafic from gcp vpc subnet ip range.
- [aws_variables.tf](https://github.com/liuchenggang2014/gcp-aws-ha-vpn/blob/main/aws_variables.tf):  aws region/vpc id/credential file path declear and default value
- [gcp_networking.tf](https://github.com/liuchenggang2014/gcp-aws-ha-vpn/blob/main/gcp_networking.tf): create GCP vpc/subnet/vpn gateway/cloud router/vpn tunnel1,2
- [gcp_security.tf](https://github.com/liuchenggang2014/gcp-aws-ha-vpn/blob/main/gcp_security.tf): create gcp firewall allow traffic from aws vpc cidr/
- [gcp_variables.tf](https://github.com/liuchenggang2014/gcp-aws-ha-vpn/blob/main/gcp_variables.tf): gcp projectid/region/subnet cidr/vpn tunnel asn/bgp cidr variable declare and default value
- [main.tf](https://github.com/liuchenggang2014/gcp-aws-ha-vpn/blob/main/main.tf): decleare the gcp/aws provider
- [terraform.tfvars](https://github.com/liuchenggang2014/gcp-aws-ha-vpn/blob/main/terraform.tfvars): variable for wind project


### deploy guide(we can run it on cloud shell directly)
- git clone https://github.com/liuchenggang2014/gcp-aws-ha-vpn/
- change the terrafor.tfvar according to your setup
- terraform apply

### destroy guide
- terraform destroy
