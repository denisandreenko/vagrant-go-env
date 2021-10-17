# vagrant-go-env

## VM with development environment:

- Ubuntu
- Git
- Docker
- Docker-compose
- Golang

## Run VM (virtualbox provider)
```
vagrant init darus/golang-dev
vagrant up
```

Vagrant Cloud boxes:
https://app.vagrantup.com/darus/boxes/golang-dev

## How to upload your own box:
### Getting the upload path
```
curl 'https://vagrantcloud.com/api/v1/box/darus/golang-dev/version/2.0.0/provider/virtualbox/upload?access_token={{access_token}}'
```
*You can generate your access_token here:
https://app.vagrantup.com/settings/security

### Creating a box
```
vagrant package --output mynew.box
```

### Uploading the box
```
curl -X PUT --upload-file mynew.box {{upload_path}}
```
