all: slides.pdf

slides.pdf: slides.rst slides.style
	rst2pdf slides.rst -b1 -s slides.style

.PHONY: clean

clean:
	rm -f slides.pdf
