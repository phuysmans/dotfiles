#!/bin/bash
set -e

USERNAME=phuysmans


install_packages() {


	echo "todo"




}


install_tools() {







	###########
	# AUR stuff

	# nagstamon omd monitor
	yaourt -S nagstamon

}




install_docker() {

#	sudo groupadd docker
#	sudo gpasswd -a "$USERNAME" docker


	curl -sSL https://get.docker.com/builds/Linux/x86_64/docker-latest.tgz \
		| tar -xvz \
		-C /usr/local/bin --strip-components 1
	chmod +x /usr/local/bin/docker*

	curl -sSL https://raw.githubusercontent.com/$USERNAME/dotfiles/master/etc/systemd/system/docker.service > /etc/systemd/system/docker.service
	curl -sSL https://raw.githubusercontent.com/$USERNAME/dotfiles/master/etc/systemd/system/docker.socket > /etc/systemd/system/docker.socket

	systemctl daemon-reload
	systemctl enable docker

}




main() {
	local cmd=$1

	if [[ $cmd == "docker" ]]; then
		install_docker
	fi


}

main "$@"
