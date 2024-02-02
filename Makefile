cleanall:
	sudo rm -rf /home/rreis-de42/data/wordpress/*
	sudo rm -rf /home/rreis-de42/data/mysql/*
	docker system prune -a --volumes