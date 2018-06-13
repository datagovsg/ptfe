# PTFE Packer Set-Up

This `packer` set-up is used by `ptfe`.

## Prerequisites to follow set-up

1.  Install [`packer`](https://www.packer.io/downloads.html).
2.  Install [`ansible` with `ansible-playbook`](http://docs.ansible.com/ansible/latest/intro_installation.html).
3.  Create your AWS named profiles following the guide
    <https://docs.aws.amazon.com/cli/latest/userguide/cli-multiple-profiles.html>.
    The following parts will assumed that the named profile has been created.
4.  Ensure that there are <= 5 keys under the SSH-Agent identities. To check,
    run `ssh-add -l` and there should be 5 entries or fewer. If not, please
    reduce the number of keys to fulfill the requirement. Otherwise the
    `packer build` will always fail because of "SSH too many authentication
    failures" error.

## Packer Steps

Perform the `packer` build by running:

```bash
AWS_PROFILE=yourprofile packer build packer.json
```

## Image description

Current the custom AMI contains:

* `docker`
* `git`
* Private Terraform Enterprise
