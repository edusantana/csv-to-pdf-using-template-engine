require 'csv'
require 'erubis'

registros = {}

CSV.parse(STDIN.read, {:headers => true}) do |row|
  # use row here...
	# print row[1]
	# print row[3]
  if !registros[row[1]] then
		registros[row[1]] = {}
	end
  if !registros[row[1]][row[3]] then
		registros[row[1]][row[3]] = []
	end

  registros[row[1]] [row[3]] << row[5]
end

print "title: Lista de Presença - Licenciatura em Computação a Distância - 2013.2\n"
print "listas:\n"

registros.each do |polo, disciplinas|
	disciplinas.each do |disciplina, alunos|
		print "  - polo: #{polo}\n"
		print "    disciplina: #{disciplina}\n"
		print "    alunos:\n"
		alunos.each do |aluno|
			print "      - #{aluno}\n"
		end
	end
end

print "\n"
