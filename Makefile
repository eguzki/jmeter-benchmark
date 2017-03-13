USER ?= root
INJECTOR_HOST ?= ""
TEST_PLAN ?= "test-plan.jmx"
TARGET_PORT ?= 80
TARGET_HOST ?= ""
TARGET_PATH ?= "/"
PROTOCOL ?= "http"
DURATION ?= 600
THREADS ?= 100

run_benchmark: run_remote_jmeter retrieve_report

run_remote_jmeter:
	ssh -tt "${USER}"@"${INJECTOR_HOST}" -- "sudo \
            docker run -ti -v /tmp:/tmp --net=host \
            -e PROTOCOL=\"${PROTOCOL}\" \
            -e DURATION=\"${DURATION}\" \
            -e TARGET=\"${TARGET}\" \
            -e TARGET_PORT=\"${TARGET_PORT}\" \
            -e TARGET_PATH=\"${TARGET_PATH}\" \
            -e THREADS=\"${THREADS}\" \
            jmprusi/jmeter-server"

retrieve_report: 
	scp -r "${USER}"@"${INJECTOR_HOST}" /tmp/report ./
