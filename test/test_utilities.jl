using Test

module mutil001
using Test
using LinearAlgebra
using Sparspak.SpkUtilities

function _test()
    extend = SpkUtilities.extend
    a = [ 9.91099e-01
    8.26992e-01
    4.78277e-02
    7.21746e-01
    2.77298e-01
    8.00130e-01
    8.07221e-01]
    b = deepcopy(a)
    a = extend(a, 3)
    @test norm(a - b[1:3]) / norm(a) < 1.0e-9
    a = extend(a, 5, -1.0)
    c = vcat(b[1:3], [-1.0, -1.0])
    @test norm(a - c) / norm(a) < 1.0e-9
    a = deepcopy(b)
    a = extend(a, 5, -1.0)
    @test norm(a - b[1:5]) / norm(a) < 1.0e-9
    return true
end

_test()
end # module


module mutil002
using Test
using LinearAlgebra
using Sparspak.SpkUtilities

function _test()
    extend = SpkUtilities.extend
    a = [0.3814043930778628 0.07295808459382358 0.9234303156836231 0.2501555942396908 0.9901631548893776
        0.5435778459423668 0.018608588657332392 0.30803793111612243 0.7851377981322851 0.7642933432653911
        0.45649294345436575 0.27984784492761505 0.4280638037095217 0.9280066808672661 0.685472177669261]
    a = extend(a, 2, 4)
    a1 = [0.3814043930778628 0.07295808459382358 0.9234303156836231 0.2501555942396908; 
        0.5435778459423668 0.018608588657332392 0.30803793111612243 0.7851377981322851]
    @test norm(a[1:2, 1:4] - a1) / norm(a) < 1.0e-9
    a1 = [0.3814043930778628 0.07295808459382358 0.9234303156836231 0.2501555942396908 0.0; 
    0.5435778459423668 0.018608588657332392 0.30803793111612243 0.7851377981322851 0.0; 
    0.0 0.0 0.0 0.0 0.0]
    a = extend(a, 3, 5)
    @test norm(a - a1) / norm(a) < 1.0e-9
    a = extend(a, 3, 5)
    @test norm(a - a1) / norm(a) < 1.0e-9
    a = extend(a, 2, 2)
    a1 = [0.3814043930778628 0.07295808459382358 Inf Inf Inf; 0.5435778459423668 0.018608588657332392 Inf Inf Inf; Inf Inf Inf Inf Inf]
    a = extend(a, 3, 5, SpkUtilities._BIGGY())
    @test a == a1
    return true
end

_test()
end # module