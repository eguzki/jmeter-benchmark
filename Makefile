MKFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
PROJECT_PATH := $(patsubst %/,%,$(dir $(MKFILE_PATH)))
JMETER_PLAN_PATH := /opt/apache-jmeter-3.1

USER ?= root
INJECTOR_HOST ?= ""
TEST_PLAN ?= test-plan.jmx
TARGET_PORT ?= 80
TARGET_HOST ?= ""
TARGET_HOST_HEADER ?= ""
TARGET_PATH ?= "/"
PROTOCOL ?= "http"
DURATION ?= 600
THREADS ?= 100
RPS ?= 50

run_benchmark: deploy_conf run_remote_jmeter retrieve_report

deploy_conf:
	scp -r ${PROJECT_PATH}/jmeter/${TEST_PLAN} ${USER}@${INJECTOR_HOST}:test-plan.jmx

run_remote_jmeter:
	ssh -tt "${USER}"@"${INJECTOR_HOST}" -- "sudo \
            docker run -ti\
						-v /tmp:/tmp\
						-v /home/${USER}/test-plan.jmx:${JMETER_PLAN_PATH}/test-plan.jmx\
						--net=host --privileged=true\
            -e PROTOCOL=\"${PROTOCOL}\" \
            -e DURATION=\"${DURATION}\" \
            -e TARGET=\"${TARGET_HOST}\" \
            -e TARGET_PORT=\"${TARGET_PORT}\" \
            -e TARGET_PATH=\"${TARGET_PATH}\" \
            -e TARGET_HOST_HEADER=\"${TARGET_HOST_HEADER}\" \
            -e THREADS=\"${THREADS}\" \
            -e RPS=\"${RPS}\" \
            quay.io/3scale/jmeter"

retrieve_report:
	ssh -tt "${USER}"@"${INJECTOR_HOST}" -- "cd /tmp && tar -czf report.tar.gz /tmp/report"
	scp -r "${USER}"@"${INJECTOR_HOST}":/tmp/report.tar.gz ./
