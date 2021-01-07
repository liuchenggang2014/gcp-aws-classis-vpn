# GCP-AWS-HA-VPN
Setup a VPN from GCP to existing VPC on AWS

### reference from [Automated Network Deployment: Multicloud VPN - GCP-AWS VPN](https://github.com/GoogleCloudPlatform/autonetdeploy-multicloudvpn)

- [Automated Network Deployment: Multicloud VPN - GCP-AWS VPN](https://github.com/GoogleCloudPlatform/autonetdeploy-multicloudvpn) is a total fresh new deployment from zero, which means there are no VPC in AWS and GCP envirnment and it create from scratch. but in most cases from GCP side, it's very common to setup an vpn from GCP to an existing VPC in AWS.

### architecture of gcp-aws-ha-vpn
1. leverage the existing vpc
2. create ha vpn with 1 interface, 1 addresss and 2 tunnels with aws vgw with 2 tunnels.
3. create vgw/vpn connnection based on existing vpc
4. create the vgw and vpc route propogation.
