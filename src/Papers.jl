module Papers

export Model, Mapper, Client, Resource, Service

include("Model.jl")
using .Model

include("Mapper.jl")
using .Mapper

include("Service.jl")
using .Service

include("./Client.jl")
using .Client

include("Resource.jl")
using .Resource

end