FROM julia:1.5.3

RUN mkdir /app
COPY ./ /app/

WORKDIR /app

RUN julia --project=. -e 'using Pkg; Pkg.instantiate(); Pkg.precompile()'

CMD ["julia", "--project=.", "run.jl"]