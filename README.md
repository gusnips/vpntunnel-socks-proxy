# A socks5 proxy via VPNTunnel

A socks5 proxy via [VPNTunnel](http://vpntunnel.com)

An [Alpine](https://alpinelinux.org/) Linux container running a socks5 proxy (using [dante](https://www.inet.no/dante/)) via VPNTunnel (OpenVPN)  

Protect your browsing activities through an encrypted and anonymized VPN proxy!  

You will need a [VPNTunnel Account](https://vpntunnel.com) account  
If you don't have one, you can [sign up here](https://vpntunnel.com/refer/tqd6nhtj7vzinv2a10zeixtwi2meo3wd) for one  

## Basic usage

```bash
git clone git@github.com:gusnips/vpntunnel-socks-proxy.git
cd vpntunnel-socks-proxy
cp docker-compose-example.yml docker-compose.yml
nano docker-compose.yml # use the editor of your choice
```

Set your credentials in docker-compose.yml

```YAML
environment:
- REGION=sweden
- USERNAME=my-vpntunnel-username
- PASSWORD=my-vpntunnel-password
```

Start the container

```bash
docker-compose up -d
```

## Region

Region can be any of the downloaded ones from [VPNTunnel](https://vpntunnel.com/en/account/server-info)

There is a list in app/ovpn/vpntunnel

By default it's `sweden`, but you can set to somewhere like `United States - California`

## Dependencies

[Docker Compose](https://docs.docker.com/compose/)

```bash
apt install docker docker-compose
```
if not using debian/ubuntu, check [their install page for references](https://docs.docker.com/compose/install/)

## Using in firefox

Open your [firefox preferences page](about:preferences), search for Network Proxy and click and settings

Set `Manual proxy configuration` SOCKS Host to `127.0.0.1` and port to `1080`, or the one you chose

![Firefox Screenshot](/images/firefox-screenshot.png)

### Testing/using from command line

- curl:

```shell
# socks5h so the dns is done over the socks proxy
$ curl -v --proxy socks5h://localhost:1080
```

- git:

```shell
env ALL_PROXY=socks5h://localhost:1080 git clone https://github.com/some/one.git
```

## Credits

- [OneOfOne/pia-socks-proxy](https://github.com/OneOfOne/pia-socks-proxy), used the openvpn config from his repository, but he uses pia rather than vpntunnel
