.PHONY: upload
upload:
		rsync -avze 'ssh' public/ root@burke.libbey.me:/var/www/winnipegrb.org

