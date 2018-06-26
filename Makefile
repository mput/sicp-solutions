test:
	racket tests/$(e).test.rkt

new:
	ansible-playbook templates/templating.yml -i localhost, --connection=local -e exc=$(e) -v

sicp_install:
	raco pkg install sicp
