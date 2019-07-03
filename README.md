# freeipa-packer 💀📦 #

[![Build Status](https://travis-ci.com/cisagov/freeipa-packer.svg?branch=develop)](https://travis-ci.com/cisagov/freeipa-packer)

This is a generic skeleton project for building a
[FreeIPA](https://www.freeipa.org) image based on a generic
[Fedora](https://getfedora.org/) base image.

## Building the Image ##

The AMI is built like so:

```bash
ansible-galaxy install --force --role-file src/requirements.yml
```

### Required Environment Variables ###

- `AWS_ACCESS_KEY`: the access key ID of the building IAM. e.g., `AKIAXXXXXXXXXXXXXXXX`
- `AWS_SECRET_KEY`: the secret key of the building IAM e.g., `xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx`
- `BUILD_REGION`: the region to build the build the image in.  e.g., `us-east-2`
- `DEPLOY_REGIONS`: list of additional regions to deploy this image. e.g., `us-east-1,us-west-1,us-west-2`

```bash
packer build src/packer.json
```

## Contributing ##

We welcome contributions!  Please see [here](CONTRIBUTING.md) for
details.

## License ##

This project is in the worldwide [public domain](LICENSE).

This project is in the public domain within the United States, and
copyright and related rights in the work worldwide are waived through
the [CC0 1.0 Universal public domain
dedication](https://creativecommons.org/publicdomain/zero/1.0/).

All contributions to this project will be released under the CC0
dedication. By submitting a pull request, you are agreeing to comply
with this waiver of copyright interest.
