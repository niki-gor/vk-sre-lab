.PHONY: load-packages
load-packages:
	docker compose -f package-loader/docker-compose.yml up

.PHONY: create-image
create-image: load-packages
	mkisofs -o ./images/utils_packages.iso ./package-loader/packages 

.PHONY: connect
	docker compose up