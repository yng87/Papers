module Resource
using HTTP, JSON3, Sockets
using ..Model, ..Service

const ROUTER = HTTP.Router()

health(req) = Dict("status"=>"ok")
HTTP.@register(ROUTER, "GET", "/", health)

createPaper(req) = Service.createPaper(JSON3.read(req.body))::Paper
HTTP.@register(ROUTER, "POST", "/paper", createPaper)

getPaper(req) = Service.getPaper(parse(Int, HTTP.URIs.splitpath(req.target)[2]))::Paper
HTTP.@register(ROUTER, "GET", "/paper/*", getPaper)

updatePaper(req) = Service.updatePaper(parse(Int, HTTP.URIs.splitpath(req.target)[2]), JSON3.read(req.body, Paper))::Paper
HTTP.@register(ROUTER, "PUT", "/paper/*", updatePaper)

deletePaper(req) = Service.deletePaper(parse(Int, HTTP.URIs.splitpath(req.target)[2]))
HTTP.@register(ROUTER, "DELETE", "/paper/*", deletePaper)

pickPaperToRead(req) = Service.pickPaperToRead()::Paper
HTTP.@register(ROUTER, "GET", "/paper", pickPaperToRead)

function requestHandler(req)
    @show req
    obj = HTTP.handle(ROUTER, req)
    @show obj
    resp = HTTP.Response(200, JSON3.write(obj))
    @show resp
    return resp
end

function run()
    # HTTP.serve(requestHandler, ip"127.0.0.1", 8080) # may fail
    HTTP.serve(requestHandler, ip"0.0.0.0", 8080)
end
    
end