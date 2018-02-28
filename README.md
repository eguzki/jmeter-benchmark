# RUN
```bash
$ TEST_PLAN=test-plan.jmx USER=centos THREADS="300" INJECTOR_HOST="injector.benchmark.3sca.net" DURATION=300 TARGET_HOST="ec2-34-242-78-29.eu-west-1.compute.amazonaws.com" TARGET_HOST_HEADER="echo-api.benchmark.3sca.net" PROTOCOL="http" TARGET_PORT="8081" RPS=500 TARGET_PATH="/some-request?user_key=864e8b7517b33fa2" make run_benchmark
scp -r /home/eguzki/data/work/redhat/git/jmeter-benchmark/jmeter/test-plan.jmx centos@injector.benchmark.3sca.net:test-plan.jmx
test-plan.jmx                                                                                                                                                             100% 7065   139.7KB/s   00:00
ssh -tt "centos"@"injector.benchmark.3sca.net" -- "sudo \
            docker run -ti\
          -v /tmp:/tmp\
          -v /home/centos/test-plan.jmx:/opt/apache-jmeter-3.1/test-plan.jmx\
          --net=host --privileged=true\
            -e PROTOCOL=\"http\" \
            -e DURATION=\"300\" \
            -e TARGET=\"ec2-34-242-78-29.eu-west-1.compute.amazonaws.com\" \
            -e TARGET_PORT=\"8081\" \
            -e TARGET_PATH=\"/some-request?user_key=864e8b7517b33fa2\" \
            -e TARGET_HOST_HEADER=\"echo-api.benchmark.3sca.net\" \
            -e THREADS=\"300\" \
            -e RPS=\"500\" \
            quay.io/3scale/jmeter"
Cleaning tmp
Running Jmeter with:
Target: ec2-34-242-78-29.eu-west-1.compute.amazonaws.com
Target Host Header: echo-api.benchmark.3sca.net
Target port: 8081
Protocol: http
Path: /some-request?user_key=864e8b7517b33fa2
rps: 500
Threads: 300
Duration: 300
Writing log file to: /tmp/jmeter.log
Created the tree successfully using test-plan.jmx
Starting the test @ Wed Feb 28 14:37:01 UTC 2018 (1519828621238)
Waiting for possible Shutdown/StopTestNow/Heapdump message on port 4445
Generate Summary Results +      1 in 00:00:00 =    3.8/s Avg:    21 Min:    21 Max:    21 Err:     0 (0.00%) Active: 171 Started: 171 Finished: 0
Generate Summary Results +   3000 in 00:00:05 =  552.2/s Avg:     9 Min:     0 Max:   272 Err:     0 (0.00%) Active: 300 Started: 300 Finished: 0
Generate Summary Results =   3001 in 00:00:06 =  526.6/s Avg:     9 Min:     0 Max:   272 Err:     0 (0.00%)
Generate Summary Results +   3000 in 00:00:06 =  500.1/s Avg:     1 Min:     0 Max:    11 Err:     0 (0.00%) Active: 300 Started: 300 Finished: 0
Generate Summary Results =   6001 in 00:00:12 =  512.9/s Avg:     5 Min:     0 Max:   272 Err:     0 (0.00%)
Generate Summary Results +   3000 in 00:00:06 =  500.1/s Avg:     1 Min:     0 Max:    13 Err:     0 (0.00%) Active: 300 Started: 300 Finished: 0
Generate Summary Results =   9001 in 00:00:18 =  508.6/s Avg:     3 Min:     0 Max:   272 Err:     0 (0.00%)
```
