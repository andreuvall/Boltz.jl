module BoltzLuxCUDAExt

using Boltz, LuxCUDA

# NOTE(@avik-pal): Most CuArray dispatches rely on a contiguous memory layout. Copying
#                  might be slow but allows us to use the faster and more reliable
#                  dispatches.
@inline function Boltz._fast_chunk(x::CuArray, h::Int, n::Int, ::Val{dim}) where {dim}
    return copy(selectdim(x, dim, Boltz._fast_chunk(h, n)))
end

end
