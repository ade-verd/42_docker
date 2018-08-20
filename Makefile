.PHONY: all pullimg build_df clean_cont clean_img

all: pullimg build_df

pullimg:
	./scripts/docker_pullimg.sh > ./scripts/docker_pullimg.log

build_df:
	./scripts/docker_build_dfiles.sh > ./scripts/docker_build_dfiles.log

clean_cont:
	docker rm $(docker ps -a -q) --force

clean_img:
	docker rmi $(docker images -q)
