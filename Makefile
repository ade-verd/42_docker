.PHONY: all pullimg build_df clean_cont clean_img fclean

all: pullimg build_df

pullimg:
	./scripts/docker_pullimg.sh > ./scripts/docker_pullimg.log

build_df:
	./scripts/docker_build_dfiles.sh > ./scripts/docker_build_dfiles.log

clean_cont:
	./scripts/docker_clean_containers.sh

clean_img:
	./scripts/docker_clean_images.sh

fclean: clean_cont clean_img
