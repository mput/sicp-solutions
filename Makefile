test:
	racket -l errortrace -t tests/$(e).test.rkt
test_with_my_logs::
	env PLTSTDERR="debug@my-log" racket tests/$(e).test.rkt

new:
	ansible-playbook templates/templating.yml -i localhost, --connection=local -e exc=$(e) -v

run_tests:
	raco test -t ./tests

sicp_install:
	raco pkg install sicp
