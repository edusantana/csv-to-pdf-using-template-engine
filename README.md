# ufpb-virtual-lista-de-presenca

This project is used to create PDF from CSV data using a template engine.

This is divided in 3 modules:

* `fo-to-pdf`: This use a `.fo` file and produces a `pdf` using FOP (http://xmlgraphics.apache.org/fop/).
* `ymal-to-fo`: This uses a `yaml` file as a context and a `eruby` template (http://www.kuwata-lab.com/erubis/) to produce a `fo` file.
* `csv-to-yaml`: This reads a `csv` file and produces a `yaml` as context to be used with a eruby template.

## Testing it

* Install fop
* Install erubis (requires ruby)

Download the project and run:

	ruby csv-to-yaml/extract_alunos.rb < csv-to-yaml/database-exported.csv > context.yaml ; erubis -f context.yaml yaml-to-fo/template-lista-de-presenca.eruby | fop - document.pdf

Two files will be created:

* document.pdf: the final document 
* context.yaml: context using data extracted from `database-exported.csv`


## fo-to-pdf

The first thing to do is to define want we want to create, you can use a `fo` 
documento to do it, and `fop` to produce a `PDF` file.

We have `document.fo` as an example:

	$ fop document.fo document.pdf

After you create your `fo` document you will need to design your own template.

## ymal-to-fo

We use `erubis` as the template engine to produce the `fo` document.
Since `erubis` can use a `yaml` file as a context (data source), this aproach 
was choosed because it can be easily editted or created.

You can use this command produce a `.fo` document, using `template-lista-de-presenca.eruby` 
as the template and `context.yaml` and the context (or data source):

	$ erubis -f context.yaml template-lista-de-presenca.eruby > document.fo

or create a `pdf` file directly:

	$ erubis -f context.yaml template-lista-de-presenca.eruby | fop - document.pdf

Most propabily you will write your own template and context file to test it.

## csv-to-yaml

After you have designed your template and generated the document with a test
context file, you will have to create a context file using a database exported
file (such as csv file).

In this project I have writen a simple application in ruby 
that reads from a `csv` file and generates a yaml file:

	$ ruby extract_alunos.rb < database-exported.csv > context.yaml

You will propabily have to write your own code to extract and create your context file.

## Resources and requirements

* FOP: http://xmlgraphics.apache.org/fop/
* Template engine: http://www.kuwata-lab.com/erubis/
* yaml: http://yaml.org/

