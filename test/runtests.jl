using Test, Papers

server = @async Resource.run()

paper1 = Client.createPaper("Neutron Star", "Nice paper.", ["Keisuke Yanagi",], "2019-03-02")
@test paper1 == Client.pickPaperToRead()
@test paper1 == Client.pickPaperToRead()

@test Client.getPaper(paper1.id) == paper1

push!(paper1.authors, "Siro")
@show paper1
paper2 = Client.updatePaper(paper1)
@test length(paper2.authors) == 2
@test length(Client.getPaper(paper2.id).authors) == 2

Client.deletePaper(paper1.id)

paper2 = Client.createPaper("Supersymmetry", "LHC should discover SUSY.", ["AB", "CD", "XY"], "2020-09-12")
@test paper2 == Client.pickPaperToRead()