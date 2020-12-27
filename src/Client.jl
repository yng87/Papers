module Client
using HTTP, JSON3
using ..Model

const SERVER = Ref{String}("http://0.0.0.0:8080")


function createPaper(title, abst, authors, publishdate)
    body = (;title, abst, authors, publishdate)
    resp = HTTP.post(string(SERVER[], "/paper"), Dict("Content-Type" => "application/json"), JSON3.write(body))
    return JSON3.read(resp.body, Paper)
end

function getPaper(id)
    resp = HTTP.get(string(SERVER[], "/paper/$id"), [])
    return JSON3.read(resp.body, Paper)
end

function updatePaper(paper)
    resp = HTTP.put(string(SERVER[], "/paper/$(paper.id)"), Dict("Content-Type" => "application/json"), JSON3.write(paper))
    return JSON3.read(resp.body, Paper)
end

function deletePaper(id)
    resp = HTTP.delete(string(SERVER[], "/paper/$id"))
    return
end

function pickPaperToRead()
    resp = HTTP.get(string(SERVER[], "/"), [])
    return JSON3.read(resp.body, Paper)
end

end # module