# Hypermonk

Toolchain to produce multi-format electronic publications for the Web,
e-readers and print.

Hypermonk takes in HTML documents and YAML metadata to output high
quality files in EPUB, Mobi (Kindle), PDF and HTML fragments (for
Wordpress).

All outputs can be customised using XSLT and LaTeX templates, as well
as CSS.


## Install

Hypermonk requires Ruby (tested with 2.0.0) to be installed. We also
recommend using a virtualised environment such as
[rvm](https://rvm.io/) to encapsulate dependencies.

You will also need the following packages:

* LaTeX (to generate PDF) -- on Ubuntu, you can install the following packages:
      - texlive-latex-recommended
      - texlive-latex-base
      - texlive-fonts-recommended
      - texlive-latex-extra
* pdflatex
* ebook-convert (to generate Mobi from EPUB)
* antiword (if using `hypermonk-import`)

Then install Hypermonk's dependencies:

```
$ gem install bundler
$ bundle install
```


## Usage

Once installed, go to your project directory (which should contain
your `config` directory) and start hypermonk:

```
$ cd my-project
$ $HYPERMONK_PATH/bin/hypermonk
```


## Examples

Hypermonk was developed to produce the francophone magazine of short
speculative fiction [Angle Mort](http://www.angle-mort.fr/), which
uses it to generate all its issues (both files you download/buy and
the Web edition).
