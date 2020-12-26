module Papers

export Model, Mapper, Client, Resource, Service

include("./Client.jl")
using .Client

include("Mapper.jl")
using .Mapper

include("Model.jl")
using .Model

include("Resource.jl")
using .Resource

include("Service.jl")
using Service

end