
## Nginx for HLS
The NGINX edge cluster is essentially a reverse proxy with caching, also known as NGINX Proxy with Cache.
After enabling Cache, no matter how much load NGINX has, The origin server will only have one stream. In this way, we can expand multiple NGINX to support a large number of concurrent viewers.
For example, a 1Mbps HLS stream, with 1000 clients playing on NGINX, the bandwidth of NGINX would be 1Gbps, while origin server would only have 1Mbps.

## Environment Variable
| Field              | Description                          | Require  |
| ------------------ | ---------------------------          | -------- |
| ORIGIN        | The url of original server | Yes |
| VALID_REFERERS | The valid_referers config for nginx | No |
