module Model

import Base: ==

using StructTypes, Dates

export Paper

mutable struct Paper
    id::Int64 # service-managed
    title::String
    abst::String
    # arxivnumber::String
    # category::String
    authors::Vector{String}
    publishdate::Date
    timespicked::Int64 # service-managed
end

==(x::Paper, y::Paper) = x.id == y.id
Paper() = Paper(0, "", "", String[], Date("1900-01-01", "y-m-d"), 0)
Paper(title, abst, authors, publishdate) = Paper(0, title, abst, authors, Date(publishdate, "y-m-d"), 0)
StructTypes.StructType(::Type{Paper}) = StructTypes.Mutable()

end