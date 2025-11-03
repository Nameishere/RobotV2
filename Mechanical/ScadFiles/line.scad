  module line(p0, p1) {
    v = p1-p0;
    length = norm(v);
    znegative = v[2] < 0;
    xyangle = atan2(sqrt(v[0] ^ 2 + v[1] ^ 2),v[2]);
    angletoz = znegative ? 180 + xyangle : xyangle;
    
    xnegative = v[0] < 0;
    anglearoundz = atan2(v[1],v[0]);

    echo("theta:",anglearoundz)
    translate(p0){
        
        rotate([0,
                angletoz,
                anglearoundz]){
            cylinder(length, 1,1);
        }
    }
    
    
}

function van(v) = atan2(v[1],v[0]);

function polyarc(p0, p1, off, cw, n)  = 
    polyarc2(   van(p1 - p0) + atan2(off,norm(p1 - p0)/2),
                van(p1 - p0) - atan2(off,norm(p1 - p0)/2),
                cw,
                n,
                norm([norm(p1 - p0)/2,off]),
                p0);

function polyarc2(t1, t2, cw, n, length, p0)  = 
    polyarc3( cw ? t2  + 180:
                 t2  - 180,
            t1,
            n,
            p0 + [cos(t2),sin(t2)]*length,
            length);

function polyarc3(startangle, endangle, n, center, radius) = 
    [for (i = [startangle:(endangle-startangle)/n : endangle]) 
        [cos(i)*radius,sin(i)*radius] + center]; 




lines = 10000;
p0 = [10,10];
p1 = [100,100];
offset = 0;
cw = true;

size = polyarc(p0,p1,offset,cw,lines);

polygon(concat([[100,0]],size));






