use <line.scad>

radius = 3;

Width = 2.5;

// 1.10 is the size to friction fit to the F130 DC motor (2mm shaft)
boreRadius = 1.10;

module gear(width, bore, radius){
    
    Np = radius * 2;
    difference() {
        linear_extrude(width){
            difference(){
                circle(radius, $fn = 1000);
                for( i = [0:360/Np:360]){
                    arc1 = polyarc3(i,360/Np/3 + i,100,[0,0],radius+1);
                    arc2 = polyarc3(360/Np/4 + i,i,100,[0,0],radius-1);
                    arc3 = polyarc3(i,i- 360/Np/4,100,[0,0],radius-1);
                    arc4 = polyarc3(i - 360/Np/3, i,100,[0,0],radius+1);
                    polygon(concat(arc1,arc2, arc3,arc4));
                }
            }

        }
        
        translate([0,0,-5]){
            cylinder(width + 10 , bore, bore, $fn = 1000);
        }
    }
}

gear(Width, boreRadius, radius);
