

/*
 * Terraform networking resources for AWS.
 */

data "aws_vpc" "aws-vpc" {
  id = var.aws_vpc_id
}


/*
 * ----------VPN Connection----------
 */

resource "aws_vpn_gateway" "aws-vpn-gw" {
  vpc_id = data.aws_vpc.aws-vpc.id
}

resource "aws_customer_gateway" "aws-cgw" {
  bgp_asn    = 65000
  ip_address = google_compute_address.gcp-vpn-ip.address
  type       = "ipsec.1"
  tags = {
    "Name" = "aws-customer-gw"
  }
}

# resource "aws_default_route_table" "aws-vpc" {
#   default_route_table_id = aws_vpc.aws-vpc.default_route_table_id
#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.aws-vpc-igw.id
#   }
#   propagating_vgws = [
#     aws_vpn_gateway.aws-vpn-gw.id,
#   ]
# }

# Requests automatic route propagation between a VPN gateway and a route table.
resource "aws_vpn_gateway_route_propagation" "vgw-propogation" {
  vpn_gateway_id = aws_vpn_gateway.aws-vpn-gw.id
  route_table_id = data.aws_vpc.aws-vpc.main_route_table_id
}

resource "aws_vpn_connection" "aws-vpn-connection1" {
  vpn_gateway_id      = aws_vpn_gateway.aws-vpn-gw.id
  customer_gateway_id = aws_customer_gateway.aws-cgw.id
  type                = "ipsec.1"
  static_routes_only  = false
  tags = {
    "Name" = "aws-vpn-connection1"
  }
}

