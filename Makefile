all: arm-i-c x86-i-c


arm-i-c:
	mkdir -p arm 
	cd arm && cp ../call.sh .
	cd arm && cp ../Dockerfile.arm Dockerfile
	cd arm && docker build -t cross-qnap-i-c:arm .
	rm -rf arm

x86-i-c:
	mkdir -p x86
	cd x86 && cp ../call.sh .
	cd x86 && cp ../Dockerfile.x86 Dockerfile
	cd x86 && docker build -t cross-qnap-i-c:x86 .
	rm -rf x86
