test:
	racket tests/$(e).test.rkt

new:
	ansible-playbook templates/templating.yml -i localhost, --connection=local -e exc=$(e) -v

run_tests:
	for file in ./tests/*.test.rkt; do racket "$$file"; done;

sicp_install:
	raco pkg install sicp
