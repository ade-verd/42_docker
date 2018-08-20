.PHONY: all pullimg build_df

all: pullimg build_df

pullimg:
	./scripts/docker_pullimg.sh > ./scripts/docker_pullimg.log

build_df:
	./scripts/docker_build_dfiles.sh
