cd %~dp0
sphinx-apidoc --output-dir=. --maxdepth=1000 --follow-links --separate --private --doc-project=opn --doc-author="O�uz Altun" --doc-version=0.1.1 ..
make html
