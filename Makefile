test:
	racket tests/$(t).test.rkt

sicp_install:
	raco pkg install sicp
