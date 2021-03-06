# About the TFE AMI

This document contains information about the Terraform Enterprise AMI.

## Operating System

The TFE AMI is based on the latest release of Ubuntu 16.04 with all security
patches applied.

## Network Ports

The TFE AMI requires that port :8080 be accessible. This is where all traffic
from the ELB is routed. Many other internal TFE services listen on the host,
but they do not require external traffic. The AWS security group for the
instance as well as software firewall rules within the runtime enforce this.

## `ulimits`

The necessary limits on open file descriptors are raised within
`/etc/security/limits.d/nofile.conf` on the machine image.

## Critical Services

The TFE AMI contains dozens of services that are required for proper operation
of Terraform Enterprise. These services are all configured to launch on boot.
Application-level services are managed via Nomad and system-level automation is
managed via `systemd`.

More information on the various application-level services can be found in
[`tfe-architecture`](tfe-architecture.md)
