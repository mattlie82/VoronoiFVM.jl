module test_prepare_edges
using VoronoiFVM

function test()

    ## Compared with pdelib; have more of these
    nodes=transpose([
        0.0 1;
        1 0;
        0 1;
        1 1])
    
    cells=[
        1 2 3;
        2 3 4
           ]'
    cellmat=[1,1]
    bfaces=[ 1 2;
             1 3;
             2 4]'
    bfacemat=[1,1]
    
    grid=VoronoiFVM.Grid(nodes,cells,cellmat,bfaces,bfacemat)

    prepare_edges!(grid)


    grid.celledges==[3 5; 2 4; 1 3] &&       
    grid.edgenodes==[1 1 2 2 3; 2 3 3 4 4] &&
    grid.edgecells==[1 1 1 2 2; 0 0 2 0 0] 

end
end