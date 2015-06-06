# Hypermonk

Toolchain to produce multi-format electronic publications for the Web,
e-readers and print.

Hypermonk takes in HTML documents and YAML metadata to output high
quality files in EPUB, Mobi (Kindle), PDF and HTML fragments (for
Wordpress).

Generating "issues" of a publication that brings together multiple
sub-files ("chapters") referenced by a table of contents is also
supported.

All outputs can be customised using XSLT and LaTeX templates, as well
as CSS.


**Note: while technically generic, hypermonk currently still contains
  some custom code specific to its use to publish the Angle Mort
  magazine. Some extra work is required to allow fully generic use,
  see TODO file.**


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

Once installed, go to your project directory and setup all required
files in the `config` directory (TODO: document!).

To import a Word Document (`.doc`) as a plain HTML source, you can use
`hypermonk-import`:

```
$ cd my-project
$ mkdir new-folder
$ $HYPERMONK_PATH/bin/hypermonk-import some-document.doc new-folder
```

You will then be prompted for some metadata about this document, and
the resulting file will be placed in the provided `new-folder`.

To compile the source into one of the export format, run `hypermonk`:

```
$ cd my-project
$ $HYPERMONK_PATH/bin/hypermonk new-folder epub  # or pdf, mobi, html
```

`hypermonk` will read information from the `metadata.yml` in the
directory provided to populate the exported file (TODO: document!).


## Examples

Hypermonk was developed to produce the francophone magazine of short
speculative fiction [Angle Mort](http://www.angle-mort.fr/), which
uses it to generate all its issues (both files you download/buy and
the Web edition).


## Licence

This software was developed by Sébastien Cevey and is published under
the GNU General Public License version 3 (see COPYING).
