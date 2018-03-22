# Jmeter deploying and running scripts

# 'CSV' traffic

Fill traffic **HOST** and **PATH** into file *data/csv_traffic_profile.csv* using CSV format.

## BENCHMARK PARAMS
  - USER=centos
  - THREADS=30
  - INJECTOR_HOST="injector.benchmark.3sca.net"
  - DURATION=300
  - TARGET_HOST="127.0.0.1"
  - PROTOCOL="http"
  - TARGET_PORT="80"
  - RPS=50

## RUn benchmark
```bash
$ USER=centos THREADS="30" INJECTOR_HOST="injector.benchmark.3sca.net" DURATION=300 TARGET_HOST="127.0.0.1" PROTOCOL="http" TARGET_PORT="80" RPS=50 make csv
```

# 'PATHS' traffic

Fill traffic **PATH** into file *data/paths_traffic_profile.csv* using CSV format.

## BENCHMARK PARAMS
  - USER=centos
  - THREADS=30
  - INJECTOR_HOST="injector.benchmark.3sca.net"
  - DURATION=300
  - TARGET_HOST="127.0.0.1"
  - PROTOCOL="http"
  - TARGET_PORT="80"
  - TARGET_HOST_HEADER="myhost.mydomain.com"
  - RPS=50

## RUn benchmark
```bash
$ USER=centos THREADS="30" INJECTOR_HOST="injector.benchmark.3sca.net" DURATION=300 TARGET_HOST="127.0.0.1" PROTOCOL="http" TARGET_PORT="80" TARGET_HOST_HEADER="myhost.mydomain.com" RPS=50 make paths
```

# 'Simple' traffic

## BENCHMARK PARAMS
  - USER=centos
  - THREADS=30
  - INJECTOR_HOST="injector.benchmark.3sca.net"
  - DURATION=300
  - TARGET_HOST="127.0.0.1"
  - PROTOCOL="http"
  - TARGET_PATH="/mypath"
  - TARGET_PORT="80"
  - TARGET_HOST_HEADER="myhost.mydomain.com"
  - RPS=50

## RUn benchmark
```bash
$ USER=centos THREADS="30" INJECTOR_HOST="injector.benchmark.3sca.net" DURATION=300 TARGET_HOST="127.0.0.1" PROTOCOL="http" TARGET_PORT="80" TARGET_PATH="/mypath" TARGET_HOST_HEADER="myhost.mydomain.com" RPS=50 make simple
```
