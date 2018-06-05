resource "aws_vpc_peering_connection" "to_peer" {
  peer_vpc_id = "${var.peer_vpc_id}"
  vpc_id = "${module.vpc.vpc_id}"
  auto_accept = true

  tags {
    Name = "VPC Peering between PTFE and L Cloud"
  }
}

resource "aws_route" "to_peer" {
  route_table_id = "${module.vpc.public_route_table_ids[0]}"
  destination_cidr_block = "${var.peer_cidr_block}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.to_peer.id}"
}

resource "aws_route" "to_peer_private" {
  count = "${length(module.vpc.private_route_table_ids)}"
  route_table_id = "${module.vpc.private_route_table_ids[count.index]}"
  destination_cidr_block = "${var.peer_cidr_block}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.to_peer.id}"
}
