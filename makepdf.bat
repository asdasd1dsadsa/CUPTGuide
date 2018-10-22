@cd build\latex\
@pdflatex -interaction=nonstopmode HITwhPhysicsTournament.tex
@makeindex -s python.ist HITwhPhysicsTournament.idx
@pdflatex -interaction=nonstopmode HITwhPhysicsTournament.tex
@cd ..
@cd ..