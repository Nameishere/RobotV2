module BaseMotorMount(){
    difference(){ 
        cylinder(15, 11,11);
        translate([0,0,4]){
            cylinder(15,10,10);
        }
        translate([0,0,1]){
            difference(){
                cylinder(15, 5.5,5.2);
                rotate([0,0,180]){
                    translate([3.8,-12,-1]){
                        cube([8, 22,20]);
                    }
                }
            }
        }
        translate([7.5,-12,-1]){
            cube([8, 22,20]);
        }
        rotate([0,0,180]){
            translate([7.5,-12,-1]){
                cube([8, 22,20]);
            }
        }
        translate([-5,-50,11]){
            cube([10,100,2]);
        }
    }
}

BaseMotorMount();